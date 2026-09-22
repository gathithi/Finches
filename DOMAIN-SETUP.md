# Connecting deterpro.co.ke — DNS, SSL and what to watch

---

## ⚠ Before anything else: the domain does not currently resolve

I queried it from two public resolvers (Cloudflare `1.1.1.1` and Google `8.8.8.8`):

```
deterpro.co.ke        -> DNS name does not exist
www.deterpro.co.ke    -> DNS name does not exist
mail.deterpro.co.ke   -> DNS name does not exist
```

DNS itself is working from here — `google.com`, `safaricom.co.ke` and `kenic.or.ke` all resolve normally. So this is specific to your domain: **`deterpro.co.ke` is either not registered, expired, or registered but never delegated to any nameservers.**

**Two consequences:**

1. **You cannot point it at Netlify until this is fixed.** Every step below depends on the domain existing.
2. **`info@deterpro.co.ke` cannot be receiving email.** With no DNS record at all there are no MX records, so mail sent to that address bounces. It is printed on your Finches poster and appears on every page of the website — worth checking today, separately from the website work.

**First action:** contact whoever registered the domain and confirm its status. In Kenya that will be a KENIC-accredited registrar — Safaricom, Truehost, HostPinnacle, Kenya Website Experts, Sasahost and similar. Ask them:

- Is `deterpro.co.ke` registered and current, and when does it expire?
- Which nameservers is it delegated to?
- Is there a mailbox for `info@deterpro.co.ke`, and where is it hosted?

Everything below applies once the answer to the first question is yes.

---

## Choose one of two approaches

### Option A — Keep your registrar's nameservers *(recommended)*

You add two records at your registrar and change nothing else. Your email, if any exists, is untouched.

**Why I recommend this for you:** the risk in the other option is losing MX records, and you have a published email address on your packaging. This approach cannot break mail because it never touches it.

| Type | Name / Host | Value | TTL |
|---|---|---|---|
| `A` | `@` (or blank, meaning the root) | `75.2.60.5` | 3600 |
| `CNAME` | `www` | `<your-site>.netlify.app` | 3600 |

Netlify shows you the exact values under **Domain management** after you add the domain — use what the dashboard says rather than copying blindly from here, in case the load-balancer address changes.

Some registrars label the root record `@`, some want it blank, some want the full `deterpro.co.ke`. All three mean the same thing.

### Option B — Move DNS to Netlify

You change your nameservers at the registrar to the four Netlify gives you (they look like `dns1.p03.nsone.net`). Netlify then manages every record.

**Advantages:** proper apex handling, records managed in one place alongside the site, slightly faster propagation of future changes.

**The risk:** the moment nameservers change, *every* existing record disappears — including MX. If email is running on this domain and you have not recreated the MX records in Netlify first, **mail stops immediately.**

If you take this route: get the full existing record list from your registrar first, recreate every MX, TXT (SPF/DKIM) and any subdomain records in Netlify's DNS panel, and only then switch the nameservers.

---

## Which should be the main address?

**Use `deterpro.co.ke` (no www) as the primary**, with `www` redirecting to it.

This is not arbitrary. The site is already built that way — every page's canonical tag, the `og:url`, and all 14 sitemap entries point at `https://deterpro.co.ke/`. If you make `www` primary instead, those tags would contradict the live site and search engines would get mixed signals.

In Netlify: **Domain management → set `deterpro.co.ke` as the primary domain.** Netlify then 301-redirects `www` to it automatically.

If you would rather have `www` as the main address, say so — it's a one-line change in the build script plus a sitemap regeneration, and I'll do it. Just don't leave the two disagreeing.

---

## SSL

**You do not buy a certificate.** Netlify issues one from Let's Encrypt automatically.

The sequence:

1. Add the domain in Netlify.
2. Add the DNS records above at your registrar.
3. Wait for DNS to resolve — usually minutes, occasionally a few hours.
4. Netlify detects it and issues the certificate on its own. **Domain management → HTTPS** shows the status.
5. Once it says the certificate is active, turn on **Force HTTPS**. Every `http://` request then 301s to `https://`.

It renews itself every 90 days. There is nothing to diarise.

**If it does not issue:** it is almost always DNS not fully propagated, or a stale `AAAA` (IPv6) record left over from a previous host pointing somewhere else. Delete any leftover A/AAAA/CNAME records for the root and `www` that are not the two above, then use the **Renew certificate** button.

---

## Verifying it worked

Run these from PowerShell once the records are in:

```bash
nslookup deterpro.co.ke 1.1.1.1
```

You want `75.2.60.5` back. Then:

```bash
nslookup www.deterpro.co.ke 1.1.1.1
```

You want a CNAME to your `.netlify.app` address.

Then in a browser check all four of these land on the same page over HTTPS with no warning:

- `http://deterpro.co.ke`
- `https://deterpro.co.ke`
- `http://www.deterpro.co.ke`
- `https://www.deterpro.co.ke`

---

## Best practices, in the order they matter

**1. Lower your TTL before you change anything.** If the domain currently has records pointing at an old host, set their TTL to 300 seconds a day before switching. Changes then propagate in five minutes instead of hours. Put it back to 3600 once things settle.

**2. Never let the nameserver change and the MX records be separate jobs.** This is the single most common way a small business breaks its own email. If you choose Option B, recreate MX first.

**3. Set up SPF once email is confirmed working.** A TXT record on the root telling the world which servers may send as you. Without it, mail you send is more likely to be filed as spam. The value depends on who hosts the mailbox — Google Workspace, Zoho and cPanel each publish their own.

**4. Turn on Force HTTPS, but wait until the certificate is live.** Enabling it early locks visitors out.

**5. HSTS — later, and deliberately.** It tells browsers to refuse `http://` entirely. Powerful, but if anything goes wrong with your certificate the site becomes unreachable for anyone who has visited before, and the header is cached for its full lifetime. I have left a ready-to-use block commented out in `netlify.toml`. Turn it on only after the site has been live and stable on HTTPS for a few weeks, and do not use `preload` unless you are certain.

**6. Keep the domain and the site in one person's control.** Registrar login, Netlify login and the mailbox should all be accessible to a director, not only to a contractor.

**7. Set a renewal reminder.** `.co.ke` domains lapse quietly. Put the expiry date in a calendar with a month's warning, and turn on auto-renew if the registrar supports it.

**8. After it is live:** verify the domain in Google Search Console and submit `https://deterpro.co.ke/sitemap.xml`. Then create a Google Business Profile — for a Karen supplier that will bring more local traffic than the website itself.

---

## The order to do it in

1. Confirm the domain is registered and current — **it currently is not resolving**
2. Find out where `info@deterpro.co.ke` is hosted, if anywhere
3. Deploy the site to Netlify, confirm it works on the `.netlify.app` address
4. Add `deterpro.co.ke` in Netlify, set it as primary
5. Add the `A` and `CNAME` records at your registrar
6. Wait for DNS, confirm with `nslookup`
7. Wait for the certificate, then enable Force HTTPS
8. Test all four URL variants
9. Search Console and sitemap
10. HSTS, weeks later, if you want it
