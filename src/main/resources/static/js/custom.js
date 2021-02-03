const showMenu = document.getElementById('showMenu');
const closeMenu = document.getElementById('closeMenu');
const menu = document.querySelector("#menu");
const body = document.querySelector('body');
const overlay = document.querySelector('.overlay');

showMenu.addEventListener('click',()=>{
    menu.classList.add("open");
    // body.classList.add("overflow");
    overlay.classList.add("block");
})
closeMenu.addEventListener('click',()=>{
    menu.classList.remove("open");
    // body.classList.remove("overflow");
    overlay.classList.remove("block");
})
overlay.addEventListener('click',()=>{
    menu.classList.remove("open");
    // body.classList.remove("overflow");
    overlay.classList.remove("block");
})