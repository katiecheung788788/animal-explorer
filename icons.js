/* =====================================================================
   Animal Explorer — icon system (no emoji)
   • Injects an SVG sprite (thin-line UI icons + filled category silhouettes)
   • window.catIcon(category) -> <svg> string for JS-rendered markers/cards
   • One-time decoration pass: strips emoji from static chrome, injects icons
   Load in <head> BEFORE the page's inline <script> so catIcon() exists early.
   ===================================================================== */
(function () {
  'use strict';

  /* ---- SVG sprite ---- */
  const SPRITE = `
<svg xmlns="http://www.w3.org/2000/svg" style="position:absolute;width:0;height:0;overflow:hidden" aria-hidden="true">
  <!-- thin-line UI icons (stroke) -->
  <symbol id="ic-search" viewBox="0 0 24 24"><circle cx="11" cy="11" r="7"/><line x1="16.5" y1="16.5" x2="21" y2="21"/></symbol>
  <symbol id="ic-shuffle" viewBox="0 0 24 24"><path d="M16 4h4v4"/><path d="M4 20 20 4"/><path d="M16 20h4v-4"/><path d="m4 4 5 5"/></symbol>
  <symbol id="ic-satellite" viewBox="0 0 24 24"><circle cx="12" cy="12" r="1.6"/><path d="M12 7a5 5 0 0 1 5 5"/><path d="M12 4a8 8 0 0 1 8 8"/></symbol>
  <symbol id="ic-pin" viewBox="0 0 24 24"><path d="M12 21s-6-5.7-6-10a6 6 0 1 1 12 0c0 4.3-6 10-6 10z"/><circle cx="12" cy="11" r="2.2"/></symbol>
  <symbol id="ic-camera" viewBox="0 0 24 24"><path d="M3 8h3l1.5-2h9L18 8h3v11H3z"/><circle cx="12" cy="13" r="3.2"/></symbol>
  <symbol id="ic-arrow-left" viewBox="0 0 24 24"><path d="M15 5 8 12l7 7"/></symbol>
  <symbol id="ic-arrow-right" viewBox="0 0 24 24"><path d="m9 5 7 7-7 7"/></symbol>
  <symbol id="ic-check" viewBox="0 0 24 24"><path d="M5 12.5 10 17 19 7"/></symbol>
  <symbol id="ic-close" viewBox="0 0 24 24"><path d="M6 6 18 18M18 6 6 18"/></symbol>
  <symbol id="ic-leaf" viewBox="0 0 24 24"><path d="M5 19c0-8 6-13 14-13 0 8-5 14-14 14z"/><path d="M5 19c4-1.5 7-4.5 9-9"/></symbol>
  <symbol id="ic-location" viewBox="0 0 24 24"><path d="M12 21s-6-5.7-6-10a6 6 0 1 1 12 0c0 4.3-6 10-6 10z"/><circle cx="12" cy="11" r="2"/></symbol>
  <symbol id="ic-compass" viewBox="0 0 24 24"><circle cx="12" cy="12" r="9"/><path d="m15.5 8.5-2 5-5 2 2-5z"/></symbol>
  <!-- filled category silhouettes -->
  <symbol id="ic-cat-mammals" viewBox="0 0 24 24"><ellipse cx="12" cy="16" rx="5" ry="4.2"/><ellipse cx="5.4" cy="10.6" rx="2" ry="2.6"/><ellipse cx="9.6" cy="7" rx="2.1" ry="2.8"/><ellipse cx="14.4" cy="7" rx="2.1" ry="2.8"/><ellipse cx="18.6" cy="10.6" rx="2" ry="2.6"/></symbol>
  <symbol id="ic-cat-reptiles" viewBox="0 0 24 24"><path d="M12 2c1.1 0 2 .9 2 2 0 .7-.4 1.4-1 1.7.7.6 1.2 1.6 1.2 2.7 0 .5-.1 1-.3 1.4 1.7.6 3.4 1.9 3.4 3.4 0 .7-.6 1.2-1.3 1l-1.7-.5c.3.7.5 1.5.5 2.3 0 2.3-1 4.3-2.5 4.3S9.5 18.8 9.5 16.5c0-.8.2-1.6.5-2.3l-1.7.5c-.7.2-1.3-.3-1.3-1 0-1.5 1.7-2.8 3.4-3.4-.2-.4-.3-.9-.3-1.4 0-1.1.5-2.1 1.2-2.7-.6-.3-1-1-1-1.7 0-1.1.9-2 2-2z"/></symbol>
  <symbol id="ic-cat-birds" viewBox="0 0 24 24"><path d="M21 6.5c-1.4-.4-2.8.1-3.7 1C16.2 5.4 14.2 4.2 12 4.2c-3.4 0-6.2 2.8-6.2 6.2 0 .6.1 1.2.3 1.8L3 14.6l3.6-.5C7.9 15.5 9.9 16.4 12 16.4c4.1 0 7.5-3.1 8-7-.9.1-1.8.4-2.6.8.9-.8 2.3-2.6 3.6-3.7z"/><circle cx="10" cy="9" r="0.9"/></symbol>
  <symbol id="ic-cat-fish" viewBox="0 0 24 24"><path d="M2 12c1.8-3.2 5.5-5 9.5-5 3 0 5.5 1.3 7.2 3.2L22 7.4v9.2l-3.3-2.8c-1.7 1.9-4.2 3.2-7.2 3.2-4 0-7.7-1.8-9.5-5z"/><circle cx="8" cy="11" r="1" fill="#1b1d18"/></symbol>
  <symbol id="ic-cat-insects" viewBox="0 0 24 24"><ellipse cx="12" cy="14" rx="5" ry="6.5"/><circle cx="12" cy="5.5" r="2.6"/><path d="M12 8v12" stroke="#1b1d18" stroke-width="1.2" fill="none"/></symbol>
  <symbol id="ic-cat-amphibians" viewBox="0 0 24 24"><path d="M4 15c0-3.2 2-5.4 4.2-5.4.9 0 1.6.3 2.2.9.5-.4 1-.6 1.6-.6s1.1.2 1.6.6c.6-.6 1.3-.9 2.2-.9C18 9.6 20 11.8 20 15c0 .8-.2 1.6-.6 2.3H4.6C4.2 16.6 4 15.8 4 15z"/><circle cx="8.2" cy="8.4" r="2.1"/><circle cx="15.8" cy="8.4" r="2.1"/></symbol>
</svg>`;

  /* ---- icon-specific CSS (self-contained) ---- */
  const CSS = `
.svg-ic{display:inline-block;vertical-align:-.16em;width:1.05em;height:1.05em;
  stroke:currentColor;fill:none;stroke-width:1.6;stroke-linecap:round;stroke-linejoin:round;flex:none}
.cat-ic{fill:currentColor;stroke:none}
.animal-map-marker .svg-ic,.continent-marker .svg-ic{width:18px;height:18px}`;

  const CAT = { mammals:'ic-cat-mammals', reptiles:'ic-cat-reptiles', birds:'ic-cat-birds',
                fish:'ic-cat-fish', insects:'ic-cat-insects', amphibians:'ic-cat-amphibians' };

  function ic(id, cls){ return `<svg class="svg-ic${cls?' '+cls:''}"><use href="#${id}"/></svg>`; }
  function icPx(id, px){ return `<svg class="svg-ic" style="width:${px}px;height:${px}px"><use href="#${id}"/></svg>`; }
  // exposed for inline page scripts:
  window.catIcon = function (category){ return ic(CAT[category] || 'ic-cat-mammals', 'cat-ic'); };
  window.uiIcon  = function (name){ return ic('ic-' + name); };

  /* ---- emoji stripper ---- */
  const EMOJI_RE = /[\u{1F000}-\u{1FAFF}\u{2190}-\u{21FF}\u{2300}-\u{27BF}\u{2B00}-\u{2BFF}\u{FE00}-\u{FE0F}\u{1F1E6}-\u{1F1FF}\u{20E3}\u{2022}\u{FE0F}]/gu;
  const strip = s => (s || '').replace(EMOJI_RE, '').replace(/\s{2,}/g, ' ').trim();

  function setText(el, iconId, where){
    const txt = strip(el.textContent);
    el.textContent = txt;
    if (iconId){
      const svg = ic(iconId);
      if (where === 'after') el.insertAdjacentHTML('beforeend', (txt ? ' ' : '') + svg);
      else el.insertAdjacentHTML('afterbegin', svg + (txt ? ' ' : ''));
    }
  }
  const each = (sel, fn) => document.querySelectorAll(sel).forEach(fn);

  function decorate(){
    // text + leading/trailing icon
    each('.back-btn',        e => setText(e, 'ic-arrow-left'));
    each('.surprise-btn',    e => setText(e, 'ic-shuffle'));
    each('#reset-btn',       e => setText(e, 'ic-close'));
    each('.section-title',   e => setText(e, 'ic-leaf'));
    each('.map-hint',        e => setText(e, 'ic-satellite'));
    each('.explore-all-btn', e => setText(e, 'ic-arrow-right', 'after'));
    each('.card-link',       e => setText(e, 'ic-arrow-right', 'after'));
    // text only (category dot / state handled by CSS)
    ['.logo','.pill','.cat-btn','.region-pill','.total-badge','.card-continent','.cf-label']
      .forEach(s => each(s, e => setText(e)));
    // icon-only swaps (explicit px so they survive font-size:0 parents)
    each('.search-icon', e => e.innerHTML = icPx('ic-search', 18));
    each('.modal-close', e => e.innerHTML = icPx('ic-close', 16));
    each('.empty-state .big', e => e.innerHTML = icPx('ic-search', 46));
    each('.empty-icon',  e => e.innerHTML = icPx('ic-search', 40));
    each('.globe',       e => e.innerHTML = icPx('ic-compass', 52));
    each('.emoji-bg',    e => e.innerHTML = icPx('ic-compass', 46));
    each('.cf-all-globe',e => e.innerHTML = icPx('ic-compass', 30));
    // safety net: strip any stray emoji from all static text nodes.
    // Runs before the page's own render (our DOMContentLoaded listener is first),
    // so dynamic cards/markers/modals aren't in the DOM yet and are untouched here.
    const w = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
    let n; while ((n = w.nextNode())) {
      const nv = n.nodeValue.replace(EMOJI_RE, '');
      if (nv !== n.nodeValue) n.nodeValue = nv;
    }
  }

  function init(){
    document.head.insertAdjacentHTML('beforeend', '<style>' + CSS + '</style>');
    document.body.insertAdjacentHTML('afterbegin', SPRITE);
    decorate();
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
