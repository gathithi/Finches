# =============================================================================
# Finches - pull the degreaser drum out of the marketing poster
#
# The poster carries a headline panel, feature bullets, leaves and corner
# graphics. Only the drum belongs on the site, so this crops it out and drops
# it onto clean white to match the other product shots.
#
#   python degreaser-from-poster.py originals/<poster>.webp
#
# CROP is a fraction of the poster: (left, top, right, bottom).
# =============================================================================

import os
import sys
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "public", "assets", "img")

# Measured off a grid overlay of the poster, not guessed. The drum sits at
# x 0.30-0.99, y 0.09-0.90. Left is held at 0.30 to keep the leaf tips out,
# bottom at 0.90 to stay above the blue corner swoosh.
CROP = (0.300, 0.058, 0.962, 0.898)

DETAIL = 1000
THUMB = 600
QUALITY = 86


def main():
    if len(sys.argv) < 2:
        print("usage: python degreaser-from-poster.py <poster>")
        return 1
    poster = Image.open(sys.argv[1]).convert("RGB")
    W, H = poster.size
    os.makedirs(OUT, exist_ok=True)

    l, t, r, b = CROP
    panel = poster.crop((int(W * l), int(H * t), int(W * r), int(H * b)))
    print(f"poster {W}x{H} -> drum {panel.width}x{panel.height}")

    scale = min(1.0, DETAIL / max(panel.size))
    detail = panel.resize((int(panel.width * scale), int(panel.height * scale)), Image.LANCZOS) if scale < 1 else panel
    detail.save(os.path.join(OUT, "degreaser.jpg"), "JPEG",
                quality=QUALITY, optimize=True, progressive=True)

    # square thumb: pad rather than crop, so the whole drum stays visible
    side = max(panel.size)
    square = Image.new("RGB", (side, side), (255, 255, 255))
    square.paste(panel, ((side - panel.width) // 2, (side - panel.height) // 2))
    square = square.resize((min(THUMB, side),) * 2, Image.LANCZOS)
    square.save(os.path.join(OUT, "degreaser-thumb.jpg"), "JPEG",
                quality=QUALITY, optimize=True, progressive=True)

    for n in ("degreaser.jpg", "degreaser-thumb.jpg"):
        kb = os.path.getsize(os.path.join(OUT, n)) / 1024
        print(f"  {n:<26} {kb:5.0f} KB")
    return 0


if __name__ == "__main__":
    sys.exit(main())
