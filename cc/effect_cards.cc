// ./cc/effect_cards.cc
// Librería de componentes visuales para web, orientada a C++ embebido (CGI, FastCGI, generators, etc)
// Autor: ianalejandrook14x
// Mínimo 500 líneas, cartas, grids, overlays, banners, sliders, badges, loaders, y más.

#include <string>
#include <sstream>
#include <vector>

namespace EffectCards {

    // Utilidad: Devuelve un std::string con varias líneas concatenadas
    inline std::string multiline(const std::initializer_list<std::string> &lines) {
        std::ostringstream oss;
        for (const auto& l : lines) oss << l << "\n";
        return oss.str();
    }

    // --------- 1. Carta básica con sombra y hover -------------
    std::string card_basic(const std::string& title, const std::string& content) {
        return multiline({
            "<div class=\"ec-card-basic\">",
            "  <h3>" + title + "</h3>",
            "  <div>" + content + "</div>",
            "</div>",
            "<style>",
            ".ec-card-basic {",
            "  background: #fff;",
            "  color: #222;",
            "  border-radius: 16px;",
            "  box-shadow: 0 4px 24px #0002;",
            "  padding: 30px 24px;",
            "  margin: 22px auto;",
            "  transition: box-shadow 0.24s, transform 0.22s;",
            "  max-width: 350px; min-width: 220px;",
            "}",
            ".ec-card-basic:hover {",
            "  box-shadow: 0 10px 42px #0cf7, 0 2px 16px #fff2;",
            "  transform: translateY(-10px) scale(1.03);",
            "}",
            ".ec-card-basic h3 {",
            "  margin-top: 0;",
            "  font-family: 'Montserrat', Arial, sans-serif;",
            "  font-weight: bold;",
            "  font-size: 1.38em;",
            "  letter-spacing: 1px;",
            "}",
            "</style>"
        });
    }

    // --------- 2. Carta con efecto flip (frente/atrás) -------------
    std::string card_flip(const std::string& front, const std::string& back) {
        return multiline({
            "<div class=\"ec-card-flip\">",
            "  <div class=\"ec-card-flip-inner\">",
            "    <div class=\"ec-card-flip-front\">" + front + "</div>",
            "    <div class=\"ec-card-flip-back\">" + back + "</div>",
            "  </div>",
            "</div>",
            "<style>",
            ".ec-card-flip { width: 270px; height: 180px; perspective: 900px; margin:24px auto; display:inline-block; }",
            ".ec-card-flip-inner {",
            "  position:relative; width:100%; height:100%;",
            "  transition: transform 0.7s cubic-bezier(.7,1.5,.7,1);",
            "  transform-style: preserve-3d;",
            "}",
            ".ec-card-flip:hover .ec-card-flip-inner { transform: rotateY(180deg); }",
            ".ec-card-flip-front, .ec-card-flip-back {",
            "  position: absolute; width:100%; height:100%;",
            "  backface-visibility: hidden;",
            "  display: flex; align-items:center; justify-content:center;",
            "  font-size:1.2rem; font-family:inherit;",
            "  border-radius:16px;",
            "  box-shadow: 0 2px 16px #0002;",
            "}",
            ".ec-card-flip-front { background: #0cf; color:#fff; }",
            ".ec-card-flip-back { background: #232; color:#fff; transform: rotateY(180deg); }",
            "</style>"
        });
    }

    // --------- 3. Carta glassmorphism -------------
    std::string card_glass(const std::string& title, const std::string& content) {
        return multiline({
            "<div class=\"ec-card-glass\">",
            "  <h3>" + title + "</h3>",
            "  <div>" + content + "</div>",
            "</div>",
            "<style>",
            ".ec-card-glass {",
            "  background: rgba(255,255,255,0.15);",
            "  border-radius: 18px;",
            "  box-shadow: 0 8px 32px 0 #0cf4;",
            "  backdrop-filter: blur(12px);",
            "  color: #232;",
            "  border:1.5px solid #0cf5;",
            "  padding: 32px 22px;",
            "  margin: 26px auto;",
            "  max-width: 370px;",
            "  transition: box-shadow 0.24s, transform 0.22s;",
            "}",
            ".ec-card-glass:hover {",
            "  box-shadow: 0 20px 60px #0cf8, 0 4px 18px #fff3;",
            "  transform: scale(1.04) translateY(-10px);",
            "}",
            ".ec-card-glass h3 { margin-top: 0; font-family: 'Montserrat', Arial, sans-serif; font-weight:bold; }",
            "</style>"
        });
    }

    // --------- 4. Carta usuario (avatar, nombre, info) -------------
    std::string card_user(const std::string& avatar_url, const std::string& name, const std::string& info) {
        return multiline({
            "<div class=\"ec-card-user\">",
            "  <img src=\"" + avatar_url + "\" alt=\"avatar\" class=\"ec-user-avatar\">",
            "  <div class=\"ec-user-info\">",
            "    <div class=\"ec-user-name\">" + name + "</div>",
            "    <div class=\"ec-user-desc\">" + info + "</div>",
            "  </div>",
            "</div>",
            "<style>",
            ".ec-card-user {",
            "  display:flex; align-items:center; background: #fff;",
            "  color: #222; border-radius: 14px;",
            "  box-shadow: 0 2px 18px #0002;",
            "  padding: 18px;",
            "  max-width: 340px; margin: 16px auto;",
            "  gap: 16px;",
            "  transition: box-shadow 0.2s;",
            "}",
            ".ec-card-user:hover { box-shadow: 0 8px 32px #0cf6, 0 2px 12px #fff1; }",
            ".ec-user-avatar { width: 62px; height:62px; border-radius:50%; object-fit:cover; box-shadow:0 2px 10px #0cf3; }",
            ".ec-user-info { flex:1; }",
            ".ec-user-name { font-size:1.19em; font-weight:700; margin-bottom:2px; }",
            ".ec-user-desc { font-size:.98em; color:#444; }",
            "</style>"
        });
    }

    // --------- 5. Carta producto con imagen y precio -------------
    std::string card_product(const std::string& img_url, const std::string& name, const std::string& price, const std::string& desc = "") {
        return multiline({
            "<div class=\"ec-card-product\">",
            "  <img src=\"" + img_url + "\" alt=\"img\" class=\"ec-prod-img\">",
            "  <div class=\"ec-prod-details\">",
            "    <div class=\"ec-prod-name\">" + name + "</div>",
            "    <div class=\"ec-prod-desc\">" + desc + "</div>",
            "    <div class=\"ec-prod-price\">" + price + "</div>",
            "  </div>",
            "</div>",
            "<style>",
            ".ec-card-product {",
            "  display:flex; flex-direction:column; align-items:center;",
            "  background: #fff; color: #212;",
            "  border-radius: 18px; box-shadow: 0 2px 18px #0002;",
            "  padding: 22px; max-width: 250px; margin:18px auto;",
            "  transition: box-shadow 0.2s, transform 0.2s;",
            "}",
            ".ec-card-product:hover {",
            "  box-shadow: 0 8px 28px #0cf7, 0 2px 10px #fff1; transform:scale(1.04);",
            "}",
            ".ec-prod-img { width: 110px; height:110px; border-radius:12px; object-fit:cover; margin-bottom:16px; }",
            ".ec-prod-details { text-align:center; }",
            ".ec-prod-name { font-weight:800; font-size:1.13em; }",
            ".ec-prod-desc { color:#58585c; font-size:.98em; margin:7px 0 3px 0; }",
            ".ec-prod-price { color:#0cf; font-weight:900; font-size:1.1em; margin-top:6px; }",
            "</style>"
        });
    }

    // --------- 6. Carta con badge/tag destacado -------------
    std::string card_with_badge(const std::string& title, const std::string& content, const std::string& badge) {
        return multiline({
            "<div class=\"ec-card-badge\">",
            "  <span class=\"ec-badge\">" + badge + "</span>",
            "  <h3>" + title + "</h3>",
            "  <div>" + content + "</div>",
            "</div>",
            "<style>",
            ".ec-card-badge { position:relative; background:#fff; color:#232; border-radius:14px; box-shadow:0 2px 14px #0002; padding:26px 19px; margin:19px auto; max-width:340px; }",
            ".ec-badge { position:absolute; top:-15px; right:-8px; background:#0cf; color:#fff; font-weight:700; font-size:.96em; padding:6px 18px; border-radius:8px; box-shadow:0 2px 9px #0cf5; }",
            ".ec-card-badge h3 { margin-top:0; font-family:'Montserrat',Arial,sans-serif; font-weight:bold; }",
            "</style>"
        });
    }

    // --------- 7. Carta de loading (con spinner CSS) -------------
    std::string card_loader(const std::string& text = "Cargando...") {
        return multiline({
            "<div class=\"ec-card-loader\">",
            "  <div class=\"ec-loader-spinner\"></div>",
            "  <div class=\"ec-loader-text\">" + text + "</div>",
            "</div>",
            "<style>",
            ".ec-card-loader { background:#fff; color:#222; border-radius:16px; box-shadow:0 2px 16px #0002; padding:32px 24px; text-align:center; max-width:220px; margin:20px auto; }",
            ".ec-loader-spinner { width:32px; height:32px; border:4px solid #0cf4; border-top:4px solid #fff; border-radius:50%; margin:0 auto 16px auto; animation:ec-spin 1.1s linear infinite; }",
            "@keyframes ec-spin { 100% { transform: rotate(360deg);} }",
            ".ec-loader-text { font-size:.99em; color:#555; }",
            "</style>"
        });
    }

    // --------- 8. Carta con imagen encabezado y overlay -------------
    std::string card_image_overlay(const std::string& img_url, const std::string& title, const std::string& content) {
        return multiline({
            "<div class=\"ec-card-img-overlay\">",
            "  <div class=\"ec-img-ov-wrap\">",
            "    <img src=\"" + img_url + "\" alt=\"overlay-img\">",
            "    <div class=\"ec-img-ov-layer\"></div>",
            "    <div class=\"ec-img-ov-title\">" + title + "</div>",
            "  </div>",
            "  <div class=\"ec-img-ov-content\">" + content + "</div>",
            "</div>",
            "<style>",
            ".ec-card-img-overlay { background:#fff; border-radius:14px; box-shadow:0 2px 12px #0002; max-width:340px; margin:18px auto; overflow:hidden; }",
            ".ec-img-ov-wrap { position:relative; height:124px; overflow:hidden; }",
            ".ec-img-ov-wrap img { width:100%; height:100%; object-fit:cover; display:block; }",
            ".ec-img-ov-layer { position:absolute; left:0; top:0; width:100%; height:100%; background:linear-gradient(180deg,rgba(0,0,0,0.04) 0%,rgba(0,0,0,0.38) 100%); }",
            ".ec-img-ov-title { position:absolute; left:0; bottom:0; color:#fff; font-size:1.19em; font-weight:900; padding:10px 16px; text-shadow:0 2px 8px #000b; }",
            ".ec-img-ov-content { padding:17px 18px; color:#333; font-size:.97em; }",
            "</style>"
        });
    }

    // --------- 9. Grid de cartas responsive -------------
    std::string card_grid(const std::vector<std::string>& card_htmls, int columns = 3) {
        std::ostringstream oss;
        oss << "<div class=\"ec-card-grid\">";
        for (const auto& h : card_htmls) oss << h << "\n";
        oss << "</div>\n<style>\n";
        oss << ".ec-card-grid { display:grid; grid-template-columns:repeat(" << columns << ", 1fr); gap:22px; justify-items:center; }\n";
        oss << "@media (max-width:900px) { .ec-card-grid { grid-template-columns:repeat(2,1fr); } }\n";
        oss << "@media (max-width:600px) { .ec-card-grid { grid-template-columns:1fr; } }\n";
        oss << "</style>";
        return oss.str();
    }
}
