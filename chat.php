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
$usuarioLogado = $dados["idUsuario"];
if (isset($_POST["txtMsg"])) {
    $txtMsg = $_POST["txtMsg"];
    $dataHora = date("Y-m-d H:i:s");
    $sql = "INSERT INTO tbmensagens (idUsuario, mensagem, dataHora) 
    VALUES ('$usuarioLogado','$txtMsg','$dataHora')";
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
            <div class="box-lista-msg content">
                <?php
                $sql = "SELECT 
                u.idUsuario,
                imgAvatarUsuario,
                nickname,
                mensagem,
                date_format(dataHora,'%d/%m/%Y  %H:%i:%s') as dataHora 
                FROM tbmensagens as m inner join tbusuarios as u on m.idUsuario = u.idUsuario";
                $rs = mysqli_query($conexao, $sql);
                while ($dados = mysqli_fetch_assoc($rs)) {
                    $idUsuario = $dados["idUsuario"];
                    $imgAvatarUsuario = $dados["imgAvatarUsuario"];
                    $nickname = $dados["nickname"];
                    $msg = $dados["mensagem"];
                    $dataHora = $dados["dataHora"];
                    $classBoxMsg = ($usuarioLogado == $idUsuario) ? "msg-you" : "msg-others";
                ?>
                    <article class="msg-box <?= $classBoxMsg ?>">
                        <img class="logo-avatar" width="50" 
                        src="<?= $imgAvatarUsuario ?>" 
                        alt="Avatar">
                        <div>
                            <h2><?= $nickname ?></h2>
                            <p><?= $msg ?></p>
                            <p class="msg-time"><?= $dataHora ?></p>
                        </div>
                    </article>
                <?php
                }
                ?>
                <p id="fim"></p>
            </div>
        </section>
    </main>
    <footer class="rodape container">
        <div class="content">
            <form action="" method="post">
                <input type="text" name="txtMsg"> <button type="submit">Enviar</button>
            </form>
            <a href="?atualiza=1">Atualizar</a>
        </div>
    </footer>
</body>

</html>