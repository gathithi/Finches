# Analytics, Search Console and Meta Pixel

Everything is wired and tested. **You paste three IDs into one file and rebuild.** No code to place by hand, no snippets to copy into page templates.

---

## Where the IDs go

Open `build-finches.ps1`. Lines 14–21:

```powershell
$GA4_ID        = ''            # e.g. G-XXXXXXXXXX   (Google Analytics 4)
$META_PIXEL_ID = ''            # e.g. 1234567890123  (Meta Pixel)
$GSC_VERIFY    = ''            # the content="..." value from Search Console

$REQUIRE_CONSENT = $true
```

Fill in what you have, leave the rest empty, run the three build scripts, redeploy.

**Empty means genuinely nothing.** No script tag, no network request, no cookie, no consent banner. I verified this on the current build: zero external hosts in the HTML. You are not shipping dormant tracking code.

---

## 1. Google Analytics 4

**Steps:**

1. Go to **analytics.google.com** and sign in.
2. **Admin → Create → Property.** Name it `Finches`, set timezone to **(GMT+03:00) Nairobi** and currency to **Kenyan Shilling (KES)**.
3. Answer the business questions — industry "Retail", size "Small".
4. Choose **Web** as the platform.
5. Website URL: your Netlify address for now (`finches.netlify.app`), or the domain once it resolves. Stream name: `Finches website`.
6. It shows a **Measurement ID** like `G-ABC1234567`. Copy it.
7. Paste into `$GA4_ID`, rebuild, redeploy.

**Verify:** open your site, accept the cookie banner, then in GA4 go to **Reports → Realtime**. You should appear within about 30 seconds.

---

## 2. Google Search Console

Search Console tells you what people searched to find you, and flags indexing problems. It is the most useful of the three for this business, and the only one that costs nothing in page weight.

**Steps:**

1. Go to **search.google.com/search-console**.
2. Choose **URL prefix** (not Domain — that needs DNS access and your domain isn't registered yet). Enter your full site URL including `https://`.
3. Pick the **HTML tag** verification method. It shows something like:
   ```html
   <meta name="google-site-verification" content="AbCdEf123..." />
   ```
4. Copy **only the content value** — `AbCdEf123...` — not the whole tag.
5. Paste into `$GSC_VERIFY`, rebuild, redeploy.
6. Back in Search Console, click **Verify**.

**Then submit the sitemap:** **Sitemaps** in the left menu → enter `sitemap.xml` → Submit. It lists all 14 pages.

Once your real domain is live, add it as a second property and switch to **Domain** verification via a DNS TXT record — that covers `www`, non-`www`, http and https in one.

---

## 3. Meta Pixel

**Steps:**

1. Go to **business.facebook.com** → **Events Manager**.
2. **Connect data sources → Web → Connect**.
3. Name it `Finches website`, choose **Meta Pixel**.
4. It gives you a **Pixel ID** — a long number like `1234567890123456`. Copy it.
5. Choose **Install code manually** if asked. You can skip the code it shows; it is already in place.
6. Paste the ID into `$META_PIXEL_ID`, rebuild, redeploy.

**Verify:** install the **Meta Pixel Helper** Chrome extension, open your site, accept cookies. The extension should show the pixel firing `PageView`.

### Be realistic about what the Pixel can do here

Your sales happen **inside WhatsApp**. The Pixel cannot follow anyone there — it sees them leave your site and nothing after. So it will never report actual revenue or a true cost-per-sale.

What it *can* do, and what I've wired it for, is count the handover: how many people reached the point of tapping through to WhatsApp. That is a real proxy and it makes retargeting possible. But if you are not running Meta ads, the Pixel gives you very little for its 70 KB. I would leave `$META_PIXEL_ID` empty until you actually advertise.

---

## The events I've set up

Standard pageview tracking tells you which pages get read. It does not tell you whether anyone tried to buy. So every meaningful action fires a custom event to **both** GA4 and Meta:

| Event | Fires when | Why it matters |
|---|---|---|
| `order_sent` | Someone sends a built order from the products page | Closest thing to a conversion this site has |
| `whatsapp_click` | Any WhatsApp link or button is tapped | The main handover |
| `phone_click` | A `tel:` number is tapped | Calls are invisible otherwise |
| `email_click` | The email link is tapped | Completes the picture |

Each carries the page it happened on, and WhatsApp events carry which of your two numbers was used — so you can see whether orders or bulk enquiries dominate.

**In GA4:** these appear under **Reports → Engagement → Events** within a day. Mark `order_sent` and `whatsapp_click` as **key events** (Admin → Events) so they show up as conversions.

**In Meta:** they appear as custom events in Events Manager and can be used as ad objectives.

I tested all four firing to both tools.

---

## The consent banner

`$REQUIRE_CONSENT = $true` by default.

**Why:** Kenya's **Data Protection Act 2019** governs processing personal data, and both GA4 and Meta Pixel set cookies and process identifiers. The Office of the Data Protection Commissioner expects notice and a lawful basis. I am not a lawyer and this is not legal advice — but shipping tracking with no notice at all would have been the wrong default to hand you.

**How it behaves:**

- No tracking IDs configured → **no banner at all**. It never appears on a site with nothing to consent to.
- IDs configured → a bar appears at the bottom with Accept and Decline.
- **Nothing loads until Accept.** Not the scripts, not a cookie, not a request. Verified.
- The choice is remembered in `localStorage` and never asked again.
- Decline is respected permanently.

**To turn it off:** set `$REQUIRE_CONSENT = $false`. Trackers then load immediately for everyone. Your call, but make it knowingly.

---

## What this costs in speed

Right now: **3 requests, 20.6 KB gzipped, interactive in 39 ms.**

| Added | Extra weight |
|---|---|
| GA4 | ~50 KB, one external host |
| Meta Pixel | ~70 KB, one external host |
| Both | ~120 KB — roughly **6× the current page weight** |

Two things soften this: both load **after** consent, so a visitor who declines pays nothing; and both are async, so neither blocks rendering. But on Kenyan mobile data, 120 KB is real.

**My honest read:** take Search Console — it is free, weightless, and genuinely tells you something. Take GA4 if you will actually look at it monthly. Leave the Pixel until you run ads.

---

## The order to do it

1. Deploy to Netlify, get your live URL
2. Search Console → verify → paste `$GSC_VERIFY` → rebuild → redeploy → click Verify → submit sitemap
3. GA4 → create property → paste `$GA4_ID` → rebuild → redeploy → check Realtime
4. Mark `order_sent` and `whatsapp_click` as key events in GA4
5. Meta Pixel only if and when you advertise
6. Re-run PageSpeed Insights afterwards to see the real cost

Each rebuild is: edit the IDs, run the three scripts, drag the folder to Netlify.
