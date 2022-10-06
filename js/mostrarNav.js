"use strict";
document.addEventListener('DOMContentLoaded', main);

function main() {
document.querySelector("#btn-nav").addEventListener("click", mostrarNav);

function mostrarNav(e) {
    e.preventDefault();
    document.querySelector(".nav-principal").classList.toggle("mostrar-nav");
}
}