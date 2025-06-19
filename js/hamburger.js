// Menú hamburguesa personalizado
const hamburger = document.getElementById('customHamburger');
const dropdown = document.getElementById('customDropdownMenu');

hamburger.addEventListener('click', function(e) {
  e.stopPropagation();
  dropdown.style.display = dropdown.style.display === 'flex' ? 'none' : 'flex';
  dropdown.style.flexDirection = 'column';
});

// Cierra el menú si haces click fuera
window.addEventListener('click', function(e) {
  if (!dropdown.contains(e.target) && !hamburger.contains(e.target)) {
    dropdown.style.display = 'none';
  }
});
