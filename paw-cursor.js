/* =====================================================================
   Paw-print cursor + walking trail   —  vanilla JS, no dependencies
   Drop <script src="paw-cursor.js" defer></script> before </body>.
   ===================================================================== */
(function () {
  'use strict';

  /* ============== TWEAK ME ============== */
  const CURSOR_SIZE  = 30;             // px — size of the cursor paw (keep ~28–32)
  const TRAIL_SIZE   = 18;             // px — size of each trail paw
  const SPAWN_EVERY  = 90;             // ms — min gap between trail prints (throttle)
  const FADE_MS      = 900;            // ms — how long a print takes to fade & vanish (~0.8–1s)
  const START_ALPHA  = 0.5;            // starting opacity of a trail print (faint -> gone)
  const SIDE_OFFSET  = 6;              // px — how far prints step left/right of the path
  const CURSOR_COLOR = '#f0d07a';      // cursor paw colour (site gold accent)
  const TRAIL_COLOR  = '240, 208, 122';// trail paw colour as "r, g, b"
  /* ====================================== */

  /* ---- Capability checks ---- */
  const finePointer  = window.matchMedia('(pointer: fine)').matches;
  // No mouse / touch-only device -> do nothing at all.
  if (!finePointer) return;

  const reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ---- Paw shape (single source of truth) ----
     viewBox 32x32, toes pointing "up" (north). */
  function pawMarkup(size, fill, stroke) {
    const strokeAttr = stroke
      ? `stroke="${stroke}" stroke-width="1"` : '';
    return `<svg xmlns="http://www.w3.org/2000/svg" width="${size}" height="${size}" viewBox="0 0 32 32">` +
      `<g fill="${fill}" ${strokeAttr}>` +
      `<ellipse cx="16" cy="21.5" rx="7" ry="6"/>` +           // main pad
      `<ellipse cx="7"  cy="13" rx="2.7" ry="3.6"/>` +          // toes
      `<ellipse cx="12.5" cy="7.5" rx="2.9" ry="3.9"/>` +
      `<ellipse cx="19.5" cy="7.5" rx="2.9" ry="3.9"/>` +
      `<ellipse cx="25" cy="13" rx="2.7" ry="3.6"/>` +
      `</g></svg>`;
  }

  /* ---- 1. Replace the cursor everywhere (incl. links & buttons) ---- */
  const cursorURL = 'data:image/svg+xml,' +
    encodeURIComponent(pawMarkup(CURSOR_SIZE, CURSOR_COLOR, 'rgba(0,0,0,.55)'));
  const hot = Math.round(CURSOR_SIZE / 2); // hotspot = centre of the paw
  const style = document.createElement('style');
  style.textContent =
    `*, a, button, [role="button"], input, label, select, textarea ` +
    `{ cursor: url("${cursorURL}") ${hot} ${hot}, auto !important; }`;
  document.head.appendChild(style);

  /* Reduced motion: static paw cursor only, no trail. */
  if (reduceMotion) return;

  /* ---- 2. Trail layer (never blocks clicks) ---- */
  const layer = document.createElement('div');
  layer.style.cssText =
    'position:fixed;inset:0;pointer-events:none;z-index:2147483647;overflow:hidden;';
  document.body.appendChild(layer);

  const trailURL = 'data:image/svg+xml,' +
    encodeURIComponent(pawMarkup(TRAIL_SIZE, `rgba(${TRAIL_COLOR}, 1)`, null));

  let lastSpawn = 0;
  let lastX = null, lastY = null;
  let side = 1; // alternate left/right each print

  function spawn(x, y, angleDeg) {
    // Step the print to alternating sides, perpendicular to travel.
    const perp = (angleDeg + 90) * Math.PI / 180;
    const ox = Math.cos(perp) * SIDE_OFFSET * side;
    const oy = Math.sin(perp) * SIDE_OFFSET * side;
    side = -side;

    const paw = document.createElement('div');
    paw.style.cssText =
      `position:absolute;left:0;top:0;width:${TRAIL_SIZE}px;height:${TRAIL_SIZE}px;` +
      `background:url("${trailURL}") center/contain no-repeat;` +
      `transform:translate(${x + ox - TRAIL_SIZE / 2}px,${y + oy - TRAIL_SIZE / 2}px) ` +
      `rotate(${angleDeg + 90}deg);will-change:opacity;`;
    layer.appendChild(paw);

    // Fade faint -> gone, then remove from the DOM (no leaks).
    const anim = paw.animate(
      [{ opacity: START_ALPHA }, { opacity: 0 }],
      { duration: FADE_MS, easing: 'ease-out', fill: 'forwards' }
    );
    anim.onfinish = anim.oncancel = () => paw.remove();
  }

  window.addEventListener('mousemove', function (e) {
    const now = e.timeStamp;
    if (lastX === null) { lastX = e.clientX; lastY = e.clientY; }
    if (now - lastSpawn < SPAWN_EVERY) return;

    const dx = e.clientX - lastX, dy = e.clientY - lastY;
    if (dx === 0 && dy === 0) return;           // no movement, no print
    const angle = Math.atan2(dy, dx) * 180 / Math.PI;

    spawn(e.clientX, e.clientY, angle);
    lastSpawn = now;
    lastX = e.clientX;
    lastY = e.clientY;
  }, { passive: true });

  /* Tab hidden: clear any lingering prints so nothing piles up. */
  document.addEventListener('visibilitychange', function () {
    if (document.hidden) layer.replaceChildren();
  });
})();
