# =============================================================================
# Finches - the one image the product sheet could not supply
#
#  handwash-group-thumb - a square composite of all three handwash bottles.
#                         A centre-crop of the wide group strip showed only the
#                         middle bottle, so this packs all three into the square.
#
#   python extra-images.py
#
# The degreaser USED to be made here, cropped out of the archived drums photo.
# It now comes from the marketing poster instead - see degreaser-from-poster.py,
# which is a much cleaner shot. That code is gone from this file deliberately:
# leaving it in meant any re-run of this script silently overwrote the good
# poster crop with the old one.
# =============================================================================

import os
from PIL import Image

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "public", "assets", "img")
QUALITY = 86


def trim_white(im, threshold=246):
    """Crop away near-white margins so the bottle fills its box."""
    g = im.convert("L")
    w, h = g.size
    px = g.load()

    def col_blank(x):
        return all(px[x, y] >= threshold for y in range(0, h, 3))

    def row_blank(y):
        return all(px[x, y] >= threshold for x in range(0, w, 3))

    left = 0
    while left < w - 1 and col_blank(left):
        left += 1
    right = w - 1
    while right > left and col_blank(right):
        right -= 1
    top = 0
    while top < h - 1 and row_blank(top):
        top += 1
    bottom = h - 1
    while bottom > top and row_blank(bottom):
        bottom -= 1
    return im.crop((left, top, right + 1, bottom + 1))


def make_handwash_square(size=600, pad=14):
    """All three bottles packed into one square, on the sheet's own white."""
    names = ["handwash-sea-breeze.jpg", "handwash-sierra-mist.jpg", "handwash-sweet-rose.jpg"]
    paths = [os.path.join(OUT, n) for n in names]
    if not all(os.path.exists(p) for p in paths):
        print("  skip  handwash square - individual bottles not found")
        return

    bottles = [trim_white(Image.open(p).convert("RGB")) for p in paths]

    # Scale each panel to fill the available height, then crop its width to
    # the slot. Fitting by width instead left the bottles tiny, because the
    # props (shells, roses) stretch each panel far wider than the bottle.
    inner_w = size - pad * 2
    slot_w = inner_w // 3
    max_h = size - pad * 2

    scaled = []
    for b in bottles:
        s = max_h / b.height
        big = b.resize((max(1, int(b.width * s)), max_h), Image.LANCZOS)
        if big.width > slot_w:
            x = (big.width - slot_w) // 2
            big = big.crop((x, 0, x + slot_w, big.height))
        scaled.append(big)

    canvas = Image.new("RGB", (size, size), (255, 255, 255))
    for i, im in enumerate(scaled):
        x = pad + i * slot_w + (slot_w - im.width) // 2
        canvas.paste(im, (x, pad))

    # Quality 78, not 86. Three bottles of fine detail in one 600px square came
    # out at 73 KB - heavier than the full-size image it sits next to. 78 halves
    # that with no visible loss at the size this card actually renders.
    canvas.save(os.path.join(OUT, "handwash-group-thumb.jpg"), "JPEG",
                quality=78, optimize=True, progressive=True)
    kb = os.path.getsize(os.path.join(OUT, "handwash-group-thumb.jpg")) / 1024
    print(f"  ok    handwash-group-thumb.jpg  {size}x{size}  {kb:.0f} KB  (all three bottles)")


if __name__ == "__main__":
    os.makedirs(OUT, exist_ok=True)
    print(f"\nwriting to {OUT}\n")
    make_handwash_square()
    print("\nDone. Re-run the three build scripts.\n")
