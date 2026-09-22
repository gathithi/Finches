# =============================================================================
# Finches - slice the composite product sheet into individual images
#
# The sheet is one 1536x1024 grid: three handwash panels across the top,
# four product panels across the bottom. This cuts each panel out, trims the
# caption text (the site sets its own labels), and writes a full-size image
# plus a square thumbnail for each.
#
#   python slice-sheet.py "originals/<sheet>.png"
#
# Regions are fractions of the sheet: (left, top, right, bottom).
# Nudge a number and re-run if a crop clips a bottle.
# =============================================================================

import os
import sys
from PIL import Image

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "public", "assets", "img")
DETAIL = 1000      # px, long edge
THUMB = 600        # px, square
QUALITY = 86

# Top row spans y 0.02 - 0.47 (product only, above the caption).
# Bottom row spans y 0.60 - 0.94 (below its heading, above the size caption).
REGIONS = [
    # name                      left    top    right   bottom
    ("handwash-sea-breeze",     0.008,  0.035, 0.328,  0.470),
    ("handwash-sierra-mist",    0.340,  0.035, 0.660,  0.470),
    ("handwash-sweet-rose",     0.673,  0.035, 0.994,  0.470),
    # group shot starts lower, to clear the "HANDWASH" heading
    ("handwash-group",          0.008,  0.048, 0.994,  0.470),

    # bottom row: 0.592 clears the panel headings while keeping the pump tops
    ("multipurpose-detergent",  0.008,  0.592, 0.245,  0.945),
    ("dishwashing-soap",        0.257,  0.592, 0.495,  0.945),
    ("rust-stain-remover",      0.507,  0.592, 0.745,  0.945),
    ("disinfectant",            0.757,  0.592, 0.994,  0.945),
]


def square_thumb(im, size):
    """Centre crop, biased upward - the bottle sits in the top two thirds.

    Never upscales. The sheet's bottom-row panels are only ~364px, and
    blowing those up to 600 produced thumbnails larger and softer than the
    full-size image they came from.
    """
    w, h = im.size
    side = min(w, h)
    x = (w - side) // 2
    y = int((h - side) * 0.30)
    sq = im.crop((x, y, x + side, y + side))
    target = min(size, side)
    return sq if target == side else sq.resize((target, target), Image.LANCZOS)


def main():
    if len(sys.argv) < 2:
        print("usage: python slice-sheet.py <sheet.png>")
        return 1
    sheet = Image.open(sys.argv[1]).convert("RGB")
    W, H = sheet.size
    os.makedirs(OUT, exist_ok=True)
    print(f"sheet {W}x{H} -> {OUT}\n")

    for name, l, t, r, b in REGIONS:
        box = (int(W * l), int(H * t), int(W * r), int(H * b))
        panel = sheet.crop(box)

        scale = min(1.0, DETAIL / max(panel.size))
        detail = panel.resize(
            (int(panel.width * scale), int(panel.height * scale)), Image.LANCZOS
        ) if scale < 1.0 else panel

        detail.save(os.path.join(OUT, name + ".jpg"), "JPEG",
                    quality=QUALITY, optimize=True, progressive=True)
        square_thumb(panel, THUMB).save(os.path.join(OUT, name + "-thumb.jpg"), "JPEG",
                                        quality=QUALITY, optimize=True, progressive=True)

        kb = os.path.getsize(os.path.join(OUT, name + ".jpg")) / 1024
        print(f"  {name:<26} {detail.width}x{detail.height}  {kb:5.0f} KB  + thumb")

    print("\nDone. Re-run the three build scripts.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
