<?php
// Conexão com o banco de dados
include "./db/conexao.php";
// Verificação no banco de dados

$msg_error = "";

if (isset($_POST["nickname"]) &&  isset($_POST["senhaUsuario"])) {
    $nickname =  mysqli_escape_string($conexao, $_POST["nickname"]);
    $senhaUsuario = $_POST["senhaUsuario"];

    $sql = "SELECT * FROM tbusuarios WHERE nickname = '{$nickname}' 
        and senhaUsuario = '{$senhaUsuario}'";
    $rs = mysqli_query($conexao, $sql);
    $dados = mysqli_fetch_assoc($rs);
    $linha = mysqli_num_rows($rs);

    if ($linha != 0) {
        session_start();
        $_SESSION["nickname"] = $nickname;
        $_SESSION["senhaUsuario"] = $senhaUsuario;


        header('Location: chat.php');
    } else {
        $msg_error = "<div class='error'>
                            <p>Usuário não encontrado ou a senha não confere.</p>
                    </div>";
    }
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
        <div class="formLogin">
            <form action="index.php" method="post">
                <label for="nickname">Nickname</label>
                <input type="text" name="nickname">
                <label for="senhaUsuario">Senha</label>
                <input type="password" name="senhaUsuario" id="senhaUsuario">
                <button type="submit">Entrar no Chat</button>
                <?php
                echo $msg_error;
                ?>
            </form>

        </div>
    </main>
</body>

</html>