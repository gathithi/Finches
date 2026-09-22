# =============================================================================
# Finches - image preparation
#
# Drop the original photos into  originals\  with these exact names:
#
#   originals\logo.png          the orange "Finches" wordmark
#   originals\handwash-3.jpg    the three 500ml pump bottles
#   originals\spray-2.jpg       the 500ml trigger sprays
#   originals\bottles-1l.jpg    the 1L dish wash + 1L multipurpose pair
#   originals\drums-3.jpg       the three 20L drums
#
# Then run:   powershell -ExecutionPolicy Bypass -File crop-images.ps1
#
# Output lands in  assets\img\  - one full-size shot and one square thumbnail
# per product, plus the trimmed logo. Re-run any time; it overwrites.
#
# The CROPS table is in fractions of each source image (left, top, right,
# bottom, each 0..1). Nudge a number and re-run if a crop clips a bottle.
#
# Note on the handwash: the bottles are ordered yellow, red, blue in the photo,
# which maps to Sierra Mist (raspberry), Sweet Rose (strawberry) and
# Sea Breeze (apple).
# =============================================================================

Add-Type -AssemblyName System.Drawing
$ErrorActionPreference = 'Stop'

$here   = Split-Path -Parent $MyInvocation.MyCommand.Path
$src    = Join-Path $here 'originals'
$out    = Join-Path $here 'public\assets\img'
$DETAIL = 1000   # px, long edge, for product pages
$THUMB  = 600    # px, square, for cards
$QUALITY = 82

if (-not (Test-Path $src)) { New-Item -ItemType Directory -Force -Path $src | Out-Null }
if (-not (Test-Path $out)) { New-Item -ItemType Directory -Force -Path $out | Out-Null }

$CROPS = @(
  # source            output name                  L      T      R      B
  @('handwash-3.jpg', 'handwash-sierra-mist',      0.075, 0.11,  0.395, 0.92),
  @('handwash-3.jpg', 'handwash-sweet-rose',       0.375, 0.11,  0.665, 0.92),
  @('handwash-3.jpg', 'handwash-sea-breeze',       0.645, 0.11,  0.98,  0.92),
  @('handwash-3.jpg', 'handwash-group',            0.02,  0.06,  1.00,  0.97),

  @('spray-2.jpg',    'rust-stain-remover',        0.04,  0.01,  0.53,  0.95),
  @('spray-2.jpg',    'rust-stain-remover-group',  0.00,  0.00,  1.00,  1.00),

  @('bottles-1l.jpg', 'dishwashing-soap',          0.10,  0.05,  0.545, 0.98),
  @('bottles-1l.jpg', 'multipurpose-detergent',    0.515, 0.05,  0.96,  0.98),
  @('bottles-1l.jpg', 'bottles-1l-group',          0.00,  0.00,  1.00,  1.00),

  @('drums-3.jpg',    'drum-multipurpose',         0.02,  0.05,  0.345, 0.98),
  @('drums-3.jpg',    'drum-degreaser',            0.325, 0.05,  0.655, 0.98),
  @('drums-3.jpg',    'drum-disinfectant',         0.635, 0.05,  0.99,  0.98),
  @('drums-3.jpg',    'drums-group',               0.00,  0.00,  1.00,  1.00)
)

function Get-JpegEncoder {
  [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
}

function Save-Jpeg {
  param([System.Drawing.Bitmap]$Bitmap, [string]$Path, [int]$Quality = 82)
  $enc = Get-JpegEncoder
  $ps = New-Object System.Drawing.Imaging.EncoderParameters(1)
  $ps.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [int64]$Quality)
  $Bitmap.Save($Path, $enc, $ps)
  $ps.Dispose()
}

function New-Resized {
  param([System.Drawing.Image]$Image, [int]$W, [int]$H)
  $bmp = New-Object System.Drawing.Bitmap($W, $H)
  $bmp.SetResolution(72, 72)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode  = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.SmoothingMode      = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $g.PixelOffsetMode    = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
  $g.DrawImage($Image, (New-Object System.Drawing.Rectangle(0, 0, $W, $H)))
  $g.Dispose()
  return $bmp
}

function New-Crop {
  param([System.Drawing.Image]$Image, [double]$L, [double]$T, [double]$R, [double]$B)
  $x = [int][Math]::Floor($Image.Width  * $L)
  $y = [int][Math]::Floor($Image.Height * $T)
  $w = [int][Math]::Ceiling($Image.Width  * ($R - $L))
  $h = [int][Math]::Ceiling($Image.Height * ($B - $T))
  if ($x + $w -gt $Image.Width)  { $w = $Image.Width  - $x }
  if ($y + $h -gt $Image.Height) { $h = $Image.Height - $y }
  $rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
  $bmp = New-Object System.Drawing.Bitmap($w, $h)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.DrawImage($Image, (New-Object System.Drawing.Rectangle(0, 0, $w, $h)), $rect, [System.Drawing.GraphicsUnit]::Pixel)
  $g.Dispose()
  return $bmp
}

function New-SquareThumb {
  param([System.Drawing.Image]$Image, [int]$Size)
  $side = [Math]::Min($Image.Width, $Image.Height)
  $x = [int](($Image.Width  - $side) / 2)
  $y = [int](($Image.Height - $side) / 2)
  # Bias upward - the bottle is usually in the top two thirds.
  $y = [int]($y * 0.45)
  $rect = New-Object System.Drawing.Rectangle($x, $y, $side, $side)
  $bmp = New-Object System.Drawing.Bitmap($Size, $Size)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $g.DrawImage($Image, (New-Object System.Drawing.Rectangle(0, 0, $Size, $Size)), $rect, [System.Drawing.GraphicsUnit]::Pixel)
  $g.Dispose()
  return $bmp
}

function Invoke-LogoTrim {
  # @() matters: with a single match the pipeline returns a string, and
  # $candidates[0] would index its first character rather than the path.
  $candidates = @(@('logo.png', 'logo.jpg', 'logo.jpeg') | ForEach-Object { Join-Path $src $_ } | Where-Object { Test-Path $_ })
  if ($candidates.Count -eq 0) { Write-Host "  skip  logo (not found in originals\)" -ForegroundColor DarkYellow; return }
  $path = $candidates[0]

  $img = [System.Drawing.Image]::FromFile($path)
  $bmp = New-Object System.Drawing.Bitmap($img)
  $img.Dispose()

  $minX = $bmp.Width; $minY = $bmp.Height; $maxX = 0; $maxY = 0
  for ($y = 0; $y -lt $bmp.Height; $y++) {
    for ($x = 0; $x -lt $bmp.Width; $x++) {
      $p = $bmp.GetPixel($x, $y)
      $isBlank = ($p.A -lt 16) -or ($p.R -gt 243 -and $p.G -gt 243 -and $p.B -gt 243)
      if (-not $isBlank) {
        if ($x -lt $minX) { $minX = $x }
        if ($y -lt $minY) { $minY = $y }
        if ($x -gt $maxX) { $maxX = $x }
        if ($y -gt $maxY) { $maxY = $y }
      }
    }
  }
  if ($maxX -le $minX -or $maxY -le $minY) {
    Write-Host "  warn  logo looks blank; kept untrimmed" -ForegroundColor DarkYellow
    $minX = 0; $minY = 0; $maxX = $bmp.Width - 1; $maxY = $bmp.Height - 1
  }

  $pad = 6
  $minX = [Math]::Max(0, $minX - $pad); $minY = [Math]::Max(0, $minY - $pad)
  $maxX = [Math]::Min($bmp.Width - 1, $maxX + $pad); $maxY = [Math]::Min($bmp.Height - 1, $maxY + $pad)

  $w = $maxX - $minX + 1; $h = $maxY - $minY + 1
  $rect = New-Object System.Drawing.Rectangle($minX, $minY, $w, $h)
  $trim = $bmp.Clone($rect, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)

  $targetH = 160
  $targetW = [int]([Math]::Round($w * ($targetH / $h)))
  $small = New-Resized -Image $trim -W $targetW -H $targetH
  $small.Save((Join-Path $out 'logo.png'), [System.Drawing.Imaging.ImageFormat]::Png)

  Write-Host ("  ok    logo.png  ({0}x{1}, trimmed from {2}x{3})" -f $targetW, $targetH, $bmp.Width, $bmp.Height)
  $small.Dispose(); $trim.Dispose(); $bmp.Dispose()
}

Write-Host ""
Write-Host "Preparing Finches images" -ForegroundColor Cyan
Write-Host ("  source: " + $src)
Write-Host ("  output: " + $out)
Write-Host ""

Invoke-LogoTrim

$cache = @{}
foreach ($job in $CROPS) {
  $file = $job[0]; $name = $job[1]
  $path = Join-Path $src $file
  if (-not (Test-Path $path)) { Write-Host ("  skip  {0} (missing originals\{1})" -f $name, $file) -ForegroundColor DarkYellow; continue }

  if (-not $cache.ContainsKey($file)) { $cache[$file] = [System.Drawing.Image]::FromFile($path) }
  $img = $cache[$file]

  $crop = New-Crop -Image $img -L $job[2] -T $job[3] -R $job[4] -B $job[5]

  # NOTE: locals must not collide with $DETAIL / $THUMB. PowerShell variable
  # names are case-insensitive, so a local $detail would silently overwrite
  # the $DETAIL constant and the next iteration would divide by a Bitmap.
  $scale = $DETAIL / [Math]::Max($crop.Width, $crop.Height)
  if ($scale -gt 1) { $scale = 1 }
  $dw = [int]($crop.Width * $scale); $dh = [int]($crop.Height * $scale)
  $detailImg = New-Resized -Image $crop -W $dw -H $dh
  Save-Jpeg -Bitmap $detailImg -Path (Join-Path $out ($name + '.jpg')) -Quality $QUALITY

  $thumbImg = New-SquareThumb -Image $crop -Size $THUMB
  Save-Jpeg -Bitmap $thumbImg -Path (Join-Path $out ($name + '-thumb.jpg')) -Quality $QUALITY

  $kb = [math]::Round((Get-Item (Join-Path $out ($name + '.jpg'))).Length / 1kb)
  Write-Host ("  ok    {0}.jpg  ({1}x{2}, {3} KB)  + -thumb.jpg" -f $name, $dw, $dh, $kb)

  $detailImg.Dispose(); $thumbImg.Dispose(); $crop.Dispose()
}

foreach ($img in $cache.Values) { $img.Dispose() }

Write-Host ""
Write-Host "Done. Check assets\img\ then re-run the three build scripts." -ForegroundColor Cyan
Write-Host ""
