<?php

    include("./db/conexao.php");
    $txtMsg = $_POST["txtMsg"];
    $idRemetente = $_POST["idRemetente"];
    $idDestinatario = $_POST["idDestinatario"];
    $dataHora = date("Y-m-d H:i:s");
    $sql = "INSERT INTO tbmensagens (idRemetente, idDestinatario, conteudoMsg, dataMsg) 
    VALUES ('$idRemetente','$idDestinatario','$txtMsg','$dataHora')";
    mysqli_query($conexao, $sql) or die(mysqli_error($conexao));