# Still needed — Finches website

Updated 12 Aug 2026. Everything you've sent is in; this is what's left.

---

## 1. Dilution ratios

Left blank as you asked. Whenever you're ready:

| Product | Dilution |
|---|---|
| Antibacterial Handwash | |
| Multipurpose Detergent | |
| Degreaser | *(same ratio for automotive, restaurant and household — confirmed)* |
| Dishwashing Soap | |
| Disinfectant | *(the ratio quoted is for surfaces — confirmed)* |
| Rust & Stain Remover | |

The quality page and every product page carry a placeholder until these arrive.

---

## 2. Client names — permission

These appear by name on the homepage, the bulk page and the about page:

Cleanshelf Supermarkets · Lancet Laboratories · Norbrook Kenya Ltd · Talisman Hotel · Hillpark Hotel · La Salle Catholic Primary School · Ubuntu Academy

**Confirm each is happy to be named publicly before this goes live.** A medical laboratory and a pharmaceutical manufacturer are the two most likely to have a no-publicity clause. Any of them can be switched to an unnamed description — "a leading Nairobi medical laboratory" — which keeps most of the credibility with none of the risk.

---

## 3. Smaller gaps

**Payment**
- Co-operative Bank account number *(Till and PIN are both in)*

**Delivery**
- Which Nairobi areas do you cover?
- Same-day cut-off time

**Premises**
- Building name, gate number or a landmark on Mokoyeti West Road — the road alone is hard to find
- Google Business Profile link, so the map button points at your exact pin

**Credibility**
- KEBS permit number and Standardization Mark artwork

**Email**
- `info@deterpro.co.ke` is confirmed and set in `$EMAIL` at the top of `build-finches.ps1`. It will only receive mail once `deterpro.co.ke` is registered and a mailbox is pointed at it &mdash; the domain is currently unregistered, so anything sent there bounces.

**Pricing**
- Nothing. Prices are quoted on enquiry, so there is no published list to keep current and no "valid from" date to chase.


**Photos**
- The five originals into `originals/`, then run `crop-images.ps1`

---

## Settled — no need to revisit

- Price list = the Word document; all prices **VAT inclusive**; PIN **P051438845O**
- Phone and WhatsApp: **0720 100001** and **0722 552852**. 0722 708613 removed.
- **M-Pesa Till 584493** (Deterpro) and Co-operative Bank. New customers pay before delivery.
- **No free delivery.** Charged separately, quoted before payment. Countrywide via **NTL**.
- Trade minimums **12 / 12 / 5 / 5**, **30-day** credit, containers **refilled** on request.
- 5L and 20L ship with **plain screw caps**.
- **Degreaser from 5 litres** — no 1-litre line.
- **Handwash:** Sierra Mist (raspberry, yellow), Sweet Rose (strawberry, red), Sea Breeze (apple, blue).
- **Multipurpose Bar Soap — discontinued**, off the site.
- **Hours: Monday to Friday, 8am–5pm.** Closed weekends.
- **Social media removed** from the site entirely.
- **Section index markers removed** from every page.
- Address: Mokoyeti West Road, off Langata Road, Karen, Nairobi.
- **Delivery charged by area**, quoted before payment.
- **Dark mode** added - sun/moon toggle in the header, light by default, choice remembered.
- Director photo placeholders reduced to a slim strip until real portraits arrive.
- Client name corrected to **La Salle Catholic Primary School**.
- **Hosting: Netlify.** Form converted to Netlify Forms and `netlify.toml` added. You still need to switch on email notifications in the Netlify dashboard - see README.
- Client list, director bios and photos removed for now.
- VAT statement and PIN moved from the footer onto the order form.
- Empty grid slots now show the page background instead of a grey slab.
