# Builds the Finches static site. Emits plain HTML - no runtime build step.
# ASCII-only on purpose: PowerShell 5.1 reads .ps1 as ANSI without a BOM,
# which mangles literal dashes. HTML entities sidestep that entirely.
$ErrorActionPreference = 'Stop'
$root = "C:\Users\farai\AppData\Local\Temp\claude\C--Users-farai--claude\b04b4455-a2d1-4cd4-a269-4bf5637e056f\scratchpad\finches-site\public"

$ASSETV = '15'  # bump on every CSS/JS change to bust browser caches

# ---------------------------------------------------------------- contact
# The only place the email address appears. Every page, the footer, the closing
# block, the contact cards and the structured data all read from it, so change
# it here and rebuild rather than editing pages.
# NOTE: this address only works once deterpro.co.ke is registered and a mailbox
# points at it. The domain is currently unregistered, so mail to it bounces.
$EMAIL = 'info@deterpro.co.ke'

# ---------------------------------------------------------------- tracking
# Paste your IDs here and rebuild. Leave any of them empty and nothing at all
# is emitted for it - no script, no request, no cookie. The site ships clean
# until you deliberately turn a tool on.

$GA4_ID        = ''            # e.g. G-XXXXXXXXXX   (Google Analytics 4)
$META_PIXEL_ID = ''            # e.g. 1234567890123  (Meta Pixel)
$GSC_VERIFY    = ''            # the content="..." value from Search Console

# Kenya's Data Protection Act 2019 applies to cookie-based tracking. With this
# true, no tracker loads until the visitor accepts, and the banner is skipped
# entirely when no tracking IDs are set. Change only deliberately.
$REQUIRE_CONSENT = $true

function Get-TrackingHead {
  $out = ''
  if ($GSC_VERIFY) {
    $out += "<meta name=""google-site-verification"" content=""$GSC_VERIFY"">`n"
  }
  if ($GA4_ID -or $META_PIXEL_ID) {
    $consent = if ($REQUIRE_CONSENT) { 'true' } else { 'false' }
    $out += "<script>window.FINCHES_TRACKING={ga4:'$GA4_ID',pixel:'$META_PIXEL_ID',requireConsent:$consent};</script>`n"
  }
  return $out.TrimEnd()
}

$SHELL = @'
<!doctype html>
<html lang="en-KE">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{TITLE}}</title>
<meta name="description" content="{{DESC}}">
<meta name="color-scheme" content="light">
<meta name="theme-color" content="#EE7B18">
<script>(function(){try{var t=localStorage.getItem('finches-theme');if(t==='dark'||t==='light'){document.documentElement.setAttribute('data-theme',t);}}catch(e){}document.documentElement.classList.add('js');})();</script>
<link rel="canonical" href="https://deterpro.co.ke/{{CANON}}">
<meta property="og:type" content="website">
<meta property="og:site_name" content="Finches by Deterpro Enterprises">
<meta property="og:title" content="{{TITLE}}">
<meta property="og:description" content="{{DESC}}">
<meta property="og:locale" content="en_KE">
<meta property="og:url" content="https://deterpro.co.ke/{{CANON}}">
<meta property="og:image" content="https://deterpro.co.ke/assets/img/og-card.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta property="og:image:alt" content="Finches - soaps and cleaning agents, KEBS approved, made in Nairobi">
<meta name="twitter:card" content="summary_large_image">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Cpath d='M25 8a6 6 0 0 0-9.6-1.4C12 9.6 9 12 5.5 13.2c-.9.3-.9 1.5 0 1.8 2 .7 3.4 1.4 4.6 2.6 2.4 2.4 3.1 6 6.6 7.5 4.2 1.8 9-1.1 9.5-5.6.3-2.6-.8-4.4-1.8-6-.6-1-.9-2-.9-3 0-.9.2-1.7.5-2.5z' fill='%233DAE2B'/%3E%3C/svg%3E">
{{TRACKING}}
<link rel="stylesheet" href="{{BASE}}assets/css/style.css?v={{ASSETV}}">
<script src="{{BASE}}assets/js/main.js?v={{ASSETV}}" defer></script>
{{EXTRAHEAD}}
</head>
<body>
<a class="skip-link" href="#main">Skip to content</a>

<header class="site-header">
  <div class="wrap site-header__inner">
    <a class="logo" href="{{BASE}}index.html">
      {{LOGO}}
    </a>

    <div class="site-header__tools">
      <button class="theme-toggle" type="button" aria-pressed="false" aria-label="Switch to dark mode" title="Switch to dark mode">
        <svg class="theme-toggle__sun" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">
          <circle cx="12" cy="12" r="4.2"/>
          <path d="M12 2.5v2.2M12 19.3v2.2M4.2 4.2l1.6 1.6M18.2 18.2l1.6 1.6M2.5 12h2.2M19.3 12h2.2M4.2 19.8l1.6-1.6M18.2 5.8l1.6-1.6"/>
        </svg>
        <svg class="theme-toggle__moon" width="20" height="20" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
          <path d="M20.5 14.6A8.6 8.6 0 0 1 9.4 3.5a8.6 8.6 0 1 0 11.1 11.1z"/>
        </svg>
      </button>

      <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="site-nav" aria-label="Open menu">
        <span class="nav-toggle__bars" aria-hidden="true"></span>
      </button>
    </div>

    <nav class="site-nav" id="site-nav" aria-label="Primary">
      <a href="{{BASE}}index.html">Home</a>
      <a href="{{BASE}}products.html">Products</a>
      <a href="{{BASE}}bulk.html">Bulk &amp; Trade</a>
      <a href="{{BASE}}delivery.html">Delivery</a>
      <a href="{{BASE}}quality.html">Quality</a>
      <a href="{{BASE}}about.html">About</a>
      <a href="{{BASE}}faq.html">FAQ</a>
      <a href="{{BASE}}contact.html">Contact</a>
    </nav>

    <a class="btn btn--primary site-header__cta" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20I%20would%20like%20to%20order%3A">Order</a>
  </div>
</header>

<main id="main">
{{BODY}}
</main>

<footer class="site-footer">
  <div class="wrap site-footer__inner">
    <div>
      <h2>Finches</h2>
      <p>Quality soaps and cleaning agents, made in Karen, Nairobi and approved by the Kenya Bureau of Standards.</p>
    </div>
    <div>
      <h2>Products</h2>
      <ul>
        <li><a href="{{BASE}}products/handwash.html">Antibacterial Handwash</a></li>
        <li><a href="{{BASE}}products/multipurpose-detergent.html">Multipurpose Detergent</a></li>
        <li><a href="{{BASE}}products/dishwashing-soap.html">Dishwashing Soap</a></li>
        <li><a href="{{BASE}}products/disinfectant.html">Disinfectant</a></li>
        <li><a href="{{BASE}}products/rust-stain-remover.html">Rust &amp; Stain Remover</a></li>
      </ul>
    </div>
    <div>
      <h2>Company</h2>
      <ul>
        <li><a href="{{BASE}}index.html">Home</a></li>
        <li><a href="{{BASE}}about.html">About Deterpro</a></li>
        <li><a href="{{BASE}}quality.html">Quality &amp; Safety</a></li>
        <li><a href="{{BASE}}bulk.html">Bulk &amp; Trade</a></li>
        <li><a href="{{BASE}}delivery.html">Delivery</a></li>
        <li><a href="{{BASE}}faq.html">FAQ</a></li>
      </ul>
    </div>
    <div>
      <h2>Contact</h2>
      <ul>
        <li><a href="tel:+254720100001">0720 100001</a> &middot; <a href="https://wa.me/254720100001">WhatsApp</a></li>
        <li><a href="tel:+254722552852">0722 552852</a> &middot; <a href="https://wa.me/254722552852">WhatsApp</a></li>
        <li><a href="mailto:{{EMAIL}}">{{EMAIL}}</a></li>
        <li>Mokoyeti West Road, off Langata Road<br>Karen, Nairobi</li>
        <li>P.O. Box 41514-00100, Nairobi</li>
        <li>Mon&ndash;Fri 8am&ndash;5pm</li>
      </ul>
    </div>
  </div>
  <div class="wrap site-footer__legal">
    <span>&copy; <span data-year>2026</span> Deterpro Enterprises. All Rights Reserved.</span>
  </div>
</footer>

<a class="wa-float" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20I%20would%20like%20to%20order%3A" aria-label="Order on WhatsApp">
  <svg width="22" height="22" viewBox="0 0 24 24" aria-hidden="true" fill="currentColor"><path d="M12 2a10 10 0 0 0-8.6 15l-1.3 4.7 4.8-1.3A10 10 0 1 0 12 2zm5.8 14.2c-.2.7-1.4 1.3-2 1.4-.5.1-1.1.1-1.8-.1-.4-.1-1-.3-1.7-.6-3-1.3-4.9-4.3-5-4.5-.2-.2-1.2-1.6-1.2-3s.7-2.1 1-2.4c.3-.3.6-.4.8-.4h.6c.2 0 .4 0 .7.5l.9 2.2c.1.2.1.4 0 .6l-.4.5-.3.4c-.1.1-.3.3-.1.6.2.3.8 1.3 1.7 2.1 1.1 1 2 1.3 2.3 1.5.3.1.5.1.6 0l.9-1.1c.2-.2.4-.2.6-.1l2.1 1c.3.1.5.2.5.3.1.2.1.7-.2 1.4z"/></svg>
  <span>Order</span>
</a>
</body>
</html>
'@

# ---------------------------------------------------------------- image helpers
# Photos are emitted only when the file exists, so the site is valid before any
# photography lands and upgrades itself on the next build.

function Test-Img { param([string]$Name) Test-Path (Join-Path $root ("assets\img\" + $Name)) }

function Get-Shot {
  param([string]$Name, [string]$Alt, [string]$Caption = '', [string]$Base = '')
  if (-not (Test-Img $Name)) { return '' }
  $cap = if ($Caption) { "<figcaption>$Caption</figcaption>" } else { '' }
  return "<figure class=""shot""><img src=""${Base}assets/img/$Name"" alt=""$Alt"" width=""1000"" height=""1000"" loading=""lazy"" decoding=""async"">$cap</figure>"
}

function Get-Thumb {
  param([string]$Name, [string]$Alt, [string]$Base = '')
  if (-not (Test-Img $Name)) { return '' }
  return "<div class=""product__media""><img src=""${Base}assets/img/$Name"" alt=""$Alt"" width=""600"" height=""600"" loading=""lazy"" decoding=""async""></div>"
}

# A director's portrait when the file exists; otherwise a quiet strip rather
# than a large empty slab sitting in the middle of the About page.
function Get-PersonPhoto {
  param([string]$Name, [string]$Alt)
  if (Test-Img $Name) {
    return "<div class=""person__photo""><img src=""assets/img/$Name"" alt=""$Alt"" width=""800"" height=""600"" loading=""lazy"" decoding=""async""></div>"
  }
  return "<div class=""person__photo person__photo--empty""><span>Photograph to come</span></div>"
}

function Get-Logo {
  param([string]$Base = '')
  if (Test-Img 'logo.png') {
    return "<img class=""logo__img"" src=""${Base}assets/img/logo.png"" alt=""Finches"" width=""200"" height=""64"" fetchpriority=""high"">"
  }
  return @"
<svg width="32" height="32" viewBox="0 0 32 32" role="img" aria-label="Finches">
        <path d="M25 8a6 6 0 0 0-9.6-1.4C12 9.6 9 12 5.5 13.2c-.9.3-.9 1.5 0 1.8 2 .7 3.4 1.4 4.6 2.6 2.4 2.4 3.1 6 6.6 7.5 4.2 1.8 9-1.1 9.5-5.6.3-2.6-.8-4.4-1.8-6-.6-1-.9-2-.9-3 0-.9.2-1.7.5-2.5z" fill="var(--green)"/>
        <circle cx="21.4" cy="10.6" r="1.3" fill="var(--ground)"/>
        <path d="M27.5 9.2 31.5 7.4l-3.6 3.4z" fill="var(--yellow)"/>
      </svg>
      <span class="logo__type">
        <span class="logo__name">Finches</span>
        <span class="logo__by">By Deterpro Enterprises</span>
      </span>
"@
}

function New-Page {
  param([string]$Path, [string]$Title, [string]$Desc, [string]$Canon, [string]$Body, [string]$Base = '', [string]$ExtraHead = '')
  # {{EMAIL}} is substituted last, after {{BODY}}, so the token works in page
  # bodies and shared blocks as well as in the shell itself.
  $html = $SHELL.Replace('{{LOGO}}', (Get-Logo -Base $Base)).Replace('{{TRACKING}}', (Get-TrackingHead)).Replace('{{ASSETV}}', $ASSETV).Replace('{{TITLE}}', $Title).Replace('{{DESC}}', $Desc).Replace('{{CANON}}', $Canon).Replace('{{BASE}}', $Base).Replace('{{EXTRAHEAD}}', $ExtraHead).Replace('{{BODY}}', $Body).Replace('{{EMAIL}}', $EMAIL)
  $full = Join-Path $root $Path
  $dir = Split-Path $full -Parent
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  [System.IO.File]::WriteAllText($full, $html, (New-Object System.Text.UTF8Encoding($false)))
  Write-Host ("  " + $Path + "  (" + [math]::Round($html.Length/1kb,1) + " KB)")
}

# ---------------------------------------------------------------- shared blocks

$CLOSING = @'
<section class="close">
  <div class="wrap close__inner">
    <p class="eyebrow" style="color:var(--ground);opacity:.6">Get a price today</p>
    <h2>Tell us what you clean.<br><em>We will tell you what you need.</em></h2>
    <p>Send your list on WhatsApp and we will come back with a total, a delivery cost and the right dilution for the job. Not sure which product suits your surfaces? Describe them and we will advise.</p>
    <div class="close__lines">
      <span>Call or WhatsApp <a href="tel:+254720100001">0720 100001</a></span>
      <span>Call or WhatsApp <a href="tel:+254722552852">0722 552852</a></span>
      <span><a href="mailto:{{EMAIL}}">{{EMAIL}}</a></span>
      <span>Mon&ndash;Fri 8am&ndash;5pm</span>
    </div>
    <div class="actions">
      <a class="btn btn--yellow" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20I%20would%20like%20to%20order%3A">Message 0720 100001</a>
      <a class="btn btn--ghost" href="https://wa.me/254722552852?text=Hello%20Finches%2C%20I%20would%20like%20to%20order%3A">Message 0722 552852</a>
    </div>
  </div>
</section>
'@

# One row per product rather than one per size. With figures replaced by "On
# enquiry", nineteen rows of the same two words read as a fault; the sizes
# carry the information instead.
$PRICETABLE = @'
<div class="table-scroll">
  <table>
    <caption>Finches by Deterpro Enterprises &mdash; the full range. Prices on enquiry, VAT inclusive.</caption>
    <thead>
      <tr><th scope="col">Product</th><th scope="col">Containers we fill</th><th scope="col" class="price">Price</th></tr>
    </thead>
    <tbody>
      <tr style="--code:var(--p-handwash)"><td><i class="rowcode" aria-hidden="true"></i>Antibacterial Handwash</td><td class="vol">500 ml &middot; 5 L &middot; 20 L</td><td class="price">On enquiry</td></tr>
      <tr style="--code:var(--p-multi)"><td><i class="rowcode" aria-hidden="true"></i>Multipurpose Detergent</td><td class="vol">1 L &middot; 5 L &middot; 20 L</td><td class="price">On enquiry</td></tr>
      <tr style="--code:var(--p-dish)"><td><i class="rowcode" aria-hidden="true"></i>Dishwashing Soap</td><td class="vol">1 L &middot; 5 L &middot; 20 L</td><td class="price">On enquiry</td></tr>
      <tr style="--code:var(--p-disinfect)"><td><i class="rowcode" aria-hidden="true"></i>Disinfectant</td><td class="vol">500 ml &middot; 1 L &middot; 5 L &middot; 20 L</td><td class="price">On enquiry</td></tr>
      <tr style="--code:var(--p-stain)"><td><i class="rowcode" aria-hidden="true"></i>Rust &amp; Stain Remover</td><td class="vol">500 ml &middot; 1 L &middot; 5 L &middot; 20 L</td><td class="price">On enquiry</td></tr>
    </tbody>
  </table>
</div>
'@

$CLIENTS = @'
<ul class="clients">
  <li class="client"><span class="client__name">Cleanshelf Supermarkets</span><span class="client__cat">Supermarket chain</span></li>
  <li class="client"><span class="client__name">Lancet Laboratories</span><span class="client__cat">Medical laboratories</span></li>
  <li class="client"><span class="client__name">Norbrook Kenya Ltd</span><span class="client__cat">Manufacturing</span></li>
  <li class="client"><span class="client__name">Talisman Hotel</span><span class="client__cat">Hotel &amp; restaurant</span></li>
  <li class="client"><span class="client__name">Hillpark Hotel</span><span class="client__cat">Hotel</span></li>
  <li class="client"><span class="client__name">La Salle Catholic Primary School</span><span class="client__cat">Primary school</span></li>
  <li class="client"><span class="client__name">Ubuntu Academy</span><span class="client__cat">School</span></li>
</ul>
'@

$SCALEFIG = @'
<figure class="scale">
  <figcaption class="scale__caption">Sizes we fill, shown to scale</figcaption>
  <div class="scale__item">
    <svg width="34" height="59" viewBox="0 0 40 70" role="img" aria-label="500 millilitre bottle">
      <defs><clipPath id="c500"><path d="M15 8h10l5 8v48a4 4 0 0 1-4 4H14a4 4 0 0 1-4-4V16z"/></clipPath></defs>
      <rect x="16" y="1" width="8" height="7" fill="var(--ink-muted)"/>
      <g clip-path="url(#c500)"><rect width="40" height="70" fill="var(--surface-sunk)"/><rect class="fill" y="22" width="40" height="48" fill="var(--p-handwash)"/></g>
      <path d="M15 8h10l5 8v48a4 4 0 0 1-4 4H14a4 4 0 0 1-4-4V16z" fill="none" stroke="var(--ink)" stroke-width="1.6"/>
    </svg>
    <span class="scale__label">500 ml</span>
  </div>
  <div class="scale__item">
    <svg width="42" height="74" viewBox="0 0 44 78" role="img" aria-label="1 litre bottle">
      <defs><clipPath id="c1"><path d="M16 9h12l5 9v52a4 4 0 0 1-4 4H15a4 4 0 0 1-4-4V18z"/></clipPath></defs>
      <rect x="17" y="1" width="10" height="8" fill="var(--ink-muted)"/>
      <g clip-path="url(#c1)"><rect width="44" height="78" fill="var(--surface-sunk)"/><rect class="fill" y="24" width="44" height="54" fill="var(--p-multi)"/></g>
      <path d="M16 9h12l5 9v52a4 4 0 0 1-4 4H15a4 4 0 0 1-4-4V18z" fill="none" stroke="var(--ink)" stroke-width="1.6"/>
    </svg>
    <span class="scale__label">1 litre</span>
  </div>
  <div class="scale__item">
    <svg width="74" height="126" viewBox="0 0 78 132" role="img" aria-label="5 litre jerrycan">
      <defs><clipPath id="c5"><rect x="8" y="30" width="62" height="98" rx="5"/></clipPath></defs>
      <path d="M22 30V16h34v14" fill="none" stroke="var(--ink)" stroke-width="4" stroke-linecap="square"/>
      <rect x="52" y="8" width="14" height="12" fill="var(--ink-muted)"/>
      <g clip-path="url(#c5)"><rect width="78" height="132" fill="var(--surface-sunk)"/><rect class="fill" y="44" width="78" height="88" fill="var(--p-dish)"/></g>
      <rect x="8" y="30" width="62" height="98" rx="5" fill="none" stroke="var(--ink)" stroke-width="1.9"/>
    </svg>
    <span class="scale__label">5 litres</span>
  </div>
  <div class="scale__item">
    <svg width="112" height="200" viewBox="0 0 116 206" role="img" aria-label="20 litre jerrycan">
      <defs><clipPath id="c20"><rect x="10" y="42" width="96" height="158" rx="7"/></clipPath></defs>
      <path d="M30 42V22h52v20" fill="none" stroke="var(--ink)" stroke-width="5" stroke-linecap="square"/>
      <rect x="78" y="10" width="20" height="16" fill="var(--ink-muted)"/>
      <g clip-path="url(#c20)"><rect width="116" height="206" fill="var(--surface-sunk)"/><rect class="fill" y="66" width="116" height="140" fill="var(--p-disinfect)"/></g>
      <rect x="10" y="42" width="96" height="158" rx="7" fill="none" stroke="var(--ink)" stroke-width="2.2"/>
      <g stroke="var(--ink)" stroke-width="1.2" opacity=".4"><line x1="96" y1="80" x2="106" y2="80"/><line x1="96" y1="115" x2="106" y2="115"/><line x1="96" y1="150" x2="106" y2="150"/></g>
    </svg>
    <span class="scale__label">20 litres</span>
  </div>
  <p class="scale__foot">Heights drawn in true volumetric proportion</p>
</figure>
'@

Write-Host "Building Finches site..."
Write-Host ""
