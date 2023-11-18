document.addEventListener('DOMContentLoaded', function () {
    const finalizarPedidoButton = document.getElementById('finalizarPedido');

    finalizarPedidoButton.addEventListener('click', function () {
        // Obtenha os dados necessários do seu formulário aqui
        const name = "nome_cliente"; // Substitua isso pelos dados reais do seu formulário

        // Construa um objeto com os dados do pedido para enviar para o servidor
        const dadosPedido = {
            name: name,
            // Adicione aqui os dados adicionais necessários
            // ...
        };

        // Use Fetch para enviar os dados para o script PHP
        fetch('processar_pedido.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(dadosPedido),
        })
        .then(response => response.json())
        .then(data => {
            // Redirecione para a página de confirmação com os dados do pedido
            window.location.href = `pagina_confirmacao.php?pedidoID=${data.pedidoID}&tempoEntrega=${data.tempoEntrega}`;
        })
        .catch(error => {
            console.error('Erro ao enviar pedido:', error);
        });
    });
});
