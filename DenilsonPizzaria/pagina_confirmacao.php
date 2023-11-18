<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmação de Pedido</title>
</head>
<body>
    <h1>Confirmação de Pedido</h1>
    <?php
    $pedidoID = $_GET['pedidoID'];
    $tempoEntrega = $_GET['tempoEntrega'];

    echo "<p>ID do Pedido: $pedidoID</p>";
    echo "<p>Tempo de Entrega: $tempoEntrega</p>";
    ?>
</body>
</html>
