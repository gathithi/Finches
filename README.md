# Finches — website

Static site for **Finches**, the cleaning-products brand of **Deterpro Enterprises**, Mokoyeti West Road, Karen, Nairobi.

Plain HTML, CSS and JavaScript. No framework, no dependencies, no build step at runtime. Open `index.html` and it works.

---

## Pages

```
index.html                  Homepage
products.html               Range, sizes, WhatsApp enquiry builder
bulk.html                   Bulk & trade supply, terms, 20L jerrycans
delivery.html               Delivery options and ordering process
quality.html                KEBS approval, safe handling, dilution
about.html                  Deterpro Enterprises + the two directors
contact.html                All contact routes, hours, payment
404.html                    Branded not-found page
faq.html                    Frequently asked questions

products/handwash.html
products/multipurpose-detergent.html
products/dishwashing-soap.html
products/disinfectant.html
products/rust-stain-remover.html

public/assets/css/style.css Everything visual
public/assets/js/main.js    Nav, FAQ, order builder, scroll reveal
public/assets/img/          Photography (see below)

crop-images.ps1             Splits the product group photos
build-*.ps1                 Page generators
```

---

## Folder layout

Everything Netlify serves lives in `public/`. The build scripts, source photos and internal notes sit outside it and are never published — `netlify.toml` sets `publish = "public"`. Verified: all site paths serve, all private paths 404.

See `DEPLOY.md` for the full deployment walkthrough.

## Rebuilding the pages

Dot-source the three scripts in order, from the folder above this one:

```bash
powershell -NoProfile -Command ". .\build-finches.ps1; . .\build-pages-1.ps1; . .\build-pages-2.ps1"
```

The scripts are **ASCII-only on purpose**. PowerShell 5.1 reads `.ps1` files as ANSI unless they carry a BOM, which mangles literal dashes and breaks the parse. Using HTML entities (`&mdash;`, `&middot;`, `&ndash;`) sidesteps that entirely — please keep it that way when editing.

**Bump `$ASSETV` in `build-finches.ps1` whenever you change the CSS or JS.** It appends `?v=N` to both asset URLs so returning visitors get the new files instead of a cached copy.

---

## Adding the product photos

1. Put the originals in `originals/` with these names:

   | File | Photo |
   |---|---|
   | `originals/logo.png` | the orange Finches wordmark |
   | `originals/handwash-3.jpg` | three 500ml pump bottles |
   | `originals/spray-2.jpg` | 500ml trigger sprays |
   | `originals/bottles-1l.jpg` | 1L dish wash + 1L multipurpose |
   | `originals/drums-3.jpg` | three 20L drums |

2. Run `crop-images.ps1`. It separates each group shot, makes square thumbnails, and trims the logo into `assets/img/`.

3. Re-run the three build scripts so the pages pick the images up.

If a crop clips a bottle, adjust the `$CROPS` table at the top of `crop-images.ps1` and run it again.

**Until the images exist the site is still valid.** Every `<img>` is emitted only when its file is present, so there are no broken-image icons.

---

## Deploying to Netlify

The site is configured for Netlify. There is no build step - Netlify serves this folder as-is.

### First deploy

1. Go to app.netlify.com and sign in.
2. Drag this whole folder onto the "Deploy manually" drop zone.
3. It goes live on a `something-random.netlify.app` address within seconds, HTTPS included.

### Point deterpro.co.ke at it

1. In Netlify: **Site configuration -> Domain management -> Add a domain**, enter `deterpro.co.ke`.
2. Netlify shows you the DNS records to set. Add them wherever the domain is registered.
3. HTTPS is issued automatically once DNS resolves - no certificate to buy or renew.

### No forms to configure

There is no enquiry form. Every contact route is a direct link - WhatsApp, `tel:` and `mailto:` - so nothing needs setting up in the Netlify dashboard and nothing can silently fail. Netlify Forms is not in use.

### What is already set up

- `netlify.toml` - long cache on `/assets/*` (safe, the URLs are versioned), no cache on pages, and basic security headers. The working `originals/` folder returns 404.
- `robots.txt` and `sitemap.xml` are present; the sitemap lists 13 pages.
- `404.html` is served automatically by Netlify for unmatched paths.
- Gzip and Brotli are automatic on Netlify - nothing to switch on.

---
## Performance

| | Uncompressed | Roughly, gzipped |
|---|---|---|
| Largest page (`index.html`) | 33 KB | ~7 KB |
| `style.css` | 50 KB | ~10 KB |
| `main.js` | 11 KB | ~3.5 KB |

No web fonts, no external requests, no tracking, no framework. Type uses system fonts (Bahnschrift on Windows, DIN on macOS), so text paints immediately with no swap flash.

---

## Motion

Animation is deliberately quiet, and follows these rules:

- **Only `transform` and `opacity` are animated.** Both run on the compositor, so scrolling never triggers layout or repaint.
- **No scroll listeners.** Scroll reveals and the header shadow both use `IntersectionObserver`, and elements unobserve once they land.
- **Everything is gated on a `.js` class** set by a one-line inline script in `<head>`. With JavaScript off the page renders fully visible and static.
- **The safety net is conditional, not a timer.** `IntersectionObserver` reports on every observed element in its first callback, so silence after 2 seconds means it is genuinely broken — only then is everything revealed. A blanket timeout would reveal the whole page before the reader scrolled to it.
- **`prefers-reduced-motion` is a real off switch**, not a shortened one.

## Dark mode

A sun/moon button in the header toggles it. Light is the default; the choice is saved to `localStorage` under `finches-theme` and re-applied by a one-line inline script in `<head>` **before first paint**, so a returning dark-mode visitor never sees a white flash.

The dark palette lives in `:root[data-theme="dark"]`. It also flips `color-scheme` so form fields and scrollbars follow, and updates the `theme-color` meta so mobile browser chrome matches.

---

## The order builder

On `products.html`, customers set quantities and the page assembles a pre-filled WhatsApp message with line items and an estimated total, then opens it against **0720 100001**.

Progressive enhancement — with JavaScript off, the price table above it still works and the WhatsApp buttons still open a chat.

To change the number, edit `data-whatsapp` on the `.builder` element, or `WHATSAPP_ORDERS` at the top of `main.js`.

---

## Business details baked in

- **Payment** — M-Pesa Till 584493 (Deterpro), Co-operative Bank. New customers pay before delivery.
- **VAT** — all prices are VAT inclusive. PIN P051438845O.
- **Hours** — Mon–Fri 8am–5pm. Closed weekends.
- **Delivery** — charged by area, quoted before payment. No free-delivery threshold. Countrywide through NTL (Nationwide Transporters).
- **Trade** — minimum 12 pcs on 500ml/1L, 5 pcs on 5L/20L. 30-day terms for approved accounts. Containers refilled on request.
- **Degreaser** is listed from 5 litres up; there is no 1-litre line.
- **Handwash** comes in Sierra Mist (raspberry, yellow), Sweet Rose (strawberry, red) and Sea Breeze (apple, blue).

---

## Still to fill in

Search the folder for `class="ph"` to find every placeholder.

- **Dilution ratios per product** — deliberately blank. A wrong figure wastes product and can damage a customer's surfaces.
- KEBS permit number and Standardization Mark artwork
- Co-operative Bank account number
- Nairobi areas covered, and the same-day cut-off time
- Directors' roles, bios and photographs
- **A registered domain.** `info@deterpro.co.ke` is on every page, but `deterpro.co.ke` is not registered, so mail sent there bounces. The address lives in `$EMAIL` at the top of `build-finches.ps1` if it ever needs to change.
- Building name or landmark on Mokoyeti West Road
- **Permission to name the clients publicly** — Cleanshelf, Lancet, Norbrook, Talisman, Hillpark, La Salle and Ubuntu Academy currently appear by name on the homepage, bulk and about pages
