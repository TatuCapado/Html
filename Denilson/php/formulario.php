<?php
// Inclua o arquivo de configuração do banco de dados
include_once 'caminho/para/Database.php';

// Verifique se os dados do formulário foram enviados
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Recupere os dados do formulário
    $nome = $_POST["nome"];
    $email = $_POST["email"];
    $telefone = $_POST["telefone"];
    $assunto = $_POST["assunto"];
    $mensagem = $_POST["mensagem"];

    // Conecte-se ao banco de dados usando a classe Database
    $db = new Database();
    $conn = $db->getConexao();

    // Verifique a conexão com o banco de dados
    if ($conn) {
        // Insira os dados no banco de dados
        $query = "INSERT INTO sua_tabela (nome, email, telefone, assunto, mensagem) VALUES (?, ?, ?, ?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("sssss", $nome, $email, $telefone, $assunto, $mensagem);

        if ($stmt->execute()) {
            // Redirecione para a página "contato.html"
            header("Location: ../contato.html");
            exit(); // Certifique-se de sair para evitar execução adicional do script
        } else {
            echo "Erro ao salvar dados: " . $stmt->error;
        }

        // Feche a conexão
        $stmt->close();
        $conn->close();
    } else {
        echo "Erro de conexão com o banco de dados.";
    }
}
?>
