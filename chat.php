<?php
date_default_timezone_set('America/Sao_Paulo');

include("./db/conexao.php");

session_start();

if (isset($_SESSION["nickname"]) and isset($_SESSION["senhaUsuario"])) {
    $nickname = $_SESSION["nickname"];
    $senhaUsuario = $_SESSION["senhaUsuario"];

    $sql = "SELECT * FROM tbusuarios WHERE nickname = '{$nickname}' 
    and senhaUsuario = '{$senhaUsuario}'";
    $rs = mysqli_query($conexao, $sql);
    $dados = mysqli_fetch_assoc($rs);

    $linha = mysqli_num_rows($rs);

    if ($linha == 0) {
        session_unset();
        session_destroy();
        header('Location: index.php');
        exit();
    }
} else {
    header('Location: index.php');
    exit();
}

if (isset($_GET["atualiza"])) {
    header('Location:chat.php#fim');
}
$idUsuarioLogado = $dados["idUsuario"];

if (isset($_POST["txtMsg"])) {
    $txtMsg = $_POST["txtMsg"];
    $dataHora = date("Y-m-d H:i:s");
    $sql = "INSERT INTO tbmensagens (idUsuario, mensagem, dataHora) 
    VALUES ('$idUsuarioLogado','$txtMsg','$dataHora')";
    mysqli_query($conexao, $sql) or die(mysqli_error($conexao));
    header('Location:chat.php#fim');
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduFofoca Chat</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <header class="main-header container">
        <div class="content">
            <img width="40" src="./img/logo.png" alt="">
        </div>
    </header>
    <main>
        <section class="container">
            <div id="box-msg" class="box-lista-msg content">

            </div>
        </section>
    </main>
    <footer class="rodape container">
        <div class="content">
            <form action="" method="post">
                <input type="text" name="txtMsg"> <button type="submit">Enviar</button>
            </form>
     
        </div>
    </footer>
    <script src="./js/jquery.js"></script>
    <script src="./js/box-mensagens.js"></script>
</body>

</html>