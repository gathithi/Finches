/* ==========================================================================
   FINCHES - by Deterpro Enterprises
   Site behaviour. No dependencies. Loaded with `defer`.

   Everything here is progressive enhancement: with JavaScript disabled the
   nav renders as an open list, FAQ answers render expanded, all content is
   visible, and the price table stands in for the order builder.
   ========================================================================== */

(function () {
  'use strict';

  var WHATSAPP_ORDERS = '254720100001';

  var REDUCED = window.matchMedia
    ? window.matchMedia('(prefers-reduced-motion: reduce)')
    : { matches: false };

  /* ------------------------------------------------------------------
     Mobile navigation
     ------------------------------------------------------------------ */

  function initNav() {
    var toggle = document.querySelector('.nav-toggle');
    var nav = document.getElementById('site-nav');
    if (!toggle || !nav) return;

    nav.setAttribute('data-open', 'false');

    function setOpen(open) {
      nav.setAttribute('data-open', open ? 'true' : 'false');
      toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
      toggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
    }

    toggle.addEventListener('click', function () {
      setOpen(toggle.getAttribute('aria-expanded') !== 'true');
    });

    nav.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') setOpen(false);
    });

    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
        setOpen(false);
        toggle.focus();
      }
    });

    document.addEventListener('click', function (e) {
      if (toggle.getAttribute('aria-expanded') !== 'true') return;
      if (!nav.contains(e.target) && !toggle.contains(e.target)) setOpen(false);
    });

    var wide = window.matchMedia('(min-width: 64em)');
    var onChange = function (e) { if (e.matches) setOpen(false); };
    if (wide.addEventListener) wide.addEventListener('change', onChange);
    else if (wide.addListener) wide.addListener(onChange);
  }

  /* ------------------------------------------------------------------
     FAQ accordion

     The question button sits inside an <h2>, so the answer is found by
     walking up to .faq__item - nextElementSibling would be null. Open
     state rides on the item; the height animation lives in CSS.
     ------------------------------------------------------------------ */

  function initFaq() {
    var questions = document.querySelectorAll('.faq__q');
    if (!questions.length) return;

    Array.prototype.forEach.call(questions, function (btn, i) {
      var item = btn.closest ? btn.closest('.faq__item') : btn.parentNode.parentNode;
      var answer = item && item.querySelector('.faq__a');
      if (!answer) return;

      answer.hidden = false;
      if (!answer.id) { answer.id = 'faq-answer-' + (i + 1); }
      btn.setAttribute('aria-controls', answer.id);

      var open = i === 0;
      btn.setAttribute('aria-expanded', open ? 'true' : 'false');
      if (open) { item.classList.add('is-open'); }

      btn.addEventListener('click', function () {
        var isOpen = btn.getAttribute('aria-expanded') === 'true';
        btn.setAttribute('aria-expanded', isOpen ? 'false' : 'true');
        if (isOpen) { item.classList.remove('is-open'); }
        else { item.classList.add('is-open'); }
      });
    });
  }

  /* ------------------------------------------------------------------
     Order builder -> pre-filled WhatsApp message
     ------------------------------------------------------------------ */

  function initBuilder() {
    var builder = document.querySelector('[data-builder]');
    if (!builder) return;

    var rows = builder.querySelectorAll('[data-item]');
    var countOut = builder.querySelector('[data-count]');
    var sendBtn = builder.querySelector('[data-send]');
    if (!rows.length || !sendBtn) return;

    var number = builder.getAttribute('data-whatsapp') || WHATSAPP_ORDERS;

    function readRow(row) {
      var input = row.querySelector('input');
      var qty = parseInt(input && input.value, 10);
      if (!qty || qty < 0 || isNaN(qty)) qty = 0;
      var scentSelect = row.querySelector('[data-scent]');
      return {
        name: row.getAttribute('data-name') || '',
        size: row.getAttribute('data-size') || '',
        scent: scentSelect ? scentSelect.value : '',
        qty: qty
      };
    }

    // Prices are quoted by Deterpro, not published, so this builds a list and
    // nothing else. There is no total to compute and none to animate.
    function update() {
      var lines = [];

      Array.prototype.forEach.call(rows, function (row) {
        var item = readRow(row);
        if (item.qty > 0) {
          var line = item.qty + ' x ' + item.name + ' ' + item.size;
          if (item.scent) line += ' (' + item.scent + ')';
          lines.push(line);
        }
      });

      if (countOut) countOut.textContent = lines.length ? String(lines.length) : '0';

      var disabled = lines.length === 0;
      sendBtn.setAttribute('aria-disabled', disabled ? 'true' : 'false');

      var message =
        'Hello Finches, please quote me for:\n\n' +
        lines.join('\n') +
        '\n\nPlease confirm the price and the delivery cost.';

      sendBtn.setAttribute('href', 'https://wa.me/' + number + '?text=' + encodeURIComponent(message));
    }

    Array.prototype.forEach.call(rows, function (row) {
      var input = row.querySelector('input');
      var minus = row.querySelector('[data-step="-1"]');
      var plus = row.querySelector('[data-step="1"]');
      var scentSelect = row.querySelector('[data-scent]');

      function nudge(by) {
        var next = (parseInt(input.value, 10) || 0) + by;
        input.value = next < 0 ? 0 : next;
        update();
      }

      if (input) input.addEventListener('input', update);
      if (minus) minus.addEventListener('click', function () { nudge(-1); });
      if (plus) plus.addEventListener('click', function () { nudge(1); });
      if (scentSelect) scentSelect.addEventListener('change', update);
    });

    sendBtn.addEventListener('click', function (e) {
      if (sendBtn.getAttribute('aria-disabled') === 'true') e.preventDefault();
    });

    update();
  }

  /* ------------------------------------------------------------------
     Scroll reveal

     IntersectionObserver only - no scroll listener, no rAF loop. Each
     element is unobserved the moment it lands.
     ------------------------------------------------------------------ */

  var REVEAL = [
    '.band__head', '.grid-rule > *', '.steps > *', '.tags', '.clients > *',
    '.trade', '.freeship', '.table-scroll', '.faq', '.social--lg',
    '.callout', '.close__inner > *'
  ].join(',');

  function initReveal() {
    var targets = document.querySelectorAll(REVEAL);
    if (!targets.length) return;

    function showAll() {
      Array.prototype.forEach.call(targets, function (el) { el.classList.add('is-in'); });
    }

    if (!('IntersectionObserver' in window) || REDUCED.matches) {
      showAll();
      return;
    }

    var observerReported = false;

    var io = new IntersectionObserver(function (entries) {
      // The first callback covers every observed element, in view or not,
      // so one callback proves the observer is alive.
      observerReported = true;

      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        entry.target.classList.add('is-in');
        io.unobserve(entry.target);
      });
    }, { rootMargin: '0px 0px -12% 0px', threshold: 0.01 });

    Array.prototype.forEach.call(targets, function (el) { io.observe(el); });

    // Deliberately conditional. A blanket timeout would reveal the whole
    // page before the reader ever scrolled to it, which defeats the effect.
    setTimeout(function () {
      if (!observerReported) showAll();
    }, 2000);
  }

  /* ------------------------------------------------------------------
     Header shadow once the page has scrolled

     A zero-height sentinel is observed, so this costs nothing per frame.
     ------------------------------------------------------------------ */

  function initStickyHeader() {
    var header = document.querySelector('.site-header');
    if (!header || !('IntersectionObserver' in window)) return;

    var sentinel = document.createElement('div');
    sentinel.setAttribute('aria-hidden', 'true');
    sentinel.style.cssText = 'position:absolute;top:0;left:0;width:1px;height:1px;pointer-events:none;';
    document.body.insertBefore(sentinel, document.body.firstChild);

    new IntersectionObserver(function (entries) {
      header.classList.toggle('is-stuck', !entries[0].isIntersecting);
    }, { threshold: 0 }).observe(sentinel);
  }

  /* ------------------------------------------------------------------
     Dark mode

     Light is the default. The choice is stored, and applied by a tiny
     inline script in <head> before first paint so the page never flashes
     white on the way to dark.
     ------------------------------------------------------------------ */

  var THEME_KEY = 'finches-theme';

  function initTheme() {
    var btn = document.querySelector('.theme-toggle');
    if (!btn) return;

    function current() {
      return document.documentElement.getAttribute('data-theme') === 'dark' ? 'dark' : 'light';
    }

    function paint(theme) {
      document.documentElement.setAttribute('data-theme', theme);
      var dark = theme === 'dark';
      btn.setAttribute('aria-pressed', dark ? 'true' : 'false');
      var label = dark ? 'Switch to light mode' : 'Switch to dark mode';
      btn.setAttribute('aria-label', label);
      btn.setAttribute('title', label);

      // keep the mobile browser chrome in step with the page
      var meta = document.querySelector('meta[name="theme-color"]');
      if (meta) meta.setAttribute('content', dark ? '#131610' : '#EE7B18');
    }

    paint(current());

    btn.addEventListener('click', function () {
      var next = current() === 'dark' ? 'light' : 'dark';
      paint(next);
      try { localStorage.setItem(THEME_KEY, next); } catch (e) {}
    });
  }

  /* ------------------------------------------------------------------
     Tracking

     Nothing loads unless an ID was set in build-finches.ps1, and - when
     requireConsent is on - not until the visitor accepts. No ID means no
     script, no request, no cookie, and no banner.
     ------------------------------------------------------------------ */

  var CONSENT_KEY = 'finches-consent';
  var trackingLoaded = false;

  function trackingConfig() {
    var c = window.FINCHES_TRACKING;
    if (!c) return null;
    if (!c.ga4 && !c.pixel) return null;
    return c;
  }

  function loadTrackers() {
    var c = trackingConfig();
    if (!c || trackingLoaded) return;
    trackingLoaded = true;

    if (c.ga4) {
      var s = document.createElement('script');
      s.async = true;
      s.src = 'https://www.googletagmanager.com/gtag/js?id=' + c.ga4;
      document.head.appendChild(s);
      window.dataLayer = window.dataLayer || [];
      window.gtag = function () { window.dataLayer.push(arguments); };
      window.gtag('js', new Date());
      window.gtag('config', c.ga4, { anonymize_ip: true });
    }

    if (c.pixel) {
      /* eslint-disable */
      !function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
      n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
      n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
      t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}
      (window,document,'script','https://connect.facebook.net/en_US/fbevents.js');
      /* eslint-enable */
      window.fbq('init', c.pixel);
      window.fbq('track', 'PageView');
    }
  }

  // One call for both tools, so page code never has to know which are on.
  function trackEvent(name, params) {
    params = params || {};
    if (window.gtag) { window.gtag('event', name, params); }
    if (window.fbq)  { window.fbq('trackCustom', name, params); }
  }

  function consentGiven() {
    try { return localStorage.getItem(CONSENT_KEY) === 'yes'; } catch (e) { return false; }
  }

  function initConsent() {
    var c = trackingConfig();
    if (!c) return;                       // nothing to consent to

    if (!c.requireConsent || consentGiven()) { loadTrackers(); return; }
    try { if (localStorage.getItem(CONSENT_KEY) === 'no') return; } catch (e) {}

    var bar = document.createElement('div');
    bar.className = 'consent';
    bar.setAttribute('role', 'dialog');
    bar.setAttribute('aria-label', 'Cookies');
    bar.innerHTML =
      '<p class="consent__text">We use cookies to see which pages people find useful. ' +
      'Nothing is loaded until you choose.</p>' +
      '<div class="consent__actions">' +
      '<button class="btn btn--primary" data-consent="yes" type="button">Accept</button>' +
      '<button class="btn btn--ghost" data-consent="no" type="button">Decline</button>' +
      '</div>';
    document.body.appendChild(bar);

    bar.addEventListener('click', function (e) {
      var choice = e.target.getAttribute && e.target.getAttribute('data-consent');
      if (!choice) return;
      try { localStorage.setItem(CONSENT_KEY, choice); } catch (err) {}
      if (choice === 'yes') loadTrackers();
      bar.remove();
    });
  }

  /* Conversions worth counting. The sale itself happens in WhatsApp, which
     no pixel can see - so the meaningful event is the handover. */
  function initConversionTracking() {
    if (!trackingConfig()) return;

    document.addEventListener('click', function (e) {
      var a = e.target.closest ? e.target.closest('a[href]') : null;
      if (!a) return;
      var href = a.getAttribute('href') || '';

      if (href.indexOf('wa.me/') > -1) {
        var isOrder = a.hasAttribute('data-send');
        trackEvent(isOrder ? 'order_sent' : 'whatsapp_click', {
          number: (href.match(/wa\.me\/(\d+)/) || [])[1] || '',
          page: location.pathname
        });
      } else if (href.indexOf('tel:') === 0) {
        trackEvent('phone_click', { number: href.replace('tel:', ''), page: location.pathname });
      } else if (href.indexOf('mailto:') === 0) {
        trackEvent('email_click', { page: location.pathname });
      }
    });
  }

  /* ------------------------------------------------------------------
     Current page in the nav, and the footer year
     ------------------------------------------------------------------ */

  function initCurrentPage() {
    var here = window.location.pathname.replace(/\/index\.html$/, '/').replace(/\/$/, '') || '/';
    var links = document.querySelectorAll('#site-nav a[href]');
    Array.prototype.forEach.call(links, function (link) {
      var path = link.pathname.replace(/\/index\.html$/, '/').replace(/\/$/, '') || '/';
      if (path === here) link.setAttribute('aria-current', 'page');
    });
  }

  function initYear() {
    var slots = document.querySelectorAll('[data-year]');
    var year = String(new Date().getFullYear());
    Array.prototype.forEach.call(slots, function (el) { el.textContent = year; });
  }

  /* ------------------------------------------------------------------ */

  function boot() {
    initTheme();
    initNav();
    initFaq();
    initBuilder();
    initCurrentPage();
    initYear();
    initReveal();
    initStickyHeader();
    initConsent();
    initConversionTracking();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot);
  } else {
    boot();
  }
})();
