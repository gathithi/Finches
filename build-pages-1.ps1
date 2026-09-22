# Homepage and products page. Dot-source build-finches.ps1 first.

# ============================================================ index.html

$HOMEBODY = @'
<section class="hero">
  <div class="wrap hero__inner">
    <div class="hero__copy">
      <p class="eyebrow">Soaps &amp; cleaning agents &middot; Made in Karen, Nairobi</p>
      <h1>Clean you can <em>prove</em></h1>
      <p class="hero__lede">Finches handwash, detergent, dishwash, disinfectant and stain remover &mdash; approved by the Kenya Bureau of Standards and made right here in Nairobi. From a 500ml bottle for the house to a 20-litre jerrycan for the whole school.</p>
      <div class="kebs">
        <span class="kebs__tick" aria-hidden="true"><svg width="16" height="13" viewBox="0 0 15 12"><path d="M1.5 6.2 5.3 10 13.5 1.6" fill="none" stroke="#fff" stroke-width="2.6" stroke-linecap="round" stroke-linejoin="round"/></svg></span>
        <span class="kebs__text">Kenya Bureau of Standards<small>Approved &middot; Standardization Mark</small></span>
      </div>
      <div class="actions">
        <a class="btn btn--primary" href="https://wa.me/254720100001?text=Hello%20Finches%2C%20I%20would%20like%20to%20order%3A">Order on WhatsApp</a>
        <a class="btn btn--ghost" href="products.html">See the range</a>
      </div>
      <p class="note">Prices on enquiry, VAT inclusive. No minimum order for retail.</p>
    </div>
    {{SCALE}}
  </div>
</section>

<section class="strip">
  <div class="wrap strip__inner">
    <div class="strip__cell"><span class="strip__figure">KEBS</span><span class="strip__label">Every Finches product meets Kenya Bureau of Standards requirements</span></div>
    <div class="strip__cell"><span class="strip__figure num">2013</span><span class="strip__label">Deterpro Enterprises has manufactured in Nairobi for over a decade</span></div>
    <div class="strip__cell"><span class="strip__figure num">500ml&ndash;20L</span><span class="strip__label">One certified range that fits a kitchen sink or a boarding school</span></div>
    <div class="strip__cell"><span class="strip__figure">Nairobi</span><span class="strip__label">Delivered across Nairobi, or collect from us in Karen</span></div>
  </div>
</section>

<section class="band" id="range">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>What each product is actually for</h2>
        <p>Cleaning products are not interchangeable. Using the right one costs less than using twice as much of the wrong one. Each line is colour-coded so your staff can tell the jerrycans apart across a store room.</p>
      </div>
      <div class="grid-rule">

        <article class="product" style="--code:var(--p-handwash)">
          <h3 class="product__name"><a href="products/handwash.html">Antibacterial Handwash</a></h3>
          <p class="product__use">Kills germs at every basin in the building. Three scents &mdash; Sierra Mist, Sweet Rose and Sea Breeze. Refill your pump bottles from a jerrycan instead of buying new ones.</p>
          <div class="product__sizes">
            <div class="size-row"><span class="size-row__vol"><i class="size-row__dot"></i>500 ml &middot; 5 L &middot; 20 L</span><span class="size-row__price">On enquiry</span></div>
          </div>
          <a class="product__link" href="products/handwash.html">Details &rarr;</a>
        </article>

        <article class="product" style="--code:var(--p-multi)">
          <h3 class="product__name"><a href="products/multipurpose-detergent.html">Multipurpose Detergent</a></h3>
          <p class="product__use">Floors, walls and every washable surface in the building. The one most customers reorder first.</p>
          <div class="product__sizes">
            <div class="size-row"><span class="size-row__vol"><i class="size-row__dot"></i>1 L &middot; 5 L &middot; 20 L</span><span class="size-row__price">On enquiry</span></div>
          </div>
          <a class="product__link" href="products/multipurpose-detergent.html">Details &rarr;</a>
        </article>

        <article class="product" style="--code:var(--p-dish)">
          <h3 class="product__name"><a href="products/dishwashing-soap.html">Dishwashing Soap</a></h3>
          <p class="product__use">Cuts grease and holds its foam through a full sink. Sized for a home kitchen or a restaurant scullery running all day.</p>
          <div class="product__sizes">
            <div class="size-row"><span class="size-row__vol"><i class="size-row__dot"></i>1 L &middot; 5 L &middot; 20 L</span><span class="size-row__price">On enquiry</span></div>
          </div>
          <a class="product__link" href="products/dishwashing-soap.html">Details &rarr;</a>
        </article>

        <article class="product" style="--code:var(--p-disinfect)">
          <h3 class="product__name"><a href="products/disinfectant.html">Disinfectant</a></h3>
          <p class="product__use">Kills germs on drains, sinks, toilets and food-preparation surfaces. The product a health inspector asks to see, so keep it stocked.</p>
          <div class="product__sizes">
            <div class="size-row"><span class="size-row__vol"><i class="size-row__dot"></i>500 ml &middot; 1 L &middot; 5 L &middot; 20 L</span><span class="size-row__price">On enquiry</span></div>
          </div>
          <a class="product__link" href="products/disinfectant.html">Details &rarr;</a>
        </article>

        <article class="product" style="--code:var(--p-stain)">
          <h3 class="product__name"><a href="products/rust-stain-remover.html">Rust &amp; Stain Remover</a></h3>
          <p class="product__use">Lifts rust marks and set-in stains from fabric, tiles and metal &mdash; the marks ordinary detergent slides straight over.</p>
          <div class="product__sizes">
            <div class="size-row"><span class="size-row__vol"><i class="size-row__dot"></i>500 ml &middot; 1 L &middot; 5 L &middot; 20 L</span><span class="size-row__price">On enquiry</span></div>
          </div>
          <a class="product__link" href="products/rust-stain-remover.html">Details &rarr;</a>
        </article>

      </div>
      <div class="actions"><a class="btn btn--primary" href="products.html">Build an order</a></div>
    </div>
  </div>
</section>

<section class="band" id="sizes">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>Match the container to the operation</h2>
        <p>The right size is the one you finish before it goes to waste and refill before you run out. Here is how our customers usually decide.</p>
      </div>
      <div class="grid-rule">
        <div class="card"><span class="card__vol num">500ml&ndash;1L</span><span class="card__label">Home &amp; small shop</span><p class="card__body">One kitchen, one washroom, one counter. Small enough to carry home and store under the sink.</p></div>
        <div class="card"><span class="card__vol num">5L</span><span class="card__label">Busy kitchen, salon, office</span><p class="card__body">Keeps dispensers filled for a working week or a quiet month, and still light enough for one person to pour.</p></div>
        <div class="card"><span class="card__vol num">20L</span><span class="card__label">Schools, hotels, clinics, contractors</span><p class="card__body">The 20-litre jerrycan is the school size. Your standing supply, with a plain screw cap so you decant into labelled bottles as each area needs them.</p></div>
      </div>

      <div class="callout callout--green">
        <h3>The jerrycan is the cheapest way to buy</h3>
        <p>Every product costs less per litre in the 20-litre jerrycan than in bottles, and we refill your own containers so you are not paying for packaging twice. Tell us your monthly volume and we will quote it.</p>
        <div class="actions"><a class="btn btn--ghost" href="bulk.html">Bulk &amp; trade terms</a></div>
      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>How your order reaches you</h2>
        <p>Jerrycans are heavy and time matters. Delivery is charged by area and quoted before you pay &mdash; we never fold it silently into the price of the goods.</p>
      </div>
      <div class="grid-rule">
        <div class="card"><span class="card__label">Nairobi delivery</span><p class="card__body">We deliver across Nairobi. Large and bulk orders go by vehicle. Charged by area.</p></div>
        <div class="card"><span class="card__label">Collect from us</span><p class="card__body">Pick up in Karen and pay no delivery at all. Order ahead and it will be waiting.</p></div>
        <div class="card"><span class="card__label">Standing monthly order</span><p class="card__body">Schools, hotels and contractors set a fixed date each month. We arrive without being chased.</p></div>
      </div>
      <div class="actions"><a class="btn btn--ghost" href="delivery.html">Full delivery options</a></div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>One order covers the whole building</h2>
        <p>Instead of chasing five suppliers and five invoices, get hands, dishes, floors, germs and stains in a single delivery.</p>
      </div>
      <div class="trade">
        <h3>Bulk &amp; trade supply</h3>
        <p>Deterpro Enterprises supplies schools, hotels, laboratories and cleaning contractors across Nairobi on standing monthly orders. Shops and distributors take 20-litre jerrycans and decant, or stock Finches bottles as supplied.</p>
        <div class="trade__grid">
          <div class="trade__item"><span class="trade__k">Minimum order</span><span class="trade__v">500ml &amp; 1L: 12 pcs &middot; 5L &amp; 20L: 5 pcs</span></div>
          <div class="trade__item"><span class="trade__k">Credit terms</span><span class="trade__v">30 days for approved accounts</span></div>
          <div class="trade__item"><span class="trade__k">Refills</span><span class="trade__v">We refill your own containers</span></div>
          <div class="trade__item"><span class="trade__k">Payment</span><span class="trade__v">M-Pesa Till 584493 or Co-operative Bank</span></div>
        </div>
        <div class="actions">
          <a class="btn btn--primary" href="bulk.html">Bulk &amp; trade</a>
          <a class="btn btn--ghost" href="tel:+254722552852">Call 0722 552852</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="band" id="ordering">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>Ordering takes one message</h2><p>No account, no portal, no minimum for retail.</p></div>
      <div class="steps">
        <div class="step"><span class="step__n">Step 01</span><span class="step__t">Send your list</span><p class="step__b">WhatsApp us the products and sizes. For example: two 20L disinfectant, one 5L dishwash.</p></div>
        <div class="step"><span class="step__n">Step 02</span><span class="step__t">We quote you</span><p class="step__b">You get the price, the delivery cost and the delivery time in writing before you commit.</p></div>
        <div class="step"><span class="step__n">Step 03</span><span class="step__t">Pay</span><p class="step__b">M-Pesa Till <strong>584493</strong> (Deterpro), or transfer to our Co-operative Bank account. New customers pay before delivery.</p></div>
        <div class="step"><span class="step__n">Step 04</span><span class="step__t">Delivery or collection</span><p class="step__b">Delivered across Nairobi, or collected from us in Karen.</p></div>
      </div>
    </div>
  </div>
</section>

<section class="band" id="prices">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>The full range</h2><p>Five Finches lines, each filled in the sizes below. Send us your list and we will come back with a price, VAT inclusive.</p></div>
      {{TABLE}}
      <div class="actions"><a class="btn btn--primary" href="products.html">Build your list</a></div>
    </div>
  </div>
</section>
'@

$HOMEBODY = $HOMEBODY.Replace('{{SCALE}}', $SCALEFIG).Replace('{{TABLE}}', $PRICETABLE)

# Drop a photo into each product card, but only for products that have one.
$thumbs = @(
  @('handwash',               'handwash-group-thumb.jpg',         'Finches Antibacterial Handwash'),
  @('multipurpose-detergent', 'multipurpose-detergent-thumb.jpg', 'Finches Multipurpose Detergent'),
  @('dishwashing-soap',       'dishwashing-soap-thumb.jpg',       'Finches Dishwashing Soap'),
  @('disinfectant',           'disinfectant-thumb.jpg'      ,      'Finches Disinfectant'),
  @('rust-stain-remover',     'rust-stain-remover-thumb.jpg',     'Finches Rust and Stain Remover')
)
foreach ($t in $thumbs) {
  $img = Get-Thumb -Name $t[1] -Alt $t[2]
  if ($img) {
    $anchor = "<h3 class=""product__name""><a href=""products/$($t[0]).html"">"
    $HOMEBODY = $HOMEBODY.Replace($anchor, ($img + "`n          " + $anchor))
  }
}

$HOMEBODY = $HOMEBODY + $CLOSING

$LD = @'
<script type="application/ld+json">
{"@context":"https://schema.org","@type":"LocalBusiness","name":"Deterpro Enterprises","alternateName":"Finches","description":"Manufacturer of Finches soaps and cleaning agents in Karen, Nairobi, approved by the Kenya Bureau of Standards.","foundingDate":"2013","email":"{{EMAIL}}","telephone":"+254720100001","url":"https://deterpro.co.ke/","address":{"@type":"PostalAddress","streetAddress":"Mokoyeti West Road, off Langata Road","addressLocality":"Karen, Nairobi","postOfficeBoxNumber":"41514-00100","addressRegion":"Nairobi","addressCountry":"KE"},"areaServed":{"@type":"City","name":"Nairobi"},"currenciesAccepted":"KES","openingHoursSpecification":[{"@type":"OpeningHoursSpecification","dayOfWeek":["Monday","Tuesday","Wednesday","Thursday","Friday"],"opens":"08:00","closes":"17:00"}]}
</script>
'@

New-Page -Path "index.html" -Canon "" -ExtraHead $LD `
  -Title "Finches &mdash; KEBS-Approved Soaps &amp; Cleaning Agents in Nairobi" `
  -Desc "KEBS-approved handwash, detergent, dishwash, disinfectant and stain remover. Made in Karen, Nairobi. 500ml bottles to 20-litre jerrycans, delivered across Nairobi." `
  -Body $HOMEBODY

# ============================================================ products.html

$PRODUCTSBODY = @'
<div class="page-head">
  <div class="wrap page-head__inner">
    <p class="eyebrow">Products &amp; sizes</p>
    <h1>Every product, <em>every size</em></h1>
    <p>Five Finches lines covering hands, dishes, floors, germs and stains. Set your quantities below and send the list straight to WhatsApp &mdash; we will come back with a price.</p>
  </div>
</div>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head">
        <h2>Build your list</h2>
        <p>Set the quantities, send the list, and we will come back with a price and a delivery cost. Everything we quote includes VAT.</p>
      </div>

      <div class="builder" data-builder data-whatsapp="254720100001">
        <div class="builder__head">
          <h3>Your list</h3>
          <p>Quantities are per container. Nothing is ordered until we have quoted you and you have said yes.</p>
        </div>
        <div class="builder__list">
          {{ROWS}}
        </div>
        <div class="builder__foot">
          <a class="btn btn--wa" data-send aria-disabled="true" href="https://wa.me/254720100001">
            <svg width="20" height="20" viewBox="0 0 24 24" aria-hidden="true" fill="currentColor"><path d="M12 2a10 10 0 0 0-8.6 15l-1.3 4.7 4.8-1.3A10 10 0 1 0 12 2zm5.8 14.2c-.2.7-1.4 1.3-2 1.4-.5.1-1.1.1-1.8-.1-.4-.1-1-.3-1.7-.6-3-1.3-4.9-4.3-5-4.5-.2-.2-1.2-1.6-1.2-3s.7-2.1 1-2.4c.3-.3.6-.4.8-.4h.6c.2 0 .4 0 .7.5l.9 2.2c.1.2.1.4 0 .6l-.4.5-.3.4c-.1.1-.3.3-.1.6.2.3.8 1.3 1.7 2.1 1.1 1 2 1.3 2.3 1.5.3.1.5.1.6 0l.9-1.1c.2-.2.4-.2.6-.1l2.1 1c.3.1.5.2.5.3.1.2.1.7-.2 1.4z"/></svg>
            Send list on WhatsApp
          </a>
          <p class="builder__note"><span data-count>0</span> line(s) selected. Quantities are per container.</p>
          <p class="builder__note"><strong>Everything we quote includes VAT.</strong> Deterpro Enterprises &middot; PIN P051438845O &middot; we can invoice you properly.</p>
        </div>
      </div>

      <div class="callout callout--blue">
        <h3>Buying wholesale?</h3>
        <p>Trade minimums are 12 pieces on 500ml and 1L, and 5 pieces on 5L and 20L. Approved accounts get 30 days. See <a href="bulk.html">bulk &amp; trade</a>.</p>
      </div>
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>The full range</h2><p>Every line and the containers we fill it in.</p></div>
      {{TABLE}}
    </div>
  </div>
</section>

<section class="band">
  <div class="wrap band__inner">
    <div class="band__body">
      <div class="band__head"><h2>What each product is for</h2><p>Open any product for the detail, the sizes and where it is used.</p></div>
      <div class="grid-rule">
        <article class="product" style="--code:var(--p-handwash)"><h3 class="product__name"><a href="products/handwash.html">Antibacterial Handwash</a></h3><p class="product__use">Germs at every basin. Sierra Mist, Sweet Rose or Sea Breeze.</p><a class="product__link" href="products/handwash.html">Details &rarr;</a></article>
        <article class="product" style="--code:var(--p-multi)"><h3 class="product__name"><a href="products/multipurpose-detergent.html">Multipurpose Detergent</a></h3><p class="product__use">Floors, walls and every washable surface.</p><a class="product__link" href="products/multipurpose-detergent.html">Details &rarr;</a></article>
        <article class="product" style="--code:var(--p-dish)"><h3 class="product__name"><a href="products/dishwashing-soap.html">Dishwashing Soap</a></h3><p class="product__use">Holds its foam through a full sink.</p><a class="product__link" href="products/dishwashing-soap.html">Details &rarr;</a></article>
        <article class="product" style="--code:var(--p-disinfect)"><h3 class="product__name"><a href="products/disinfectant.html">Disinfectant</a></h3><p class="product__use">Drains, sinks, toilets and food surfaces.</p><a class="product__link" href="products/disinfectant.html">Details &rarr;</a></article>
        <article class="product" style="--code:var(--p-stain)"><h3 class="product__name"><a href="products/rust-stain-remover.html">Rust &amp; Stain Remover</a></h3><p class="product__use">Rust marks and set-in stains.</p><a class="product__link" href="products/rust-stain-remover.html">Details &rarr;</a></article>
      </div>
    </div>
  </div>
</section>
'@

# No prices here on purpose. The builder assembles a list of what the customer
# wants and hands it to WhatsApp; Deterpro quotes it. Nothing in the page or
# the JavaScript computes a figure any more.
$items = @(
  @{n='Antibacterial Handwash'; s='500 ml';   c='p-handwash'},
  @{n='Antibacterial Handwash'; s='5 litres'; c='p-handwash'},
  @{n='Antibacterial Handwash'; s='20 litres';c='p-handwash'},
  @{n='Multipurpose Detergent'; s='1 litre';  c='p-multi'},
  @{n='Multipurpose Detergent'; s='5 litres'; c='p-multi'},
  @{n='Multipurpose Detergent'; s='20 litres';c='p-multi'},
  @{n='Dishwashing Soap';       s='1 litre';  c='p-dish'},
  @{n='Dishwashing Soap';       s='5 litres'; c='p-dish'},
  @{n='Dishwashing Soap';       s='20 litres';c='p-dish'},
  @{n='Disinfectant';           s='500 ml';   c='p-disinfect'},
  @{n='Disinfectant';           s='1 litre';  c='p-disinfect'},
  @{n='Disinfectant';           s='5 litres'; c='p-disinfect'},
  @{n='Disinfectant';           s='20 litres';c='p-disinfect'},
  @{n='Rust & Stain Remover';   s='500 ml';   c='p-stain'},
  @{n='Rust & Stain Remover';   s='1 litre';  c='p-stain'},
  @{n='Rust & Stain Remover';   s='5 litres'; c='p-stain'},
  @{n='Rust & Stain Remover';   s='20 litres';c='p-stain'}
)

$sb = New-Object System.Text.StringBuilder
$i = 0
foreach ($it in $items) {
  $i++
  $safe = $it.n.Replace('&', '&amp;')
  $id = "q$i"
  [void]$sb.AppendLine("          <div class=""builder__row"" style=""--code:var(--$($it.c))"" data-item data-name=""$safe"" data-size=""$($it.s)"">")
  [void]$sb.AppendLine("            <span class=""builder__name""><i aria-hidden=""true""></i><span>$safe &middot; $($it.s)</span></span>")
  [void]$sb.AppendLine("            <span class=""qty"">")
  [void]$sb.AppendLine("              <button type=""button"" data-step=""-1"" aria-label=""Remove one $safe $($it.s)"">&minus;</button>")
  [void]$sb.AppendLine("              <label class=""visually-hidden"" for=""$id"">Quantity of $safe $($it.s)</label>")
  [void]$sb.AppendLine("              <input id=""$id"" type=""number"" inputmode=""numeric"" min=""0"" step=""1"" value=""0"">")
  [void]$sb.AppendLine("              <button type=""button"" data-step=""1"" aria-label=""Add one $safe $($it.s)"">+</button>")
  [void]$sb.AppendLine("            </span>")
  [void]$sb.AppendLine("          </div>")
}

$PRODUCTSBODY = $PRODUCTSBODY.Replace('{{ROWS}}', $sb.ToString().TrimEnd()).Replace('{{TABLE}}', $PRICETABLE) + $CLOSING

New-Page -Path "products.html" -Canon "products.html" `
  -Title "Products &amp; Sizes &mdash; Finches Cleaning Products, Nairobi" `
  -Desc "The full Finches range: handwash, detergent, dishwash, disinfectant and rust &amp; stain remover, 500ml to 20 litres. Build a list and send it on WhatsApp for a price." `
  -Body $PRODUCTSBODY
