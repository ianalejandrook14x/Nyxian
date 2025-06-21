# ./ruby/effect_shake.rb
# Pack de efectos Ruby para "shake" (temblor) en letras y backgrounds.
# Cada método devuelve HTML + CSS para tu página Ruby/HTML.
# Incluye shake para letras individuales, palabras, cards y fondos completos.

module EffectShake

  # Shake en cada letra (letra por letra)
  def self.letter_shake(text)
    html = text.chars.each_with_index.map do |c, i|
      "<span class='eshake-letter' style='animation-delay:#{i*0.07}s;'>#{c}</span>"
    end.join
    <<-HTML
<span class="eshake-word">#{html}</span>
<style>
.eshake-word .eshake-letter {
  display:inline-block;
  animation: eshake-letter-ani 0.6s cubic-bezier(.36,.07,.19,.97) both infinite;
}
@keyframes eshake-letter-ani {
  10%, 90% { transform: translateX(-1px);}
  20%, 80% { transform: translateX(2px);}
  30%, 50%, 70% { transform: translateX(-4px);}
  40%, 60% { transform: translateX(4px);}
}
</style>
    HTML
  end

  # Shake de toda una palabra o frase (más fuerte)
  def self.word_shake(text)
    <<-HTML
<span class="eshake-phrase">#{text}</span>
<style>
.eshake-phrase {
  display:inline-block;
  animation: eshake-phrase-ani 0.9s cubic-bezier(.36,.07,.19,.97) both infinite;
}
@keyframes eshake-phrase-ani {
  10%, 90% { transform: translateX(-2px);}
  20%, 80% { transform: translateX(3px);}
  30%, 50%, 70% { transform: translateX(-7px);}
  40%, 60% { transform: translateX(7px);}
}
</style>
    HTML
  end

  # Shake vertical (temblor arriba-abajo) en texto
  def self.vertical_shake(text)
    <<-HTML
<span class="eshake-vertical">#{text}</span>
<style>
.eshake-vertical {
  display:inline-block;
  animation: eshake-vertical-ani 0.7s cubic-bezier(.36,.07,.19,.97) infinite both;
}
@keyframes eshake-vertical-ani {
  10%, 90% { transform: translateY(-2px);}
  20%, 80% { transform: translateY(3px);}
  30%, 50%, 70% { transform: translateY(-5px);}
  40%, 60% { transform: translateY(5px);}
}
</style>
    HTML
  end

  # Shake tipo "jelly" (gelatina) en letras
  def self.jelly_shake(text)
    html = text.chars.each_with_index.map do |c, i|
      "<span class='eshake-jelly' style='animation-delay:#{i*0.09}s;'>#{c}</span>"
    end.join
    <<-HTML
<span class="eshake-jelly-word">#{html}</span>
<style>
.eshake-jelly-word .eshake-jelly {
  display:inline-block;
  animation: eshake-jelly-ani 0.7s cubic-bezier(.36,.07,.19,.97) infinite both;
}
@keyframes eshake-jelly-ani {
  0% { transform: scale(1);}
  30% { transform: scale(1.18,0.85);}
  40% { transform: scale(0.85,1.12);}
  55% { transform: scale(1.10,0.9);}
  65% { transform: scale(0.95,1.13);}
  100% { transform: scale(1);}
}
</style>
    HTML
  end

  # Shake en card o div (hover para activar)
  def self.card_shake(content)
    <<-HTML
<div class="eshake-card" tabindex="0">#{content}</div>
<style>
.eshake-card {
  display:inline-block;
  background: #23242b;
  color: #fff;
  border-radius: 16px;
  box-shadow: 0 2px 8px #0006, 0 8px 40px #0cf1;
  padding: 28px 32px;
  margin: 24px auto;
  font-weight: 700;
  font-size: 1.07em;
  transition: box-shadow 0.3s;
  cursor:pointer;
}
.eshake-card:hover, .eshake-card:focus {
  animation: eshake-card-ani 0.7s cubic-bezier(.36,.07,.19,.97) 1;
  box-shadow: 0 10px 40px #f70, 0 2px 16px #fff2;
}
@keyframes eshake-card-ani {
  10%, 90% { transform: translateX(-2px);}
  20%, 80% { transform: translateX(3px);}
  30%, 50%, 70% { transform: translateX(-8px);}
  40%, 60% { transform: translateX(8px);}
}
</style>
    HTML
  end

  # Shake de fondo completo en una sección (hover para activar)
  def self.bg_shake_section(content)
    <<-HTML
<div class="eshake-bg-section" tabindex="0">#{content}</div>
<style>
.eshake-bg-section {
  background: linear-gradient(120deg,#ffecd2 0%,#fcb69f 100%);
  border-radius: 18px;
  padding: 50px 0;
  margin: 32px 0;
  box-shadow: 0 6px 30px #fcb69f44;
  transition: box-shadow 0.33s;
  will-change: transform;
  outline: none;
}
.eshake-bg-section:hover, .eshake-bg-section:focus {
  animation: eshake-bg-ani 1.1s cubic-bezier(.36,.07,.19,.97) 1;
  box-shadow: 0 16px 50px #fcb69faa, 0 2px 18px #fff1;
}
@keyframes eshake-bg-ani {
  10%, 90% { transform: translateX(-3px);}
  20%, 80% { transform: translateX(8px);}
  30%, 50%, 70% { transform: translateX(-18px);}
  40%, 60% { transform: translateX(18px);}
}
</style>
    HTML
  end

  # Shake vertical en background section (hover)
  def self.bg_vertical_shake(content)
    <<-HTML
<div class="eshake-bg-vert" tabindex="0">#{content}</div>
<style>
.eshake-bg-vert {
  background: linear-gradient(120deg,#ffecd2 0%,#fcb69f 100%);
  border-radius: 18px;
  padding: 50px 0;
  margin: 32px 0;
  box-shadow: 0 6px 30px #fcb69f44;
  transition: box-shadow 0.33s;
  will-change: transform;
  outline: none;
}
.eshake-bg-vert:hover, .eshake-bg-vert:focus {
  animation: eshake-bg-vert-ani 1.1s cubic-bezier(.36,.07,.19,.97) 1;
  box-shadow: 0 16px 50px #fcb69faa, 0 2px 18px #fff1;
}
@keyframes eshake-bg-vert-ani {
  10%, 90% { transform: translateY(-3px);}
  20%, 80% { transform: translateY(8px);}
  30%, 50%, 70% { transform: translateY(-18px);}
  40%, 60% { transform: translateY(18px);}
}
</style>
    HTML
  end
end
