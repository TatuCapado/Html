// Aqui fica o script para o botão funcionar em telas menores

  const navbarNavButton = document.querySelector('.navbar__nav-button');
  const navbarNavList = document.querySelector('.navbar__nav-list');

    navbarNavButton.addEventListener('click', () => {
    navbarNavList.style.display = navbarNavList.style.display === 'none' ? 'block' : 'none';
    });
