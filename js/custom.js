
/***** BACK TO TOP *****/

const btt = document.getElementById('back-to-top');

btt.addEventListener("click", scrollToTop);

function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: "smooth"
    });
}

/***** MENU *****/

const mico = document.getElementById('menu-ico');
const mbg = document.getElementById('menu-bg');

mico.addEventListener("click", menuResponsive);
mbg.addEventListener("click", menuResponsive);

function menuResponsive() {
    document.body.classList.toggle("menu-is-active");
}