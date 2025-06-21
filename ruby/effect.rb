# ./ruby/effect.rb
# Super pack de efectos visuales para HTML desde Ruby.
# Incluye: Glow, Neon, Shadows, Animaciones complejas, Transiciones, 3D, Flip, Blur, Distorsión, Filtros, Parpadeo, etc.
# Cada método devuelve HTML+CSS+JS listo para insertar en una página.

module EffectPack
  # Efecto Glow animado
  def self.glow(text, color="#5ef")
    <<-HTML
<span class="efx-glow">#{text}</span>
<style>
.efx-glow {
  color: #fff;
  background: #222;
  padding: 6px 18px;
  border-radius: 8px;
  font-weight: bold;
  box-shadow: 0 0 16px #{color}, 0 0 32px #{color};
  animation: efx-glow-pulse 1.6s infinite alternate;
}
@keyframes efx-glow-pulse {
  0% { box-shadow: 0 0 12px #{color}, 0 0 24px #{color}; }
  100% { box-shadow: 0 0 24px #0ff, 0 0 48px #0ff; }
}
</style>
    HTML
  end

  # Efecto de Glow multicolor (neón arcoíris)
  def self.neon_rainbow(text)
    <<-HTML
<span class="efx-neon-rainbow">#{text}</span>
<style>
.efx-neon-rainbow {
  font-weight: bold;
  color: #fff;
  letter-spacing: 1.5px;
  padding: 8px 24px;
  border-radius: 10px;
  background: linear-gradient(90deg,#f0f, #0ff, #ff0, #f0f);
  background-size: 400% 400%;
  animation: efx-neon-rainbow-bg 3.7s linear infinite, efx-neon-rainbow-glow 1.5s infinite alternate;
  box-shadow: 0 0 30px #fff7, 0 0 70px #f0f7, 0 0 40px #0ff7;
}
@keyframes efx-neon-rainbow-glow {
  0% { box-shadow: 0 0 12px #fff7, 0 0 32px #f0f7, 0 0 14px #0ff7; }
  100% { box-shadow: 0 0 40px #fff, 0 0 80px #ff0a, 0 0 50px #0ffb; }
}
@keyframes efx-neon-rainbow-bg {
  0% { background-position: 0% 50%;}
  100% { background-position: 100% 50%;}
}
</style>
    HTML
  end

  # Efecto de sombra múltiple dinámica
  def self.dynamic_shadow(text)
    <<-HTML
<span class="efx-dyn-shadow">#{text}</span>
<style>
.efx-dyn-shadow {
  color: #fff;
  font-size: 1.2em;
  text-shadow: 2px 2px 10px #000, 0 0 12px #0ff, 0 0 24px #00f7, 0 0 3px #000a;
  animation: efx-dyn-shadow 2.3s infinite alternate;
}
@keyframes efx-dyn-shadow {
  0% { text-shadow: 2px 2px 10px #000, 0 0 12px #0ff, 0 0 24px #00f7, 0 0 3px #000a;}
  25% { text-shadow: 2px 5px 20px #000, 0 0 32px #0ff, 0 0 16px #0ffb;}
  50% { text-shadow: 2px 2px 15px #000, 0 0 24px #0ffa, 0 0 10px #005f;}
  75% { text-shadow: -2px 2px 20px #000, 0 0 32px #f0f, 0 0 12px #ff0c;}
  100% { text-shadow: 2px 2px 10px #000, 0 0 12px #0ff, 0 0 24px #00f7, 0 0 3px #000a;}
}
</style>
    HTML
  end

  # Efecto Flip 3D
  def self.flip_card(front, back)
    <<-HTML
<div class="efx-flip-card">
  <div class="efx-flip-inner">
    <div class="efx-flip-front">#{front}</div>
    <div class="efx-flip-back">#{back}</div>
  </div>
</div>
<style>
.efx-flip-card { width:180px; height:110px; perspective:800px; margin:18px auto;}
.efx-flip-inner {
  position:relative; width:100%; height:100%;
  transition: transform 0.65s cubic-bezier(.7,1.5,.7,1);
  transform-style: preserve-3d;
}
.efx-flip-card:hover .efx-flip-inner { transform: rotateY(180deg);}
.efx-flip-front, .efx-flip-back {
  position: absolute; width:100%; height:100%;
  backface-visibility: hidden;
  display:flex; align-items:center; justify-content:center;
  font-size:1.2rem; font-family:inherit;
  border-radius:12px;
  box-shadow: 0 2px 16px #0002;
}
.efx-flip-front { background: #0cf; color:#fff; }
.efx-flip-back { background: #232; color:#fff; transform: rotateY(180deg);}
</style>
    HTML
  end

  # Fade in effect: div que aparece suavemente
  def self.fade_in_div(content)
    <<-HTML
<div class="efx-fadein">#{content}</div>
<style>
.efx-fadein {
  opacity: 0;
  animation: efx-fadein 1.2s ease-in forwards;
}
@keyframes efx-fadein {
  to { opacity: 1; }
}
</style>
    HTML
  end

  # Fade out
  def self.fade_out_div(content)
    <<-HTML
<div class="efx-fadeout" onclick="this.classList.add('out');">#{content}</div>
<style>
.efx-fadeout {
  opacity: 1; transition: opacity 1.2s;
  cursor: pointer;
}
.efx-fadeout.out { opacity: 0; }
</style>
    HTML
  end

  # Efecto Bounce
  def self.bounce(text)
    <<-HTML
<span class="efx-bounce">#{text}</span>
<style>
.efx-bounce {
  display: inline-block;
  animation: efx-bounce 1.1s cubic-bezier(.21,.98,.6,.99) infinite alternate;
}
@keyframes efx-bounce {
  0% { transform: translateY(0);}
  40% { transform: translateY(-14px);}
  100% { transform: translateY(0);}
}
</style>
    HTML
  end

  # Efecto Shake
  def self.shake_button(label)
    <<-HTML
<button class="efx-shake" onclick="this.classList.add('active');setTimeout(()=>this.classList.remove('active'),700);">#{label}</button>
<style>
.efx-shake.active {
  animation: efx-shake 0.7s cubic-bezier(.36,.07,.19,.97) both;
}
@keyframes efx-shake {
  10%, 90% { transform: translateX(-1px);}
  20%, 80% { transform: translateX(3px);}
  30%, 50%, 70% { transform: translateX(-6px);}
  40%, 60% { transform: translateX(6px);}
}
.efx-shake {
  transition: box-shadow 0.2s;
  box-shadow: 0 2px 8px #ddd;
  border-radius: 8px;
  border: none;
  background: #2a2a2a;
  color: #fff;
  padding: 11px 28px;
  font-size: 1.1rem;
  font-family: inherit;
  font-weight: 700;
  cursor: pointer;
}
</style>
    HTML
  end

  # Efecto Blur on hover
  def self.blur_on_hover(text)
    <<-HTML
<span class="efx-blur-hv">#{text}</span>
<style>
.efx-blur-hv { transition: filter 0.4s;}
.efx-blur-hv:hover { filter: blur(3px) brightness(1.7);}
</style>
    HTML
  end

  # Efecto Parpadeo
  def self.blinking(text)
    <<-HTML
<span class="efx-blink">#{text}</span>
<style>
.efx-blink {
  animation: efx-blink 1s infinite steps(2, jump-none);
}
@keyframes efx-blink {
  0%, 49% { opacity: 1; }
  50%, 100% { opacity: 0.1; }
}
</style>
    HTML
  end

  # Efecto Texto typing machine
  def self.typing(text)
    chars = text.chars.map {|c| c == " " ? "&nbsp;" : c}.join
    <<-HTML
<span class="efx-typing" data-text="#{chars}"></span>
<style>
.efx-typing {
  border-right: 2px solid #fff;
  white-space: pre;
  font-family: 'Fira Mono', monospace, monospace;
  font-size: 1.22em;
  font-weight: 700;
  color: #0ff;
  background: #191b20;
  padding: 4px 17px;
  border-radius: 6px;
  min-width: 3ch;
  display: inline-block;
  letter-spacing: 1.2px;
}
</style>
<script>
(function(){
  var el = document.querySelector('.efx-typing');
  if(!el) return;
  var text = el.getAttribute('data-text');
  let i=0;
  function type() {
    if(i <= text.length) {
      el.innerHTML = text.slice(0,i) + '<span style="color:#fff;">|</span>';
      i++; setTimeout(type, 70 + Math.random()*50);
    } else {
      el.innerHTML = text;
    }
  }
  type();
})();
</script>
    HTML
  end

  # Efecto holograma con filtro
  def self.hologram(text)
    <<-HTML
<span class="efx-holo">#{text}</span>
<style>
.efx-holo {
  color: #fff; background: #171b1e;
  padding: 8px 24px; border-radius: 12px;
  letter-spacing:2px;
  font-weight: bold;
  position: relative;
  overflow: hidden;
  filter: drop-shadow(0 0 8px #0ff9) contrast(1.2);
}
.efx-holo:before {
  content: "";
  position: absolute; left: 0; top: 0;
  width: 100%; height: 100%;
  background: linear-gradient(120deg, #0ff8 20%, #fff0 70%, #f0f7 98%);
  mix-blend-mode: color-dodge;
  pointer-events: none;
  animation: efx-holo-glow 2.3s infinite alternate;
}
@keyframes efx-holo-glow {
  0% { filter: blur(1px);}
  100% { filter: blur(11px);}
}
</style>
    HTML
  end

  # Efecto de "distorsión glitch" de texto
  def self.glitch_text(text)
    <<-HTML
<span class="efx-glitch" data-text="#{text}">#{text}</span>
<style>
.efx-glitch {
  position: relative;
  color: #fff;
  font-size: 1.2em;
  font-family: 'Archivo Black', Arial, sans-serif;
  font-weight: bold;
  letter-spacing: 1.2px;
}
.efx-glitch:before, .efx-glitch:after {
  content: attr(data-text);
  position: absolute; left:0; top:0;
  width: 100%; overflow: hidden;
  color: #0ff;
  z-index: -1;
  clip-path: polygon(0 0,100% 0,100% 40%,0 40%);
  animation: efx-glitch-top 2s infinite linear alternate;
}
.efx-glitch:after {
  color: #f0f;
  clip-path: polygon(0 60%,100% 60%,100% 100%,0 100%);
  animation: efx-glitch-bottom 1.7s infinite alternate-reverse;
}
@keyframes efx-glitch-top {
  0% { transform: translateY(0px) translateX(0);}
  10% { transform: translateY(-2px) translateX(-3px);}
  30% { transform: translateY(1px) translateX(3px);}
  55% { transform: translateY(-1px) translateX(-1px);}
  100% { transform: translateY(0) translateX(0);}
}
@keyframes efx-glitch-bottom {
  0% { transform: translateY(0px) translateX(0);}
  13% { transform: translateY(2px) translateX(2px);}
  30% { transform: translateY(-1px) translateX(-2px);}
  65% { transform: translateY(1px) translateX(1px);}
  100% { transform: translateY(0) translateX(0);}
}
</style>
    HTML
  end

  # Efecto borde brillante animado (borde luminoso)
  def self.animated_border(content)
    <<-HTML
<div class="efx-anim-border">#{content}</div>
<style>
.efx-anim-border {
  display:inline-block; padding:14px 32px;
  border: 3px solid #fff4;
  border-radius: 16px;
  position:relative;
  background: #16191c;
  color:#fff;
  font-weight: 700;
  z-index: 10;
  overflow:hidden;
}
.efx-anim-border:after {
  content:"";
  position:absolute; left:-70%; top:0; width:50%; height:100%;
  background: linear-gradient(120deg, #00f0, #0ff7 30%, #0ff7 70%, #00f0 100%);
  filter: blur(2px);
  z-index: 1;
  animation: efx-anim-border-move 2.5s infinite linear;
}
@keyframes efx-anim-border-move {
  0% { left:-70%; }
  100% { left:120%; }
}
</style>
    HTML
  end

  # Efecto de fondo animado espacio profundo
  def self.deep_space_bg(content)
    <<-HTML
<div class="efx-space-bg">#{content}</div>
<style>
.efx-space-bg {
  padding: 30px 0; text-align:center; position:relative; z-index:1;
  color: #fff;
  background: #0a0b14;
  overflow: hidden;
}
.efx-space-bg:before, .efx-space-bg:after {
  content:"";
  position:absolute; left:0; top:0; width:100%; height:100%;
  pointer-events:none; z-index:0;
}
.efx-space-bg:before {
  background: radial-gradient(circle at 70% 30%, #0ff2 0%, #00f0 60%, #000 100%);
  opacity:0.7;
  animation: efx-space-bg-glow 5s infinite alternate;
}
.efx-space-bg:after {
  background: repeating-radial-gradient(circle at 40% 60%, #fff2 1px, #0000 2px, #0000 100px);
  animation: efx-space-bg-stars 8s infinite linear;
  opacity:0.5;
}
@keyframes efx-space-bg-glow {
  0% { opacity:0.7;}
  100% { opacity:1;}
}
@keyframes efx-space-bg-stars {
  0% { background-position: 0 0;}
  100% { background-position: 50px 100px;}
}
</style>
    HTML
  end

  # Efecto texto 3D con sombra y movimiento
  def self.text_3d(text)
    <<-HTML
<span class="efx-3d">#{text}</span>
<style>
.efx-3d {
  font-weight:900;
  font-size:1.6em;
  color:#fff;
  text-shadow:
    1px 1px 0 #0ff, 2px 2px 0 #0cf, 4px 4px 6px #000c, 6px 6px 12px #0ff7;
  letter-spacing:1.7px;
  position:relative;
  animation: efx-3d-move 2.1s infinite alternate cubic-bezier(.8,1.6,.5,1);
}
@keyframes efx-3d-move {
  0% { transform: skewY(0deg) rotateX(0) scale(1);}
  60% { transform: skewY(-8deg) rotateX(3deg) scale(1.07);}
  100% { transform: skewY(0deg) rotateX(0) scale(1);}
}
</style>
    HTML
  end

  # Efecto de resplandor pulsante alrededor de un div
  def self.pulsing_glow_box(content)
    <<-HTML
<div class="efx-pulse-glow">#{content}</div>
<style>
.efx-pulse-glow {
  padding: 27px 22px;
  margin: 32px auto;
  border-radius: 18px;
  background: #15181d;
  box-shadow: 0 0 30px #0ff9, 0 0 70px #0ff7;
  animation: efx-pulse-glow 2.7s infinite alternate;
  color: #fff;
  font-weight: 700;
  font-size:1.19em;
  text-align:center;
}
@keyframes efx-pulse-glow {
  0% { box-shadow: 0 0 16px #0ff7, 0 0 20px #0ff4;}
  100% { box-shadow: 0 0 50px #0ff, 0 0 90px #0ff5;}
}
</style>
    HTML
  end

  # Efecto "card hover lift" con profundidad 3D
  def self.lift_card(content)
    <<-HTML
<div class="efx-lift-card">#{content}</div>
<style>
.efx-lift-card {
  background: #23242b;
  border-radius: 16px;
  box-shadow: 0 2px 8px #0006, 0 8px 40px #0ff1;
  transition: transform 0.22s cubic-bezier(.7,.7,.2,1.4), box-shadow 0.38s;
  padding: 28px 32px;
  color: #fff;
  font-weight: 700;
  font-size: 1.1em;
  margin: 24px auto;
}
.efx-lift-card:hover {
  transform: translateY(-12px) scale(1.035) rotateX(6deg);
  box-shadow: 0 10px 40px #0ff8, 0 2px 16px #fff2;
}
</style>
    HTML
  end

  # Efecto de texto con sombra animada de colores
  def self.colored_shadow_text(text)
    <<-HTML
<span class="efx-color-shadow">#{text}</span>
<style>
.efx-color-shadow {
  color:#fff; font-size:1.2em; font-weight:900; letter-spacing:2px;
  text-shadow: 0 0 12px #0ff, 0 0 24px #f0f, 0 6px 18px #004a, 0 -5px 7px #ff0a;
  animation: efx-color-shadow 2.3s infinite alternate;
}
@keyframes efx-color-shadow {
  0% { text-shadow: 0 0 12px #0ff, 0 0 16px #f0f, 0 3px 10px #0f0a;}
  40% { text-shadow: 0 0 22px #ff0, 0 0 16px #fa0, 0 6px 20px #004a;}
  60% { text-shadow: 0 0 32px #0ff5, 0 0 24px #f0f5, 0 -5px 17px #ff0c;}
  100% { text-shadow: 0 0 12px #0ff, 0 0 24px #f0f, 0 6px 18px #004a;}
}
</style>
    HTML
  end

  # Efecto de distorsión de fondo (ripple)
  def self.ripple_bg_div(content)
    <<-HTML
<div class="efx-ripple-bg">#{content}</div>
<style>
.efx-ripple-bg {
  background: radial-gradient(circle at 50% 50%, #0ff3 0%, #0ff0 60%, #000 100%);
  position:relative; overflow:hidden; padding:24px 0;
}
.efx-ripple-bg:after {
  content:"";
  position:absolute; left:50%; top:50%;
  width:1200px; height:1200px;
  background:radial-gradient(circle, #0ff4 0%, #0ff0 70%);
  border-radius:50%;
  transform:translate(-50%,-50%);
  animation: efx-ripple 4.7s infinite alternate;
  z-index:0; pointer-events:none;
  opacity:.7;
}
@keyframes efx-ripple {
  0% { width:1200px; height:1200px; opacity:.7;}
  100% { width:1400px; height:1400px; opacity:.15;}
}
</style>
    HTML
  end

  # Efecto de texto con líneas animadas (scanner)
  def self.scanner_text(text)
    <<-HTML
<span class="efx-scanner">#{text}</span>
<style>
.efx-scanner {
  position:relative;
  overflow:hidden;
  color:#fff;
  font-weight:800;
  padding: 8px 32px;
  border-radius:7px;
  background:#222;
}
.efx-scanner:after {
  content:"";
  position:absolute; left:0; top:0; width:100%; height:4px;
  background: linear-gradient(90deg,#0ff8 0%,#fff0 100%);
  animation: efx-scan-move 2s infinite linear;
}
@keyframes efx-scan-move {
  0% { top:0;}
  100% { top:100%;}
}
</style>
    HTML
  end

  # Efecto de texto con desenfoque animado
  def self.animated_blur_text(text)
    <<-HTML
<span class="efx-anim-blur">#{text}</span>
<style>
.efx-anim-blur {
  color: #fff;
  font-weight: bold;
  filter: blur(0px);
  animation: efx-anim-blur 2s infinite alternate;
}
@keyframes efx-anim-blur {
  0% { filter: blur(0px);}
  60% { filter: blur(2.5px);}
  100% { filter: blur(0px);}
}
</style>
    HTML
  end

  # Efecto de zoom pulsante
  def self.pulse_zoom(text)
    <<-HTML
<span class="efx-zoom">#{text}</span>
<style>
.efx-zoom {
  display:inline-block;
  transition: transform .28s;
  animation: efx-zoom-pulse 1.5s infinite alternate cubic-bezier(.6,.9,.2,1.2);
}
@keyframes efx-zoom-pulse {
  0% { transform: scale(1);}
  50% { transform: scale(1.15);}
  100% { transform: scale(1);}
}
</style>
    HTML
  end

  # Efecto arcoíris animado de fondo para texto
  def self.rainbow_bg_text(text)
    <<-HTML
<span class="efx-rainbow-bg">#{text}</span>
<style>
.efx-rainbow-bg {
  padding: 8px 22px;
  font-weight: 900;
  color: #fff;
  background: linear-gradient(90deg,#f00,#ff0,#0f0,#0ff,#00f,#f0f,#f00);
  background-size: 400% 100%;
  border-radius: 12px;
  animation: efx-rainbow-bg 2.5s infinite linear;
}
@keyframes efx-rainbow-bg {
  0% { background-position: 0% 50%;}
  100% { background-position: 100% 50%;}
}
</style>
    HTML
  end

  # Efecto de sombra paralela animada en texto
  def self.parallel_shadow_text(text)
    <<-HTML
<span class="efx-par-shadow">#{text}</span>
<style>
.efx-par-shadow {
  color: #fff;
  font-size: 1.2em;
  font-weight: 900;
  text-shadow: 3px 3px 0 #0ff7, -3px -3px 0 #f0f7;
  letter-spacing: 2px;
  animation: efx-par-shadow 2.1s infinite alternate;
}
@keyframes efx-par-shadow {
  0% { text-shadow: 3px 3px 0 #0ff, -3px -3px 0 #f0f;}
  50% { text-shadow: 6px 6px 0 #0ff7, -6px -6px 0 #f0f7;}
  100% { text-shadow: 3px 3px 0 #0ff, -3px -3px 0 #f0f;}
}
</style>
    HTML
  end

  # Efecto de texto tipo onda
  def self.wave_text(text)
    html = text.chars.each_with_index.map do |c, i|
      "<span style='display:inline-block;animation:efx-wave 1.2s #{i/18.0}s infinite cubic-bezier(.7,1.4,.6,.9);'>#{c}</span>"
    end.join
    <<-HTML
<span style="white-space:pre;">#{html}</span>
<style>
@keyframes efx-wave {
  0%   { transform: translateY(0);}
  40%  { transform: translateY(-14px);}
  100% { transform: translateY(0);}
}
</style>
    HTML
  end

  # Efecto de texto con degradado animado
  def self.animated_gradient_text(text)
    <<-HTML
<span class="efx-anim-grad">#{text}</span>
<style>
.efx-anim-grad {
  background: linear-gradient(90deg, #f0f, #0ff, #ff0, #f0f 60%);
  background-size: 400% 100%;
  color:transparent;
  -webkit-background-clip: text;
  background-clip: text;
  animation: efx-anim-grad 2.7s infinite alternate linear;
  font-weight:900;
  letter-spacing:1.2px;
  font-size:1.2em;
}
@keyframes efx-anim-grad {
  0% { background-position: 0% 50%;}
  100% { background-position: 100% 50%;}
}
</style>
    HTML
  end

  # Efecto de "corte digital" a texto (slicing)
  def self.slice_text(text)
    <<-HTML
<span class="efx-slice" data-text="#{text}">#{text}</span>
<style>
.efx-slice {
  color:#fff; font-family:inherit; font-weight:900;
  position:relative;
}
.efx-slice:before, .efx-slice:after {
  content: attr(data-text);
  position: absolute; left:0; width:100%;
  overflow: hidden;
  color: #fff;
  z-index: -1;
}
.efx-slice:before {
  top:0; height:49%;
  clip-path: polygon(0 0,100% 0,100% 90%,0 90%);
  color:#f0f;
  animation: efx-slice-top 2.2s infinite alternate;
}
.efx-slice:after {
  bottom:0; height:49%;
  clip-path: polygon(0 10%, 100% 0, 100% 100%, 0 100%);
  color:#0ff;
  animation: efx-slice-bot 2.3s infinite alternate-reverse;
}
@keyframes efx-slice-top {
  0% { transform: translateX(0);}
  100% { transform: translateX(3px);}
}
@keyframes efx-slice-bot {
  0% { transform: translateX(0);}
  100% { transform: translateX(-3px);}
}
</style>
    HTML
  end

  # Efecto glassmorphism (vidrio borroso)
  def self.glass_card(content)
    <<-HTML
<div class="efx-glass-card">#{content}</div>
<style>
.efx-glass-card {
  background: rgba(30,40,50,0.34);
  border-radius: 20px;
  box-shadow: 0 4px 24px #0ff3;
  padding: 32px 24px;
  backdrop-filter: blur(12px) brightness(1.2);
  color: #fff;
  border:1.5px solid #0ff5;
}
</style>
    HTML
  end

  # Efecto de botón neón animado
  def self.neon_button(label)
    <<-HTML
<button class="efx-neon-btn">#{label}</button>
<style>
.efx-neon-btn {
  background: #191c20;
  color:#fff;
  border:2.5px solid #0ff;
  border-radius:13px;
  padding: 13px 42px;
  font-size:1.13em;
  font-weight:700;
  cursor:pointer;
  box-shadow: 0 0 20px #0fd, 0 0 60px #0ff0;
  animation: efx-neon-btn-glow 1.5s infinite alternate;
  text-shadow: 0 0 8px #0ffb;
  transition: background .18s, color .18s;
}
.efx-neon-btn:hover {
  background: #0ff;
  color: #222;
}
@keyframes efx-neon-btn-glow {
  0% { box-shadow: 0 0 12px #0ff, 0 0 32px #0ff3;}
  100% { box-shadow: 0 0 40px #0ff, 0 0 70px #0ff8;}
}
</style>
    HTML
  end

  # Efecto de texto con sombra de arcoíris
  def self.rainbow_shadow_text(text)
    <<-HTML
<span class="efx-rainbow-shadow">#{text}</span>
<style>
.efx-rainbow-shadow {
  color: #fff;
  font-size: 1.2em;
  font-weight: bold;
  text-shadow:
    2px 2px 0 #f00,
    4px 4px 0 #ff0,
    6px 6px 0 #0f0,
    8px 8px 0 #0ff,
    10px 10px 0 #00f,
    12px 12px 0 #f0f;
  animation: efx-rainbow-shadow 2s infinite alternate;
}
@keyframes efx-rainbow-shadow {
  0% { text-shadow: 2px 2px 0 #f00, 4px 4px 0 #ff0, 6px 6px 0 #0f0, 8px 8px 0 #0ff, 10px 10px 0 #00f, 12px 12px 0 #f0f;}
  50% { text-shadow: 2px 8px 0 #f00, 4px 10px 0 #ff0, 6px 12px 0 #0f0, 8px 14px 0 #0ff, 10px 16px 0 #00f, 12px 18px 0 #f0f;}
  100% { text-shadow: 2px 2px 0 #f00, 4px 4px 0 #ff0, 6px 6px 0 #0f0, 8px 8px 0 #0ff, 10px 10px 0 #00f, 12px 12px 0 #f0f;}
}
</style>
    HTML
  end

  # Efecto de texto expandible al hover
  def self.expand_on_hover(text)
    <<-HTML
<span class="efx-expand-hv">#{text}</span>
<style>
.efx-expand-hv {
  display:inline-block; transition:transform .24s cubic-bezier(.6,1.3,.4,1.1);
}
.efx-expand-hv:hover {
  transform: scale(1.22) skewY(-5deg) rotateZ(-1deg);
  color: #0ff;
  text-shadow: 0 0 8px #0ffb;
}
</style>
    HTML
  end

  # Efecto de texto con sombra oscilante
  def self.oscillating_shadow_text(text)
    <<-HTML
<span class="efx-osc-shadow">#{text}</span>
<style>
.efx-osc-shadow {
  color: #fff;
  font-weight: bold;
  text-shadow: 0 2px 8px #0ff;
  animation: efx-osc-shadow 1.9s infinite alternate;
}
@keyframes efx-osc-shadow {
  0% { text-shadow: 0 2px 8px #0ff;}
  50% { text-shadow: 0 10px 32px #f0f;}
  100% { text-shadow: 0 2px 8px #0ff;}
}
</style>
    HTML
  end

  # Efecto de botón con onda de ripple al click (con js)
  def self.ripple_button(label)
    <<-HTML
<button class="efx-ripple-btn" onclick="efxRipple(this, event)">#{label}</button>
<style>
.efx-ripple-btn {
  position: relative;
  overflow: hidden;
  background: #1a1d23;
  color: #fff;
  border: 2px solid #0ff8;
  border-radius: 12px;
  padding: 13px 40px;
  font-size: 1.13em;
  font-weight: 700;
  cursor: pointer;
}
.efx-ripple-btn span.efx-ripple {
  position: absolute;
  border-radius: 50%;
  transform: scale(0);
  animation: efx-ripple-btn-ani 0.7s linear;
  background: #0ff7;
  pointer-events:none;
  z-index: 9;
}
@keyframes efx-ripple-btn-ani {
  to { transform: scale(3.2); opacity: 0;}
}
</style>
<script>
function efxRipple(btn, e) {
  var ripple = document.createElement("span");
  ripple.className = "efx-ripple";
  ripple.style.left = (e.clientX - btn.getBoundingClientRect().left) + "px";
  ripple.style.top = (e.clientY - btn.getBoundingClientRect().top) + "px";
  ripple.style.width = ripple.style.height = Math.max(btn.offsetWidth, btn.offsetHeight) + "px";
  btn.appendChild(ripple);
  setTimeout(() => ripple.remove(), 720);
}
</script>
    HTML
  end

  # Efecto de texto de desintegración (desaparece en partículas)
  def self.disintegrate_text(text)
    html = text.chars.map.with_index do |c,i|
      "<span class='efx-dis-c' style='animation-delay:#{i*0.05}s;'>#{c}</span>"
    end.join
    <<-HTML
<span class="efx-disintegrate">#{html}</span>
<style>
.efx-disintegrate .efx-dis-c {
  display:inline-block; opacity:1;
  animation: efx-disappear 1.6s linear infinite alternate;
}
@keyframes efx-disappear {
  0% { opacity:1; transform: translateY(0);}
  60% { opacity:1; transform: translateY(0);}
  80% { opacity:.4; transform: translateY(-2px) scale(0.9) rotate(-6deg);}
  100% { opacity:0.08; transform: translateY(-16px) scale(0.7) rotate(-16deg);}
}
</style>
    HTML
  end

  # Efecto de texto que orbita en círculo
  def self.orbit_text(text)
    html = text.chars.each_with_index.map do |c, i|
      deg = i * (360.0 / text.size)
      "<span style='position:absolute;left:50%;top:50%;transform:rotate(#{deg}deg) translate(0, -2.6em) rotate(-#{deg}deg);transform-origin:0 2.6em;'>#{c}</span>"
    end.join
    <<-HTML
<div style="position:relative;width:6em;height:6em;">
  #{html}
</div>
    HTML
  end
end
