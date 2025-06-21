# ./ruby/effect_aesthetic.rb
# Pack de efectos Ruby para movimientos fluidos y backgrounds estéticos (aesthetic).
# Cada método devuelve HTML + CSS listo para insertar en tu página Ruby/HTML.
# Incluye efectos de movimiento suave y backgrounds visualmente atractivos.

module EffectAesthetic

  # Fondo con gradiente animado (aesthetic)
  def self.animated_gradient_bg(content = "")
    <<-HTML
<div class="aesthetic-bg">
  #{content}
</div>
<style>
.aesthetic-bg {
  background: linear-gradient(120deg, #a18cd1 0%, #fbc2eb 100%);
  background-size: 200% 200%;
  animation: abg-move 7s ease-in-out infinite;
  padding: 40px 0;
  border-radius: 24px;
  box-shadow: 0 2px 28px #a18cd144, 0 1px 8px #fff1;
}
@keyframes abg-move {
  0% { background-position: 0% 50%;}
  50% { background-position: 100% 50%;}
  100% { background-position: 0% 50%;}
}
</style>
    HTML
  end

  # Efecto de card flotante con movimiento suave
  def self.floating_card(content)
    <<-HTML
<div class="aesthetic-float-card">#{content}</div>
<style>
.aesthetic-float-card {
  background: rgba(255,255,255,0.15);
  box-shadow: 0 8px 32px 0 #a18cd155;
  backdrop-filter: blur(8px);
  border-radius: 18px;
  padding: 32px 28px;
  margin: 20px auto;
  color: #232;
  font-size:1.11em;
  font-weight: 700;
  transition: transform 0.6s cubic-bezier(.34,1.56,.64,1), box-shadow 0.5s;
  will-change: transform;
  position:relative;
  overflow:hidden;
  animation: afc-float 4s ease-in-out infinite alternate;
}
@keyframes afc-float {
  0% { transform: translateY(0px);}
  100% { transform: translateY(-18px);}
}
.aesthetic-float-card:hover {
  transform: scale(1.04) translateY(-10px) rotateZ(-1deg);
  box-shadow: 0 14px 32px 0 #a18cd1aa, 0 1px 8px #fff1;
}
</style>
    HTML
  end

  # Fondo con burbujas animadas (bubbles)
  def self.bubbles_bg(content = "")
    <<-HTML
<div class="aesthetic-bubbles-bg">
  #{content}
  <div class="bubbles">
    #{Array.new(12) { "<span></span>" }.join}
  </div>
</div>
<style>
.aesthetic-bubbles-bg {
  position: relative;
  overflow: hidden;
  background: linear-gradient(120deg, #fbc2eb 0%, #a6c1ee 100%);
  border-radius: 18px;
  padding: 55px 0 40px 0;
}
.bubbles {
  position: absolute; left: 0; top: 0; width: 100%; height: 100%; z-index: 1;
}
.bubbles span {
  position: absolute;
  bottom: -60px;
  width: 30px; height: 30px;
  background: rgba(255,255,255,0.25);
  border-radius: 50%;
  animation: abubble-move 12s linear infinite;
  left: calc(100% * var(--i, 0) / 12);
  animation-delay: calc(var(--i, 0) * -1.1s);
}
#{(0..11).map{|i| ".bubbles span:nth-child(#{i+1}){ --i:#{i};}"}.join}
@keyframes abubble-move {
  0% { transform: translateY(0) scale(0.9);}
  70% { opacity: 1;}
  100% { transform: translateY(-420px) scale(1.25); opacity: 0;}
}
</style>
    HTML
  end

  # Efecto de texto "Smooth Slide In"
  def self.smooth_slide_in(text)
    <<-HTML
<span class="aesthetic-slide-in">#{text}</span>
<style>
.aesthetic-slide-in {
  display: inline-block;
  opacity: 0;
  transform: translateX(-60px);
  animation: asi-slide-in 1.1s cubic-bezier(.3,1.6,.6,1.2) forwards;
}
@keyframes asi-slide-in {
  0% { opacity: 0; transform: translateX(-60px);}
  70% { opacity: 1; transform: translateX(12px);}
  100% { opacity: 1; transform: translateX(0);}
}
</style>
    HTML
  end

  # Fondo con ondas animadas (waves, SVG)
  def self.waves_bg(content = "")
    <<-HTML
<div class="aesthetic-waves-bg">
  #{content}
  <svg class="waves" viewBox="0 0 1440 120" style="position:absolute;bottom:0;left:0;width:100%;z-index:2">
    <path fill="#a18cd1" fill-opacity="0.47" d="M0,80 C360,160 1080,0 1440,80 L1440,120 L0,120 Z"></path>
    <path fill="#fbc2eb" fill-opacity="0.37" d="M0,100 C400,80 1100,160 1440,100 L1440,120 L0,120 Z"></path>
  </svg>
</div>
<style>
.aesthetic-waves-bg {
  position: relative;
  background: linear-gradient(120deg, #fbc2eb 0%, #a6c1ee 100%);
  border-radius: 24px 24px 0 0;
  overflow: hidden;
  min-height: 120px;
  box-shadow: 0 2px 28px #a18cd133;
  padding-bottom: 30px;
  z-index: 1;
}
.aesthetic-waves-bg .waves {
  pointer-events: none;
  animation: awaves-move 8s linear infinite alternate;
}
@keyframes awaves-move {
  0% { transform: translateY(0);}
  100% { transform: translateY(20px);}
}
</style>
    HTML
  end

  # Efecto tarjeta glassmorphism con movimiento sutil
  def self.glassmorph_card(content)
    <<-HTML
<div class="aesthetic-glass-card">#{content}</div>
<style>
.aesthetic-glass-card {
  background: rgba(255,255,255, 0.14);
  border-radius: 18px;
  box-shadow: 0 4px 24px #fbc2eb55;
  backdrop-filter: blur(18px) brightness(1.2);
  padding: 38px 28px;
  color: #232;
  border:1.5px solid #a18cd180;
  margin: 22px 0;
  animation: aglass-float 4s ease-in-out infinite alternate;
}
@keyframes aglass-float {
  0% { transform: translateY(0px);}
  100% { transform: translateY(-10px);}
}
</style>
    HTML
  end

  # Efecto de texto parpadeo suave aesthetic
  def self.soft_blink(text)
    <<-HTML
<span class="aesthetic-soft-blink">#{text}</span>
<style>
.aesthetic-soft-blink {
  animation: asb-blink 1.6s infinite alternate;
  color: #a18cd1;
  font-weight: bold;
  letter-spacing:1.3px;
}
@keyframes asb-blink {
  0% { opacity: 1;}
  100% { opacity: 0.48;}
}
</style>
    HTML
  end

  # Fondo con líneas diagonales animadas
  def self.diagonal_lines_bg(content = "")
    <<-HTML
<div class="aesthetic-diag-bg">#{content}</div>
<style>
.aesthetic-diag-bg {
  background: repeating-linear-gradient(
    135deg,
    #fbc2eb 0px,
    #fbc2eb 3px,
    #a6c1ee 6px,
    #a6c1ee 26px
  );
  background-size: 80px 80px;
  animation: adiag-move 6s linear infinite;
  padding: 38px 0;
  border-radius: 18px;
  box-shadow: 0 2px 28px #a18cd144;
}
@keyframes adiag-move {
  0% { background-position: 0 0;}
  100% { background-position: 80px 80px;}
}
</style>
    HTML
  end

  # Efecto de texto con movimiento ondulatorio aesthetic
  def self.wave_text(text)
    html = text.chars.each_with_index.map do |c, i|
      "<span style='display:inline-block;animation:awave-move 1.8s #{i/22.0}s infinite cubic-bezier(.7,1.4,.6,.9);'>#{c}</span>"
    end.join
    <<-HTML
<span style="white-space:pre;">#{html}</span>
<style>
@keyframes awave-move {
  0%   { transform: translateY(0);}
  40%  { transform: translateY(-14px);}
  100% { transform: translateY(0);}
}
</style>
    HTML
  end

end
