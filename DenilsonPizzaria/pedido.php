<?php
// processar_pedido.php

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $dadosPedido = json_decode(file_get_contents('php://input'), true);

    // O restante do seu código PHP para processar o pedido vai aqui

    // Simule a resposta do servidor com um ID de pedido e tempo de entrega
    $pedidoID = uniqid();
    $tempoEntrega = date('H:i', strtotime('+30 minutes'));

    // Envie a resposta de volta para o cliente
    echo json_encode(['pedidoID' => $pedidoID, 'tempoEntrega' => $tempoEntrega]);
} else {
    http_response_code(405); // Método não permitido
}
?>
