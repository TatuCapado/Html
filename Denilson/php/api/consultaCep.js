function consultaCep() {
    const cep = document.getElementById('cep').value;

    fetch(`https://viacep.com.br/ws/${cep}/json`)
        .then((response) => response.json())
        .then((data) => showData(data));

}

const showData = (result) => {
    for (const campo in result) {
        if (document.getElementById(campo)) {
            document.getElementById(campo).value = result[campo];
        }
    }
}

const button = document.querySelector('#myBtn');

button.addEventListener('click', function () {
    const pagesContainer = document.querySelector('.mypanel');

    pagesContainer.style.display = 'block';
});