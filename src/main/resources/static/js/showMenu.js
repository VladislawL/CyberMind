const showMenu = document.getElementById('showMenu');
const closeMenu = document.getElementById('closeMenu');
const menu = document.querySelector("#menu");
const overlay = document.getElementById('overlayMenu');

function openMenu(){
    menu.classList.add("openMenu");
    overlay.classList.add("block");
}
function hideMenu(){
    menu.classList.remove("openMenu");
    overlay.classList.remove("block");
}

showMenu.addEventListener('click',openMenu);
closeMenu.addEventListener('click',hideMenu);
overlay.addEventListener('click',hideMenu);