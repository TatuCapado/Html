document.addEventListener('DOMContentLoaded', function () {
    const cartItemsList = document.getElementById('cart-items');
    const cartTotal = document.getElementById('cart-total');
    const addToCartButtons = document.querySelectorAll('.add-to-cart');
    const checkoutButton = document.getElementById('checkout-button');
    const paymentOption = document.getElementById('select_payment');
    const deliveryOption = document.getElementById('select_delivery');
    const customerAddress = document.getElementById('input_address');
    const customerTroco = document.getElementById('input_troco')
    const Address = document.getElementById('address');
    const Troco = document.getElementById('troco')
    const clientNameInput = document.getElementById('client_name');
    const semTroco = document.getElementById('input_radio_troco')

    let cart = [];

    // Função para atualizar o carrinho
    function updateCart() {
        cartItemsList.innerHTML = '';
        let total = 0;
        const itemDetails = [];

        cart.forEach((item, index) => {
            const li = document.createElement('li');
            li.innerHTML = `${item.name} - R$ ${item.price.toFixed(2)}`;

            // Adiciona um botão para excluir o item
            const deleteButton = document.createElement('button');
            deleteButton.textContent = 'Excluir';
            deleteButton.classList.add('cart-button', 'delete');
            deleteButton.addEventListener('click', () => removeFromCart(index));

            li.appendChild(deleteButton);

            cartItemsList.appendChild(li);
            total += item.price;
            itemDetails.push(`*${item.name}: R$${item.price.toFixed(2)}*`);
        });

        cartTotal.textContent = `R$ ${total.toFixed(2)}`;
        return itemDetails;
    }

    // Adicionar item ao carrinho
    addToCartButtons.forEach(button => {
        button.addEventListener('click', function () {
            const name = this.getAttribute('data-name');
            const price = parseFloat(this.getAttribute('data-price'));
            cart.push({ name, price });

            updateCart();

            // Crie a notificação
            const notification = document.createElement('div');
            notification.textContent = `Item "${name}" adicionado ao carrinho com sucesso!`;
            notification.style.position = 'fixed';
            notification.style.top = '100px';
            notification.style.right = '0px';
            notification.style.backgroundColor = '#ffff00';
            notification.style.color = '#000';
            notification.style.fontWeight = 'bold';
            notification.style.fontSize = '18px';
            // Exiba a notificação
            document.body.appendChild(notification);

            // Remova a notificação após 1 segundo
            setTimeout(() => {
                notification.remove();
            }, 1000);

        });
        // Exibir uma mensagem de confirmação

    });

    // Remover item do carrinho
    // Remover item do carrinho
    function removeFromCart(index) {
        // Verifique se o index é válido
        if (index < 0 || index >= cart.length) {
            // O index não é válido
            return;
        }

        // Verifique se o cart não está vazio
        if (cart.length === 0) {
            // O cart está vazio

            // Exibir uma mensagem de erro
            const notification = document.createElement('div');
            notification.textContent = 'Carrinho esvaziado!';
            notification.style.position = 'fixed';
            notification.style.top = '100px';
            notification.style.right = '0px';
            notification.style.backgroundColor = '#ffff00';
            notification.style.color = '#000';
            notification.style.fontWeight = 'bold';
            notification.style.fontSize = '18px';

            // Exiba a notificação
            document.body.appendChild(notification);

            // Remova a notificação após 1 segundo
            setTimeout(() => {
                notification.remove();
            }, 1000);

            return;
        }

        // Remove o item do carrinho
        cart.splice(index, 1);

        // Atualiza a lista de itens do carrinho
        updateCart();

        // Exibir uma mensagem de confirmação
        const notification = document.createElement('div');
        notification.textContent = `Item "${cart[index].name}" removido do carrinho com sucesso!`;
        notification.style.position = 'fixed';
        notification.style.top = '100px';
        notification.style.right = '0px';
        notification.style.backgroundColor = '#ffff00';
        notification.style.color = '#000';
        notification.style.fontWeight = 'bold';
        notification.style.fontSize = '18px';

        // Exiba a notificação
        document.body.appendChild(notification);

        // Remova a notificação após 1 segundo
        setTimeout(() => {
            notification.remove();
        }, 1000);
    }

    // Evento ouvinte para o select do Tipo de entrega
    deliveryOption.addEventListener("change", function () {
        if (deliveryOption.value === "Entregar no Endereço") {
            // Mostra o input de texto do endereço de entrega
            Address.style.display = "block";
        } else {
            // Esconde o input de texto do endereço de entrega
            Address.style.display = "none";
        }
    });

    // Evento ouvinte para o select do tipo de pagamento
    paymentOption.addEventListener("change", function () {
        if (paymentOption.value === "Dinheiro") {
            Troco.style.display = "block";
        } else {
            Troco.style.display = "none";
        }
    });

    // Evento ouvinte para a checkbox do troco
    semTroco.addEventListener('change', function () {
        if (semTroco.checked && customerTroco.value.trim() != '') {
            alert('Você marcou "Sem troco" e inseriu um valor de troco. Por favor, remova o valor de troco.');
            customerTroco.value = ''; // Limpa o valor do campo de troco
            semTroco.checked = false;
        } else if (semTroco.checked) {
            customerTroco.disabled = true;
        } else {
            customerTroco.disabled = false;
        }
    });

    // ... (seu código JavaScript existente)

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
    
    // Finalizar compra
    checkoutButton.addEventListener('click', function () {
        if (cart.length > 0) {
            // Restante do código ...

            // Construa um objeto com os dados do carrinho para enviar para o servidor
            const dadosCarrinho = {
                clientName: clientName,
                total: total.toFixed(2),
                cart: cart
            };

            // Use AJAX para enviar os dados para o script PHP
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'pedido.php', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Analise a resposta do servidor
                    const resposta = JSON.parse(xhr.responseText);

                    // Redirecione para a página de confirmação com o ID do pedido e o tempo de entrega
                    const urlConfirmacao = `pagina_confirmacao.php?pedidoID=${resposta.pedidoID}&tempoEntrega=${resposta.tempoEntrega}`;
                    window.location.href = urlConfirmacao;
                }
            };

            // Envie os dados do carrinho para o servidor
            xhr.send('cart=' + JSON.stringify(dadosCarrinho));
        } else {
            alert('Carrinho vazio. Adicione itens antes de finalizar o pedido.');
        }
    });


});