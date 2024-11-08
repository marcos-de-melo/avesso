<?php
session_start();
date_default_timezone_set('America/Sao_Paulo');

include("./db/conexao.php");


if (isset($_SESSION["emailUsuario"]) and isset($_SESSION["senhaUsuario"])) {
    $emailUsuario = $_SESSION["emailUsuario"];
    $senhaUsuario = $_SESSION["senhaUsuario"];
    $_SESSION["idDestinatario"] = $_GET["idUsuarioMatch"];


    $idDestinatario = $_GET["idUsuarioMatch"];

    $sql = "SELECT * FROM tbusuarios WHERE emailUsuario = '{$emailUsuario}' 
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


$idUsuarioLogado = $dados["idUsuario"];


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
                <input type="hidden" id="idDestinatario" name="idDestinatario" value="<?= $idDestinatario ?>">
                <input type="hidden" id="idRemetente" name="idRemetente" value="<?= $idUsuarioLogado ?>">
                <input type="text" id="txtMsg" name="txtMsg"> <button id="btn-insert-msg" type="submit">Enviar</button>
            </form>

        </div>
    </footer>
    <script src="./js/jquery.js"></script>
    <script src="./js/box-mensagens.js"></script>
</body>

</html>