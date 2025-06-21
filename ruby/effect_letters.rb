# ./ruby/effect_letters.rb
# Pack de efectos Ruby para letras y textos llamativos (solo efectos sobre letras/texto)
# Cada método devuelve HTML + CSS para insertar en tu página Ruby/HTML.
# Especial para títulos, frases o palabras importantes.

module EffectLetters

  # Efecto gradiente animado sobre texto
  def self.animated_gradient(text)
    <<-HTML
<span class="el-anim-gradient">#{text}</span>
<style>
.el-anim-gradient {
  background: linear-gradient(90deg, #ff7eb3 10%, #65e2e8 40%, #ffef78 70%, #ff7eb3 100%);
  background-size: 300% 100%;
  color: transparent;
  -webkit-background-clip: text;
  background-clip: text;
  font-weight: bold;
  animation: el-anim-gradient-move 2.7s infinite linear;
}
@keyframes el-anim-gradient-move {
  0% { background-position: 0% 50%;}
  100% { background-position: 100% 50%;}
}
</style>
    HTML
  end

  # Efecto neón para letras
  def self.neon(text)
    <<-HTML
<span class="el-neon">#{text}</span>
<style>
.el-neon {
  color: #fff;
  text-shadow: 0 0 8px #0ff, 0 0 18px #0ff, 0 0 35px #0ff8;
  font-family: 'Archivo Black', Arial, sans-serif;
  font-weight: 900;
  letter-spacing: 1.5px;
  animation: el-neon-glow 1.9s infinite alternate;
}
@keyframes el-neon-glow {
  0% { text-shadow: 0 0 8px #0ff;}
  100% { text-shadow: 0 0 30px #0ff, 0 0 60px #0ff9;}
}
</style>
    HTML
  end

  # Efecto "typing" máquina de escribir
  def self.typing(text)
    chars = text.chars.map {|c| c == " " ? "&nbsp;" : c}.join
    <<-HTML
<span class="el-typing" data-text="#{chars}"></span>
<style>
.el-typing {
  border-right: 2px solid #fff;
  font-family: 'Fira Mono', monospace, monospace;
  font-size: 1.12em;
  font-weight: 700;
  color: #0ff;
  background: #181c20;
  padding: 3px 10px;
  border-radius: 5px;
  min-width: 3ch;
  display: inline-block;
  letter-spacing: .8px;
}
</style>
<script>
(function(){
  var el = document.querySelector('.el-typing');
  if(!el) return;
  var text = el.getAttribute('data-text');
  let i=0;
  function type() {
    if(i <= text.length) {
      el.innerHTML = text.slice(0,i) + '<span style="color:#fff;">|</span>';
      i++; setTimeout(type, 55 + Math.random()*35);
    } else {
      el.innerHTML = text;
    }
  }
  type();
})();
</script>
    HTML
  end

  # Efecto de sombra colorida animada
  def self.colored_shadow(text)
    <<-HTML
<span class="el-color-shadow">#{text}</span>
<style>
.el-color-shadow {
  color: #fff;
  font-size: 1.08em;
  font-weight: 900;
  letter-spacing: 1.1px;
  text-shadow: 0 0 10px #ff7eb3, 0 0 18px #65e2e8, 0 4px 12px #ffef78;
  animation: el-color-shadow-ani 2.5s infinite alternate;
}
@keyframes el-color-shadow-ani {
  0% { text-shadow: 0 0 10px #ff7eb3, 0 0 18px #65e2e8, 0 4px 12px #ffef78;}
  50% { text-shadow: 0 0 18px #65e2e8, 0 0 26px #ff7eb3, 0 6px 18px #ffef78;}
  100% { text-shadow: 0 0 10px #ff7eb3, 0 0 18px #65e2e8, 0 4px 12px #ffef78;}
}
</style>
    HTML
  end

  # Efecto wave: letras con movimiento de onda
  def self.wave(text)
    html = text.chars.each_with_index.map do |c, i|
      "<span style='display:inline-block;animation:elwave 1.3s #{i/14.0}s infinite cubic-bezier(.7,1.4,.6,.9);'>#{c}</span>"
    end.join
    <<-HTML
<span style="white-space:pre;">#{html}</span>
<style>
@keyframes elwave {
  0%   { transform: translateY(0);}
  40%  { transform: translateY(-10px);}
  100% { transform: translateY(0);}
}
</style>
    HTML
  end

  # Efecto glitch animado solo en letras
  def self.glitch(text)
    <<-HTML
<span class="el-glitch" data-text="#{text}">#{text}</span>
<style>
.el-glitch {
  position: relative;
  color: #fff;
  font-family: 'Archivo Black', Arial, sans-serif;
  font-weight: bold;
  letter-spacing: 1.2px;
}
.el-glitch:before, .el-glitch:after {
  content: attr(data-text);
  position: absolute; left:0; top:0; width: 100%; overflow: hidden;
  color: #0ff;
  z-index: -1;
  clip-path: polygon(0 0,100% 0,100% 40%,0 40%);
  animation: el-glitch-top 2s infinite linear alternate;
}
.el-glitch:after {
  color: #ff7eb3;
  clip-path: polygon(0 60%,100% 60%,100% 100%,0 100%);
  animation: el-glitch-bottom 1.7s infinite alternate-reverse;
}
@keyframes el-glitch-top {
  0% { transform: translateY(0px) translateX(0);}
  12% { transform: translateY(-1px) translateX(-2px);}
  25% { transform: translateY(1px) translateX(2px);}
  55% { transform: translateY(-1px) translateX(-1px);}
  100% { transform: translateY(0) translateX(0);}
}
@keyframes el-glitch-bottom {
  0% { transform: translateY(0px) translateX(0);}
  13% { transform: translateY(1px) translateX(1px);}
  40% { transform: translateY(-1px) translateX(-2px);}
  65% { transform: translateY(1px) translateX(1px);}
  100% { transform: translateY(0) translateX(0);}
}
</style>
    HTML
  end

  # Efecto blink parpadeo suave
  def self.blink(text)
    <<-HTML
<span class="el-blink">#{text}</span>
<style>
.el-blink {
  animation: el-blink 1.1s infinite steps(2, jump-none);
}
@keyframes el-blink {
  0%, 49% { opacity: 1; }
  50%, 100% { opacity: 0.22; }
}
</style>
    HTML
  end

  # Efecto de letras "expandibles" al hover
  def self.expand_hover(text)
    <<-HTML
<span class="el-expand-hv">#{text}</span>
<style>
.el-expand-hv {
  display:inline-block; 
  transition:transform .19s cubic-bezier(.6,1.3,.4,1.1);
}
.el-expand-hv:hover {
  transform: scale(1.14) skewY(-3deg) rotateZ(-1deg);
  color: #65e2e8;
  text-shadow: 0 0 6px #65e2e8c8;
}
</style>
    HTML
  end

  # Efecto de letras 3D
  def self.text3d(text)
    <<-HTML
<span class="el-3d">#{text}</span>
<style>
.el-3d {
  font-weight:900;
  font-size:1.22em;
  color:#fff;
  text-shadow:
    1px 1px 0 #65e2e8, 2px 2px 0 #ff7eb3, 4px 4px 6px #0008;
  letter-spacing:1.1px;
  position:relative;
  animation: el-3d-move 2.1s infinite alternate cubic-bezier(.8,1.6,.5,1);
}
@keyframes el-3d-move {
  0% { transform: skewY(0deg) rotateX(0) scale(1);}
  60% { transform: skewY(-6deg) rotateX(2deg) scale(1.06);}
  100% { transform: skewY(0deg) rotateX(0) scale(1);}
}
</style>
    HTML
  end

  # Efecto de letras con sombra arcoíris
  def self.rainbow_shadow(text)
    <<-HTML
<span class="el-rainbow-shadow">#{text}</span>
<style>
.el-rainbow-shadow {
  color: #fff;
  font-weight: bold;
  text-shadow:
    2px 2px 0 #ff7eb3,
    4px 4px 0 #65e2e8,
    6px 6px 0 #ffef78;
  animation: el-rainbow-shadow 2s infinite alternate;
}
@keyframes el-rainbow-shadow {
  0% { text-shadow: 2px 2px 0 #ff7eb3, 4px 4px 0 #65e2e8, 6px 6px 0 #ffef78;}
  50% { text-shadow: 2px 8px 0 #ff7eb3, 4px 10px 0 #65e2e8, 6px 12px 0 #ffef78;}
  100% { text-shadow: 2px 2px 0 #ff7eb3, 4px 4px 0 #65e2e8, 6px 6px 0 #ffef78;}
}
</style>
    HTML
  end

  # Efecto de "aparecer letra por letra" (fade in)
  def self.letter_fadein(text)
    html = text.chars.each_with_index.map do |c, i|
      "<span style='opacity:0;animation:elfadein .8s #{i*0.05}s forwards;'>#{c}</span>"
    end.join
    <<-HTML
<span style="white-space:pre;">#{html}</span>
<style>
@keyframes elfadein {
  to { opacity: 1;}
}
</style>
    HTML
  end
end
