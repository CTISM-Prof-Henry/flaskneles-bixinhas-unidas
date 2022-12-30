function alerta_vermelho() {
    window.alert('Olá mundo! Eu sou uma função Javascript definida no script app/static/js/main.js');
}
// ADICIONANDO AÇÕES DO MENU DAS PAGINAS
const navSlide = () => {
    const burger = document.querySelector(".burger");
    const nav = document.querySelector(".nav-links");
    const navLinks = document.querySelectorAll(".nav-links a");
  
    burger.addEventListener("click", () => {
      nav.classList.toggle("nav-active");
  
      navLinks.forEach((link, index) => {
        if (link.style.animation) {
          link.style.animation = "";
        } else {
          link.style.animation = `navLinkFade 0.5s ease forwards ${
            index / 7 + 0.5
          }s `;
        }
      });
      burger.classList.toggle("toggle");
    });
  };
// ADICIONANDO MODAL DA PAGINA INICIAL
