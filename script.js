window.addEventListener('scroll', () => {
    const scrollPosition = window.scrollY;
    const textElement = document.getElementById('text');
    
    // Aplica una transformación en 3D basada en la posición del scroll
    const translateZ = scrollPosition * -0.5; // Ajusta este valor para cambiar la intensidad
    textElement.style.transform = `translate(-50%, -50%) translateZ(${translateZ}px)`;
});
