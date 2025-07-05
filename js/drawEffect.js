// Efecto corazones volando (pocos corazones, duración 5s, sin brillo)
(function() {
  const colors = ['#db2777','#f472b6','#f9a8d4','#fff','#fb7185'];
  const flyingHeartsCanvas = document.getElementById('flying-hearts-canvas');
  if(!flyingHeartsCanvas) return;
  const flyingCtx = flyingHeartsCanvas.getContext('2d');
  let W = window.innerWidth, H = window.innerHeight;
  function resizeCanvas() {
    W = window.innerWidth;
    H = window.innerHeight;
    flyingHeartsCanvas.width = W;
    flyingHeartsCanvas.height = H;
  }
  window.addEventListener('resize', resizeCanvas);
  resizeCanvas();

  function randomBetween(a,b) {
    return a + Math.random()*(b-a);
  }

  function FlyingHeart(x, y, size, color, speed, dx, rotateSpeed) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.color = color;
    this.speed = speed;
    this.dx = dx;
    this.rotate = randomBetween(-0.2, 0.2);
    this.rotateSpeed = rotateSpeed;
    this.opacity = 1.0;
  }
  FlyingHeart.prototype.draw = function(ctx, time) {
    ctx.save();
    ctx.globalAlpha = this.opacity;
    ctx.translate(this.x, this.y);
    ctx.rotate(this.rotate + time * this.rotateSpeed);
    ctx.scale(this.size/25, this.size/25);
    ctx.beginPath();
    ctx.moveTo(0, 0);
    ctx.bezierCurveTo(0, -8, -12, -12, -12, 0);
    ctx.bezierCurveTo(-12, 10, 0, 14, 0, 22);
    ctx.bezierCurveTo(0, 14, 12, 10, 12, 0);
    ctx.bezierCurveTo(12, -12, 0, -8, 0, 0);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
    ctx.globalAlpha = 1;
    ctx.restore();
  };

  let flyingHeartsActive = false;
  let flyingHearts = [];
  let flyingHeartsTimeout = null;
  let flyingHeartsStartTime = 0;
  let flyingHeartsInterval = null;

  window.startFlyingHearts = function() {
    flyingHeartsActive = false;
    if (flyingHeartsTimeout) clearTimeout(flyingHeartsTimeout);
    if (flyingHeartsInterval) clearInterval(flyingHeartsInterval);
    flyingHearts = [];
    flyingCtx.clearRect(0,0,W,H);

    flyingHeartsActive = true;
    flyingHeartsStartTime = performance.now();
    const heartsPerFrame = 1; // solo 1 por ciclo
    const heartInterval = 180; // cada 180 ms (menos corazones aún)

    function launchHearts() {
      if (!flyingHeartsActive) return;
      let now = performance.now();
      for (let i = 0; i < heartsPerFrame; ++i) {
        const x = randomBetween(30, W-30);
        const size = randomBetween(18, 32); // más pequeños
        const color = colors[Math.floor(Math.random()*colors.length)];
        const speed = randomBetween(2.2, 3.2); // px/frame
        const dx = randomBetween(-0.5,0.5); // menos desplazamiento lateral
        const rotateSpeed = randomBetween(-0.004, 0.004);
        flyingHearts.push(new FlyingHeart(x, H+size, size, color, speed, dx, rotateSpeed));
      }
      if (now - flyingHeartsStartTime < 5000) {
        setTimeout(launchHearts, heartInterval);
      }
    }
    launchHearts();

    function drawFlyingHearts() {
      flyingCtx.clearRect(0,0,W,H);
      let time = performance.now()/4000;
      for (let h of flyingHearts) {
        h.draw(flyingCtx, time);
      }
    }
    function updateFlyingHearts() {
      for (let h of flyingHearts) {
        h.y -= h.speed;
        h.x += h.dx;
        h.rotate += h.rotateSpeed;
      }
      flyingHearts = flyingHearts.filter(h => h.y + h.size > -20 && h.opacity > 0.01);
      drawFlyingHearts();
    }
    flyingHeartsInterval = setInterval(updateFlyingHearts, 33); // 30 FPS

    flyingHeartsTimeout = setTimeout(() => {
      flyingHeartsActive = false;
      const fadeStart = performance.now();
      function fade() {
        let elapsed = performance.now()-fadeStart;
        let ratio = Math.max(0, 1-elapsed/600);
        for (let h of flyingHearts) h.opacity = ratio;
        drawFlyingHearts();
        if (ratio>0) setTimeout(fade, 33);
        else {
          flyingHearts = [];
          clearInterval(flyingHeartsInterval);
          drawFlyingHearts();
        }
      }
      fade();
    }, 5000); // duración 5 segundos
  };

  document.addEventListener('DOMContentLoaded', function() {
    const bigHeartBtn = document.getElementById('bigHeartBtn');
    if(bigHeartBtn) {
      bigHeartBtn.addEventListener('click', function() {
        bigHeartBtn.classList.add('heart-animate');
        setTimeout(()=>bigHeartBtn.classList.remove('heart-animate'), 600);
        window.startFlyingHearts();
      });
    }
  });
})();
