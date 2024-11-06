<?php
session_start();
if (!isset($_SESSION["idUsuarioLogado"])) {
    header('Location: index.php');
    exit();
 
}else{
    include("./db/conexao.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Avesso</title>
</head>
<body>
    <h1>Avesso</h1>
    <p>Usuario logado: <?= $_SESSION["nomeUsuarioLogado"] ?></p>
    <table border="1">
        <thead>
            <tr>
                <th>id</th>
                <th>Nome</th>
                <th>Email</th>
                <th>Chat</th>

            </tr>
        </thead>
        <tbody>
            <?php
            $sql = "select u.idUsuario, m.idUsuario, idUsuarioMatch,emailUsuario, 
(select nomeUsuario from tbusuarios where idUsuario = m.idUsuarioMatch ) as nomeUsuarioMatch
from tbusuarios as u inner join tbmatches as m on u.idUsuario = m.idUsuario where u.idUsuario =" . $_SESSION["idUsuarioLogado"];
            $rs = mysqli_query($conexao, $sql);
            while ($dados = mysqli_fetch_assoc($rs)) {
                echo "<tr>
                <td>{$dados["idUsuario"]}</td>
                <td>{$dados["nomeUsuarioMatch"]}</td>
                <td>{$dados["emailUsuario"]}</td>
                <td><a href='chat.php?idUsuario={$dados["idUsuario"]}'>Chat</a></td>
            </tr>";
            }
            ?>

        </tbody>
    </table>
</body>
</html>