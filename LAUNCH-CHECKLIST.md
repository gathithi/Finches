# Launch checklist — Finches

Two parts: **what I tested and fixed** (done), and **what only you can do** (open).

---

# PART 1 — Tested and fixed

## Speed ✅

Measured in the browser, not estimated.

| | Result |
|---|---|
| Requests for a first visit | **3** (HTML, CSS, JS) |
| Weight, gzipped | **20.6 KB** |
| DOM interactive | **39 ms** |
| DOM complete | **115 ms** |
| External hosts contacted | **0** |
| Render-blocking scripts | **0** |

- No web fonts. Type uses Bahnschrift (Windows) / DIN (macOS) with fallbacks, so text paints instantly with no swap flash.
- One render-blocking stylesheet, which is correct — blocking on CSS prevents a flash of unstyled content.
- Both scripts are `defer`; the only inline script is 204 bytes (the theme, which must run before paint).
- Netlify gzips and Brotlis automatically. Nothing to switch on.
- Asset URLs carry `?v=N`, so `netlify.toml` caches them for a year while pages stay fresh.

## Mobile ✅

Tested at **320 px** (smallest common phone) as well as 375 and 1280.

- No horizontal overflow at any width. Price tables scroll inside their own container rather than pushing the page sideways.
- **Fixed:** the "Details →" link on product cards was a 24 px tap target. Now 44 px on phones.
- **Fixed:** footer links were 18 px. Now 34 px with padding.
- **Fixed:** a dozen labels sat at 9–11 px — hard to read on a phone. Raised the floor below 48 em: KEBS mark, table headers, trade labels, step numbers, captions.
- Quantity steppers are 44 px on touch, 36 px where there's a mouse.

## SEO ✅

- All 15 pages: **unique title, unique description, exactly one H1, canonical URL.** No duplicates.
- Titles all render at 58 characters or under; descriptions 77–164.
- **Fixed:** the homepage description was 191 characters and would have been truncated. Now 154.
- **Added: `robots.txt`** — allows everything, blocks the `originals/` working folder, points to the sitemap.
- **Added: `sitemap.xml`** — 14 URLs with priorities. The 404 page is excluded.
- **Added: `404.html`** — branded, with routes to products, bulk, delivery and contact instead of a dead end. Netlify serves it automatically.
- **Added: social sharing** — `og:image`, `og:url`, `og:image:alt` and `twitter:card`. There's a generated 1200×630 share card at `assets/img/og-card.png`.
- LocalBusiness structured data on the homepage: address, hours, phone, area served, currency. Validates.
- `lang="en-KE"` set.

**Why the share card matters here:** WhatsApp is your main channel. Every time someone forwards `deterpro.co.ke`, WhatsApp shows a preview. Without an image it's a bare grey box; with one it's a branded card carrying the KEBS line. Replace it with a product photo when you have good ones — same filename, same dimensions.

## Conversions ✅

- **7–10 WhatsApp entry points per page**, plus a floating button that follows the scroll.
- The order builder assembles a complete message — line items, quantities, VAT-inclusive total — so a customer taps once and you receive a structured order rather than "how much is soap".
- Every price published. No "contact us for pricing", which is the biggest silent drop-off in B2B.
- KEBS approval appears in the hero, the trust strip, and on every product page.
- No enquiry form. Every route is a direct link — WhatsApp, tap-to-call, tap-to-email — so there is no dashboard step that can silently fail and nothing to spam.

---

# PART 2 — Before you launch

## Blocking

- [ ] **Deploy to Netlify** and confirm the site loads on the `.netlify.app` address
- [ ] **Point `deterpro.co.ke`** at Netlify and confirm HTTPS
- [ ] **Tap every WhatsApp button on a real phone** — confirm both numbers open the right chat with the message pre-filled
- [ ] **Place a test order** through the builder and check the message that arrives
- [ ] **Tap the `tel:` links** and confirm they dial correctly
- [ ] **Tap the email link** and confirm it opens a mail app addressed to info@deterpro.co.ke
- [ ] **Confirm someone actually watches `info@deterpro.co.ke`** — it is now the only non-WhatsApp route in

## Content still missing

- [ ] **Dilution ratios** — the quality page and every product page have the section but no figures
- [ ] **KEBS permit number** and the Standardization Mark artwork
- [ ] **Client names** — confirm each is happy to be listed, then I'll put the section back
- [ ] **Co-operative Bank account number**
- [ ] Nairobi delivery areas and the same-day cut-off time
- [ ] A landmark or gate number on Mokoyeti West Road
- [ ] **Register `deterpro.co.ke`** — until then `info@deterpro.co.ke`, which is on every page, bounces
- [ ] New product photos → `originals/`, then run `crop-images.ps1`

## After launch

- [ ] **Google Business Profile** — for a Karen-based supplier this will out-perform the website for local search. Free, and the structured data already matches.
- [ ] **Google Search Console** — verify the domain, submit `sitemap.xml`
- [ ] **Analytics** — none installed. Netlify Analytics is server-side (no cookie banner, no speed cost) at about $9/month; Google Analytics is free but adds a script and a consent obligation. My recommendation: Netlify Analytics, or nothing at first.
- [ ] Run PageSpeed Insights on the live URL — local numbers won't reflect real network conditions

---

## Two judgement calls worth making

**Analytics.** You currently have none. That's a legitimate choice — the site's job is to start WhatsApp conversations, and those are visible in WhatsApp. Adding Google Analytics costs you a script, a cookie banner obligation, and some speed. I would not add it unless you intend to act on the numbers.

**Prices on enquiry.** You have chosen to quote rather than publish. That keeps your pricing away from competitors, lets you price each customer on their volume, and removes the burden of keeping a page current. The cost is real though: a visitor who wanted to compare you against a supplier who does publish has to message you first, and some will not bother. Watch how many WhatsApp conversations open and go nowhere. If a lot of people ask the price and then vanish, consider publishing an indicative figure for the small sizes while keeping bulk on enquiry.
