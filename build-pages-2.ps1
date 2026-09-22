# Interior pages and product pages. Dot-source build-finches.ps1 and build-pages-1.ps1 first.

# ============================================================ bulk.html

$BULK = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Bulk &amp; trade</p>
    <h1>Supply the <em>whole building</em></h1>
    <p>Twenty-litre jerrycans, reseller terms and standing monthly orders for schools, hotels, laboratories and cleaning contractors across Nairobi.</p>
    <div class="actions">
      <a class="btn btn--primary" href="https://wa.me/254722552852?text=Hello%20Finches%2C%20I%20would%20like%20a%20bulk%20quote%20for%3A">Request a bulk quote</a>
      <a class="btn btn--ghost" href="tel:+254722552852">Call 0722 552852</a>
    </div>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Why institutions buy from us</h2></div>
      <div class="grid-rule">
        <div class="card"><span class="card__label">One supplier, one invoice</span><p class="card__body">Hands, dishes, floors, grease, germs and stains in a single delivery instead of six.</p></div>
        <div class="card"><span class="card__label">KEBS approved</span><p class="card__body">Certified product you can name in an inspection or a tender without hesitating.</p></div>
        <div class="card"><span class="card__label">Made in Nairobi</span><p class="card__body">No import lead time. When you run out, we are here and we can refill you quickly.</p></div>
        <div class="card"><span class="card__label">We refill your containers</span><p class="card__body">Bring your own jerrycans and containers back and we will fill them. Less packaging, lower cost.</p></div>
      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Terms at a glance</h2><p>So you can decide whether we fit before you spend time on a call.</p></div>
      <div class="trade">
        <h3>Trade account</h3>
        <p>Shops and distributors take 20-litre jerrycans and decant into their own bottles, or stock Finches bottles as supplied. Schools, hotels and contractors usually run a standing monthly order on a fixed date.</p>
        <div class="trade__grid">
          <div class="trade__item"><span class="trade__k">Minimum order</span><span class="trade__v">500ml &amp; 1L: 12 pieces<br>5L &amp; 20L: 5 pieces</span></div>
          <div class="trade__item"><span class="trade__k">Credit terms</span><span class="trade__v">30 days for approved accounts</span></div>
          <div class="trade__item"><span class="trade__k">New customers</span><span class="trade__v">Payment before delivery on the first order</span></div>
          <div class="trade__item"><span class="trade__k">Payment</span><span class="trade__v">M-Pesa Till 584493 (Deterpro), or Co-operative Bank</span></div>
          <div class="trade__item"><span class="trade__k">Refills</span><span class="trade__v">We refill your own containers</span></div>
          <div class="trade__item"><span class="trade__k">Delivery</span><span class="trade__v">Across Nairobi &mdash; see <a href="delivery.html">delivery</a></span></div>
          <div class="trade__item"><span class="trade__k">Prices</span><span class="trade__v">Quoted on enquiry, VAT inclusive &middot; PIN P051438845O</span></div>
          <div class="trade__item"><span class="trade__k">Reseller pricing</span><span class="trade__v">Quoted on your monthly volume</span></div>
        </div>
      </div>
      <div class="callout callout--blue">
        <h3>Buying to resell?</h3>
        <p>Tell us the volume you move in a month and we will quote reseller pricing against it. We also refill your own jerrycans and containers &mdash; bring them in and we will fill them.</p>
      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>The 20-litre jerrycan</h2><p>Every line is filled in a 20-litre jerrycan &mdash; the size schools, hotels and contractors run on. Pricing is quoted against your monthly volume, VAT inclusive.</p></div>
      <div class="table-scroll">
        <table>
          <caption>Available in 20-litre jerrycans</caption>
          <thead><tr><th scope="col">Product</th><th scope="col" class="price">Price</th></tr></thead>
          <tbody>
            <tr style="--code:var(--p-handwash)"><td><i class="rowcode"></i>Antibacterial Handwash</td><td class="price">On enquiry</td></tr>
            <tr style="--code:var(--p-multi)"><td><i class="rowcode"></i>Multipurpose Detergent</td><td class="price">On enquiry</td></tr>
            <tr style="--code:var(--p-dish)"><td><i class="rowcode"></i>Dishwashing Soap</td><td class="price">On enquiry</td></tr>
            <tr style="--code:var(--p-disinfect)"><td><i class="rowcode"></i>Disinfectant</td><td class="price">On enquiry</td></tr>
            <tr style="--code:var(--p-stain)"><td><i class="rowcode"></i>Rust &amp; Stain Remover</td><td class="price">On enquiry</td></tr>
          </tbody>
        </table>
      </div>
      <div class="actions"><a class="btn btn--primary" href="products.html">See every size</a></div>
    </div>
  </div>
</section>
'@

New-Page -Path "bulk.html" -Canon "bulk.html" -Title "Bulk &amp; Trade Supply &mdash; Finches, Nairobi" -Desc "Twenty-litre jerrycans, 30-day terms and standing monthly orders for schools, hotels, laboratories and cleaning contractors. Minimums from 5 pieces." -Body ($BULK + $CLOSING)

# ============================================================ delivery.html

$DELIVERY = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Delivery</p>
    <h1>How your order <em>reaches you</em></h1>
    <p>Jerrycans are heavy and time matters. Pick whichever suits the order &mdash; tell us on WhatsApp and we will confirm the cost before you pay.</p>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="freeship">
        <span class="freeship__big">Delivery is charged separately, and quoted before you pay</span>
        <span class="freeship__note">We do not fold a delivery cost silently into the price of the goods. Delivery is <strong>charged by area</strong> &mdash; tell us where you are and you get the figure up front.</span>
      </div>
      <div class="grid-rule">
        <div class="card">
          <span class="card__icon" aria-hidden="true"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 17h1a2 2 0 0 0 4 0h8a2 2 0 0 0 4 0h1v-5l-3-4h-4V7H3z"/></svg></span>
          <span class="card__label">Nairobi delivery</span>
          <p class="card__body">We deliver across Nairobi. <strong>Large and bulk orders go by vehicle</strong>, so a full jerrycan order arrives in one trip. Charged by area and quoted before you pay.</p>
        </div>
        <div class="card">
          <span class="card__icon" aria-hidden="true"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M3 21V9l9-6 9 6v12"/><path d="M9 21v-7h6v7"/></svg></span>
          <span class="card__label">Collect from us</span>
          <p class="card__body">Pick up on Mokoyeti West Road, off Langata Road in Karen, and pay no delivery at all. Order ahead on WhatsApp and it will be waiting. Open Monday to Friday, 8am to 5pm.</p>
        </div>
        <div class="card">
          <span class="card__icon" aria-hidden="true"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="17" rx="2"/><path d="M8 2v4M16 2v4M3 10h18"/></svg></span>
          <span class="card__label">Standing monthly order</span>
          <p class="card__body">Schools, hotels and contractors set a fixed delivery date each month. We arrive without being chased. Trade minimums apply.</p>
        </div>
      </div>
      <div class="actions">
        <a class="btn btn--primary" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20I%20would%20like%20to%20check%20delivery%20to%3A">Check delivery to your area</a>
      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Ordering takes one message</h2><p>No account, no portal, no minimum for retail.</p></div>
      <div class="steps">
        <div class="step"><span class="step__n">Step 01</span><span class="step__t">Send your list</span><p class="step__b">WhatsApp us the products and sizes, or build an order on the <a href="products.html">products page</a>.</p></div>
        <div class="step"><span class="step__n">Step 02</span><span class="step__t">We quote you</span><p class="step__b">Price, delivery cost and delivery time in writing before you commit.</p></div>
        <div class="step"><span class="step__n">Step 03</span><span class="step__t">Pay</span><p class="step__b">M-Pesa Till <strong>584493</strong> (Deterpro), or transfer to our Co-operative Bank account. New customers pay before delivery.</p></div>
        <div class="step"><span class="step__n">Step 04</span><span class="step__t">Delivery or collection</span><p class="step__b">Delivered across Nairobi, or collected from Karen.</p></div>
      </div>
    </div>
  </div>
</section>
'@
New-Page -Path "delivery.html" -Canon "delivery.html" -Title "Delivery in Nairobi &mdash; Finches Cleaning Products" -Desc "Delivery across Nairobi, by vehicle for large and bulk orders. Collect free from Karen, or set a standing monthly order. Charged by area and quoted before you pay." -Body ($DELIVERY + $CLOSING)

# ============================================================ quality.html

$QUALITY = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Quality &amp; safety</p>
    <h1>Approved by the <em>Kenya Bureau of Standards</em></h1>
    <p>Anyone can mix detergent in a drum and sell it. Not everyone can pass KEBS.</p>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="kebs">
        <span class="kebs__tick" aria-hidden="true"><svg width="16" height="13" viewBox="0 0 15 12"><path d="M1.5 6.2 5.3 10 13.5 1.6" fill="none" stroke="#fff" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></span>
        <span class="kebs__text">Kenya Bureau of Standards<small>Approved &middot; Standardization Mark</small></span>
      </div>
      <div class="prose">
        <p>Finches products are manufactured to Kenya Bureau of Standards requirements. That means the formulation is consistent from batch to batch, the labelling tells you the truth about what is inside, and the product does what the bottle says.</p>
        <p>For schools, clinics and food businesses this is not a nice-to-have. When an inspector asks what you clean with, a certified product is the answer that ends the conversation. It is also documentation you can produce for a tender.</p>
      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Dilute it right and it goes further</h2><p>Most cleaning products are used far stronger than they need to be. That wastes product, and on the wrong surface it does damage.</p></div>
      <div class="split">
        <div>
          <h3>Handling in a workplace</h3>
          <ul class="list">
            <li>Decant into labelled bottles &mdash; never into an unmarked drinks container.</li>
            <li>Keep disinfectant away from food and out of reach of children.</li>
            <li>Store jerrycans upright, closed and out of direct sun. All 5L and 20L containers have plain screw caps.</li>
            <li>Never mix products together. Cleaning chemicals can react with each other.</li>
            <li>Use gloves with disinfectant and stain remover at working strength.</li>
            <li>Rinse food-contact surfaces with clean water after disinfecting.</li>
          </ul>
        </div>
        <div class="callout">
          <h3>Dilution &amp; safety sheets</h3>
          <p>Every product carries its dilution ratio on the label. We supply a printed dilution and safety data sheet on request for institutional customers who need one on file.</p>
          <p>The disinfectant ratio quoted is for surfaces.</p>
          <div class="actions"><a class="btn btn--ghost" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20please%20send%20the%20dilution%20and%20safety%20sheet.">Request a safety sheet</a></div>
        </div>
      </div>
    </div>
  </div>
</section>
'@
New-Page -Path "quality.html" -Canon "quality.html" -Title "Quality &amp; Safety &mdash; KEBS-Approved Finches Products" -Desc "Finches cleaning products are approved by the Kenya Bureau of Standards. Handling guidance, dilution and safety data sheets for institutional customers." -Body ($QUALITY + $CLOSING)

# ============================================================ about.html

$ABOUT = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">About</p>
    <h1>Made in Karen, Nairobi <em>since 2013</em></h1>
    <p>Deterpro Enterprises manufactures the Finches range of soaps and cleaning agents on Mokoyeti West Road, and supplies homes, schools, hotels and businesses across Nairobi.</p>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="prose">
        <p>Deterpro Enterprises was registered in 2013 as a detergent production and general supplies company. We make the Finches range in Karen and sell it in every size from a 500ml bottle to a 20-litre jerrycan, so the same certified product reaches a family kitchen and a boarding school.</p>
        <p>Everything we make is approved by the Kenya Bureau of Standards. In a market where a lot of cleaning product is mixed in a back yard and poured into unmarked bottles, that certification is the difference between a supplier you can name in a tender and one you cannot.</p>
        <p><strong>We sell direct.</strong> There is no distributor margin between us and you, no account to open for a retail order, and no minimum. Message us, and you are talking to the people who made what you are buying.</p>
      </div>
      <div class="grid-rule">
        <div class="card"><span class="card__vol num">2013</span><span class="card__label">Registered</span><p class="card__body">Detergent production and general supplies.</p></div>
        <div class="card"><span class="card__vol num">5</span><span class="card__label">Product lines</span><p class="card__body">Hands, floors, dishes, germs and stains.</p></div>
        <div class="card"><span class="card__vol">KEBS</span><span class="card__label">Approved</span><p class="card__body">Manufactured to Kenya Bureau of Standards requirements.</p></div>
      </div>
    </div>
  </div>
</section>

<section class="band" id="directors">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>The people behind Finches</h2>
        <p>Deterpro Enterprises is director-run. When you call, you are talking to someone who can make a decision about your order.</p>
      </div>
      <div class="grid-rule">

        <article class="person">
          <div class="person__body">
            <h3 class="person__name">Monicah Muigai</h3>
            <p class="person__role">Director</p>
            <ul class="person__contact">
              <li><a href="tel:+254720100001">0720 100001</a></li>
              <li><a href="https://wa.me/254720100001?text=Hello%20Monicah%2C">WhatsApp</a></li>
            </ul>
          </div>
        </article>

        <article class="person">
          <div class="person__body">
            <h3 class="person__name">Josephine Mirie</h3>
            <p class="person__role">Director</p>
            <ul class="person__contact">
              <li><a href="tel:+254722552852">0722 552852</a></li>
              <li><a href="https://wa.me/254722552852?text=Hello%20Josephine%2C">WhatsApp</a></li>
            </ul>
          </div>
        </article>

      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Who we supply</h2></div>
      <div class="tags">
        <span class="tag">Schools</span><span class="tag">Restaurants</span><span class="tag">Hotels</span><span class="tag">Laboratories</span><span class="tag">Clinics</span><span class="tag">Offices</span><span class="tag">Salons</span><span class="tag">Churches</span><span class="tag">Garages</span><span class="tag">Cleaning contractors</span><span class="tag">Supermarkets</span><span class="tag">Households</span>
      </div>
      <div class="actions">
        <a class="btn btn--primary" href="products.html">See the range</a>
        <a class="btn btn--ghost" href="bulk.html">Bulk &amp; trade</a>
      </div>
    </div>
  </div>
</section>
'@
$ABOUT = $ABOUT
New-Page -Path "about.html" -Canon "about.html" -Title "About Deterpro Enterprises &mdash; Makers of Finches, Karen" -Desc "Deterpro Enterprises has manufactured the Finches range in Karen, Nairobi since 2013. KEBS approved, director-run, sold direct from 500ml bottles to 20-litre jerrycans." -Body ($ABOUT + $CLOSING)

# ============================================================ contact.html

$CONTACT = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Contact</p>
    <h1>Get a price <em>today</em></h1>
    <p>Send your list and we will come back with a total, a delivery cost and the right dilution for the job.</p>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>How to reach us</h2>
        <p>WhatsApp is fastest. Both numbers also take calls, and email reaches the office directly.</p>
      </div>
      <div class="grid-rule">
        <div class="card"><span class="card__label">WhatsApp &mdash; orders</span><p class="card__body"><a href="https://wa.me/254720100001">0720 100001</a></p><div class="actions"><a class="btn btn--wa" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20I%20would%20like%20to%20order%3A">Message us</a></div></div>
        <div class="card"><span class="card__label">WhatsApp &mdash; bulk &amp; trade</span><p class="card__body"><a href="https://wa.me/254722552852">0722 552852</a></p><div class="actions"><a class="btn btn--wa" href="https://wa.me/254722552852?text=Hello%20Finches%2C%20I%20would%20like%20a%20bulk%20quote%20for%3A">Message us</a></div></div>
        <div class="card"><span class="card__label">Call us</span><p class="card__body">The same two numbers take calls.<br><a href="tel:+254720100001">0720 100001</a><br><a href="tel:+254722552852">0722 552852</a></p></div>
        <div class="card"><span class="card__label">Email &amp; post</span><p class="card__body"><a href="mailto:{{EMAIL}}">{{EMAIL}}</a><br>P.O. Box 41514-00100, Nairobi</p><div class="actions"><a class="btn btn--ghost" href="mailto:{{EMAIL}}?subject=Finches%20enquiry">Email us</a></div></div>
      </div>
      <div class="grid-rule">
        <div class="card">
          <span class="card__label">Opening hours</span>
          <p class="card__body"><strong>Monday to Friday</strong><br>8am &ndash; 5pm</p><p class="card__body">Closed Saturday and Sunday.</p>
        </div>
        <div class="card">
          <span class="card__label">Visit or collect</span>
          <p class="card__body">Mokoyeti West Road, off Langata Road<br>Karen, Nairobi</p>
          <div class="actions"><a class="btn btn--ghost" href="https://www.google.com/maps/search/?api=1&amp;query=Mokoyeti+West+Road%2C+Karen%2C+Nairobi" rel="noopener">Open in Maps</a></div>
        </div>
        <div class="card">
          <span class="card__label">Payment</span>
          <p class="card__body">M-Pesa Till <strong>584493</strong> (Deterpro)<br>Co-operative Bank transfer<br>New customers pay before delivery.</p>
          <p class="card__body">Prices quoted on enquiry, VAT inclusive &middot; PIN P051438845O</p>
        </div>
      </div>
    </div>
  </div>
</section>

'@
New-Page -Path "contact.html" -Canon "contact.html" -Title "Contact Finches &mdash; Order Cleaning Products in Nairobi" -Desc "WhatsApp 0720 100001 or 0722 552852, email us, or collect from Mokoyeti West Road, Karen. Open Monday to Friday, 8am to 5pm." -Body ($CONTACT + $CLOSING)

# ============================================================ 404.html
# Netlify serves this automatically for any unmatched path.

$NOTFOUND = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Page not found</p>
    <h1>That page has <em>moved or gone</em></h1>
    <p>The link may be old, or the address slightly wrong. Everything we sell is one tap away below.</p>
    <div class="actions">
      <a class="btn btn--primary" href="/products.html">See the products</a>
      <a class="btn btn--ghost" href="/">Back to the homepage</a>
    </div>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Or go straight to</h2></div>
      <div class="grid-rule">
        <div class="card"><span class="card__label">The range</span><p class="card__body">Every product and size on the <a href="/products.html">products page</a>.</p></div>
        <div class="card"><span class="card__label">Bulk &amp; trade</span><p class="card__body">Jerrycans, 30-day terms and monthly orders on the <a href="/bulk.html">bulk page</a>.</p></div>
        <div class="card"><span class="card__label">Delivery</span><p class="card__body">Across Nairobi, or collect from Karen &mdash; see <a href="/delivery.html">delivery</a>.</p></div>
        <div class="card"><span class="card__label">Talk to us</span><p class="card__body">Numbers, email and opening hours are on <a href="/contact.html">contact</a>.</p></div>
      </div>
    </div>
  </div>
</section>
'@
New-Page -Path "404.html" -Canon "404.html" -Title "Page not found &mdash; Finches, Nairobi" -Desc "That page could not be found. Browse Finches cleaning products, prices and delivery options." -Body ($NOTFOUND + $CLOSING)

# ============================================================ faq.html

$FAQ = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">FAQ</p>
    <h1>Questions we get <em>most often</em></h1>
    <p>If yours is not here, message us on WhatsApp and we will answer it directly.</p>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="faq">
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="true">Are Finches products approved?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>Yes. The Finches range is approved by the Kenya Bureau of Standards and manufactured to KEBS requirements.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">What is your minimum order?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>None for retail &mdash; buy a single bottle. For trade and wholesale the minimums are 12 pieces on 500ml and 1L, and 5 pieces on 5L and 20L.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">Do you deliver?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>Yes, across Nairobi. Large and bulk orders go by vehicle. Delivery is charged by area and quoted before you pay. You can also collect from us in Karen at no charge. See <a href="delivery.html">delivery options</a>.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">How do I pay?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>M-Pesa Till <strong>584493</strong> in the name Deterpro, or a transfer to our Co-operative Bank account. New customers pay before delivery. Approved trade accounts get 30 days.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">How much does it cost?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>Prices are quoted on enquiry. Send us the products, sizes and quantities you want on WhatsApp, or build a list on the <a href="products.html">products page</a>, and we will come back with a price and a delivery cost before you commit to anything.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">Do your prices include VAT?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>Yes. Everything we quote is VAT inclusive. Our PIN is P051438845O, so we can invoice you properly.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">Can I buy to resell in my shop?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>Yes. Shops and distributors buy 20-litre jerrycans and decant, or stock Finches bottles as supplied. Message 0722 552852 with your monthly volume for reseller pricing.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">Can I bring my own containers?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>Yes &mdash; we refill your own containers. Bring your jerrycans back and we will fill them.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">How much does the jerrycan save me?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>On every line, the 20-litre jerrycan works out cheaper per litre than buying the same volume in bottles, and the gap is widest on antibacterial handwash. Tell us which products you use and roughly how much you get through in a month, and we will do the sum with you.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">How do I know how much to dilute?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>The ratio is printed on every label. We also supply a printed dilution and safety sheet on request for institutional customers who need one on file.</p></div></div></div>
        <div class="faq__item"><h2><button class="faq__q" type="button" aria-expanded="false">Where are you based?<span class="faq__sign" aria-hidden="true"></span></button></h2><div class="faq__a"><div class="faq__a-inner"><p>We are on Mokoyeti West Road, off Langata Road in Karen, Nairobi. Open Monday to Friday, 8am to 5pm. Post reaches us at P.O. Box 41514-00100, Nairobi.</p></div></div></div>
      </div>
    </div>
  </div>
</section>
'@
New-Page -Path "faq.html" -Canon "faq.html" -Title "FAQ &mdash; Finches Cleaning Products, Nairobi" -Desc "Answers on KEBS approval, how pricing works, minimum order, delivery, M-Pesa payment, VAT, refills, reseller pricing and bulk savings." -Body ($FAQ + $CLOSING)

# ============================================================ product pages

$products = @(
  @{ slug='handwash'; name='Antibacterial Handwash'; code='p-handwash'
     img='handwash-group.jpg'; shotcap='500ml pump bottles &mdash; three scents'
     tag='Germ protection at every basin, in a scent people actually want to use.'
     body='<p>Finches Antibacterial Handwash cleans hands and reduces the bacteria that spread between people through door handles, taps and shared surfaces. It lathers quickly, rinses clean and does not leave hands tight or dry after repeated washing &mdash; which matters when staff wash their hands twenty times a shift.</p><p>The 500ml bottle comes with its own pump, so it goes straight onto a basin. Refill it from the 5-litre or the 20-litre jerrycan and you never buy the pump twice.</p>'
     bestfor='School washrooms &middot; Clinics and laboratories &middot; Restaurant kitchens &middot; Office bathrooms &middot; Salons &middot; Family homes'
     sizes=@('500 ml','5 litres','20 litres')
     variantHeading='Three scents, one formulation'
     variantIntro='The same antibacterial handwash in three scents. Mix them across a building so each washroom is easy to tell apart, or pick one and stay with it.'
     variants=@(
       @{img='handwash-sierra-mist.jpg'; name='Sierra Mist'; note='Raspberry &middot; 500ml'},
       @{img='handwash-sweet-rose.jpg';  name='Sweet Rose';  note='Strawberry &middot; 500ml'},
       @{img='handwash-sea-breeze.jpg';  name='Sea Breeze';  note='Apple &middot; 500ml'}
     )
     bulk='<div class="callout callout--green"><h3>Buy the jerrycan, keep the bottles</h3><p>One 20-litre jerrycan refills forty 500ml pump bottles, and works out far cheaper per litre than replacing them. This is the line where the jerrycan saves you the most. Ask us for a price against your monthly volume.</p></div>'
     desc='Finches Antibacterial Handwash in Sierra Mist, Sweet Rose and Sea Breeze. KEBS approved. 500ml bottles, 5 litre and 20 litre jerrycans. Price on enquiry.' },

  @{ slug='multipurpose-detergent'; name='Multipurpose Detergent'; code='p-multi'
     img='multipurpose-detergent.jpg'; shotcap='Finches Multipurpose Soap, 1 litre'
     tag='One product for floors, walls and every washable surface in the building.'
     body='<p>The everyday workhorse. Finches Multipurpose Detergent handles mopping, wiping down walls, cleaning desks and general surface washing, so you are not stocking a separate product for every room. It is the cheapest litre we make, and the one most customers reorder first.</p>'
     bestfor='Classroom and corridor floors &middot; Office cleaning &middot; Shop floors &middot; Church halls &middot; General household cleaning'
     sizes=@('1 litre','5 litres','20 litres')
     variantHeading='Also supplied in bulk'
     variantIntro='The same multipurpose soap in a 20-litre jerrycan for store rooms and cleaning contractors.'
     variants=@(@{img='drum-multipurpose.jpg'; name='20 litre jerrycan'; note='Multipurpose Soap'})
     bulk='<div class="callout callout--green"><h3>The cheapest litre we make</h3><p>The 20-litre jerrycan holds the same as twenty 1-litre bottles and costs considerably less per litre. Tell us how much you get through in a month and we will quote it.</p></div>'
     desc='Finches Multipurpose Detergent for floors, walls and surfaces. KEBS approved. 1 litre, 5 litre and 20 litre jerrycans. Price on enquiry.' },

  @{ slug='dishwashing-soap'; name='Dishwashing Soap'; code='p-dish'
     img='dishwashing-soap.jpg'; shotcap='Finches Dishwashing Soap, 1 litre'
     tag='Cuts grease and keeps its foam through a full sink of dishes.'
     body='<p>Cheap dishwashing liquid dies after five plates and you end up pouring more. Finches Dishwashing Soap holds its foam through a full sink, lifts oil off plates and pans, and rinses without leaving a film on glasses.</p>'
     bestfor='Restaurant and hotel sculleries &middot; School kitchens &middot; Canteens &middot; Household kitchens'
     sizes=@('1 litre','5 litres','20 litres')
     bulk='<div class="callout callout--green"><h3>For a kitchen that runs all day</h3><p>A scullery working every service gets through more than you expect. The 20-litre jerrycan holds the same as twenty 1-litre bottles at a lower cost per litre. Ask us for a price on your monthly volume.</p></div>'
     desc='Finches Dishwashing Soap holds its foam through a full sink. KEBS approved. 1 litre, 5 litre and 20 litre jerrycans. Price on enquiry.' },

  @{ slug='disinfectant'; name='Disinfectant'; code='p-disinfect'
     img='disinfectant.jpg'; shotcap='Finches Disinfectant, 500ml'
     tag='The product an inspector asks about &mdash; and the one you want to be able to show.'
     body='<p>Finches Disinfectant kills germs on floors, washrooms, counters and food-preparation surfaces. Use it where cleaning alone is not enough: after a sick pupil, between food prep tasks, in washrooms used by hundreds of people a day.</p><p>The label names the hardest jobs it is made for &mdash; <strong>drains, sinks and toilets</strong> &mdash; alongside general disinfection across floors and surfaces.</p>'
     bestfor='Clinics and laboratories &middot; School washrooms and dormitories &middot; Drains, sinks and toilets &middot; Food preparation areas &middot; Salons and barbershops'
     sizes=@('500 ml','1 litre','5 litres','20 litres')
     bulk='<div class="callout callout--green"><h3>Certified, and on paper</h3><p>Approved by the Kenya Bureau of Standards &mdash; so when you are asked what you disinfect with, you have an answer you can evidence. Ask us for the safety data sheet with your first order.</p></div>'
     desc='Finches Disinfectant for drains, sinks, toilets and food surfaces. KEBS approved. 500ml, 1 litre, 5 litre and 20 litre jerrycans. Price on enquiry.' },

  @{ slug='rust-stain-remover'; name='Rust &amp; Stain Remover'; code='p-stain'
     img='rust-stain-remover.jpg'; shotcap='Finches Rust &amp; Stain Remover, 500ml'
     tag='Takes out the marks other cleaners leave behind.'
     body='<p>Rust streaks down a wall from a leaking bracket, tea and blood on uniforms, hard-water marks around a drain &mdash; ordinary detergent will not shift any of them. Finches Rust &amp; Stain Remover is made for exactly these jobs, and works fastest before the mark has had months to set.</p>'
     bestfor='Hotel and school laundries &middot; Bathroom tiles and fittings &middot; Uniforms and bed linen &middot; Metal fixtures and railings'
     sizes=@('500 ml','1 litre','5 litres','20 litres')
     bulk='<div class="callout callout--green"><h3>For laundries working at volume</h3><p>A hotel or school laundry goes through stain remover steadily. The 20-litre jerrycan holds the same as twenty 1-litre bottles at a lower cost per litre. Tell us your volume and we will quote it.</p></div>'
     desc='Finches Rust &amp; Stain Remover lifts rust and set-in stains from fabric, tiles and metal. KEBS approved. 500ml to 20 litres. Price on enquiry.' }
)

$PRODTPL = @'
<nav class="crumb" aria-label="Breadcrumb">
  <div class="wrap"><a href="../index.html">Home</a> / <a href="../products.html">Products</a> / {{NAME}}</div>
</nav>

<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Finches product</p>
    <h1>{{NAME}}</h1>
    <p>{{TAG}}</p>
    <div class="kebs">
      <span class="kebs__tick" aria-hidden="true"><svg width="16" height="13" viewBox="0 0 15 12"><path d="M1.5 6.2 5.3 10 13.5 1.6" fill="none" stroke="#fff" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></span>
      <span class="kebs__text">Kenya Bureau of Standards<small>Approved &middot; Standardization Mark</small></span>
    </div>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="split">
        <div class="prose">
          {{BODY}}
          <p><strong>Best for:</strong> {{BESTFOR}}</p>
        </div>
        <div>
          {{SHOT}}
          <div class="table-scroll" style="margin-top:1rem">
            <table>
              <caption>Containers we fill. Prices on enquiry, VAT inclusive.</caption>
              <thead><tr><th scope="col">Container</th><th scope="col" class="price">Price</th></tr></thead>
              <tbody>{{SIZES}}</tbody>
            </table>
          </div>
          <div class="actions" style="margin-top:1rem">
            <a class="btn btn--primary" href="{{WA}}">Ask for a price</a>
            <a class="btn btn--ghost" href="../products.html">Build a full list</a>
          </div>
        </div>
      </div>
      {{VARIANTS}}
      {{BULK}}
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="split">
        <div>
          <h3>Using it safely</h3>
          <ul class="list">
            <li>Decant into labelled bottles &mdash; never into an unmarked drinks container.</li>
            <li>Store closed, upright and out of direct sun. 5L and 20L have plain screw caps.</li>
            <li>Never mix with other cleaning products.</li>
            <li>Keep out of reach of children.</li>
          </ul>
        </div>
        <div class="callout">
          <h3>Dilution</h3>
          <p>The dilution ratio is printed on the label. We supply a printed dilution and safety data sheet on request.</p>
        </div>
      </div>
      <div class="actions"><a class="btn btn--ghost" href="../quality.html">Quality &amp; safety</a></div>
    </div>
  </div>
</section>
'@

foreach ($p in $products) {
  # sizes are plain strings now - prices are quoted, not published
  $rows = ""
  foreach ($sz in $p.sizes) {
    $rows += "<tr style=""--code:var(--$($p.code))""><td class=""vol""><i class=""rowcode""></i>$sz</td><td class=""price"">On enquiry</td></tr>"
  }
  $plain = $p.name.Replace('&amp;', 'and')
  $wa = "https://wa.me/254720100001?text=" + [uri]::EscapeDataString("Hello Finches, please quote me for $plain" + ":")

  $shot = Get-Shot -Name ($p.img) -Alt ("Finches " + $plain) -Caption $p.shotcap -Base "../"

  $variants = ''
  if ($p.variants) {
    $cards = ''
    foreach ($v in $p.variants) {
      if (Test-Img $v.img) {
        $cards += "<div class=""variant""><img src=""../assets/img/$($v.img)"" alt=""Finches $plain, $($v.name)"" width=""600"" height=""800"" loading=""lazy"" decoding=""async""><span class=""variant__name"">$($v.name)<small>$($v.note)</small></span></div>"
      }
    }
    if ($cards) {
      $variants = "<div class=""band__head""><h3>$($p.variantHeading)</h3><p>$($p.variantIntro)</p></div><div class=""variants"">$cards</div>"
    }
  }

  $body = $PRODTPL.Replace('{{NAME}}', $p.name).Replace('{{TAG}}', $p.tag).Replace('{{BODY}}', $p.body).Replace('{{BESTFOR}}', $p.bestfor).Replace('{{SIZES}}', $rows).Replace('{{BULK}}', $p.bulk).Replace('{{WA}}', $wa).Replace('{{SHOT}}', $shot).Replace('{{VARIANTS}}', $variants)

  New-Page -Path ("products\" + $p.slug + ".html") -Base "../" -Canon ("products/" + $p.slug + ".html") `
    -Title ($p.name + " &mdash; Finches, Nairobi") -Desc $p.desc -Body ($body + $CLOSING)
}

Write-Host ""
Write-Host "Done."
