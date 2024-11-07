
                <?php
                session_start();
                $idDestinatario = $_SESSION["idDestinatario"];
                $idUsuarioLogado = $_SESSION["idUsuarioLogado"];
                include("./db/conexao.php");
                $sql = "update tbmensagens set msgVisualizada = 1 where idRemetente = {$idDestinatario} and idDestinatario = {$idUsuarioLogado} and msgVisualizada = 0";
                
                mysqli_query($conexao, $sql);



                $sql = "select *,date_format(dataMsg,'%d/%m/%Y  %H:%i:%s') as dataMsg 
from tbmensagens as m inner join tbusuarios as u on m.idRemetente=u.idUsuario 
where  (idRemetente = {$idUsuarioLogado} and idDestinatario={$idDestinatario}) or (idRemetente  = {$idDestinatario} and idDestinatario={$idUsuarioLogado})
order by dataMsg asc";
                $rs = mysqli_query($conexao, $sql);
                while ($dados = mysqli_fetch_assoc($rs)) {
                    $idUsuario = $dados["idUsuario"];
                    $fotoPerfilUsuario = $dados["fotoPerfilUsuario"];
                    $nomeUsuario = $dados["nomeUsuario"];
                    $msg = $dados["conteudoMsg"];
                    $dataMsg = $dados["dataMsg"];
                    $classBoxMsg = ($idUsuarioLogado == $idUsuario) ? "msg-you" : "msg-others";
                ?>
                    <article class="msg-box <?= $classBoxMsg ?>">
                        <img class="logo-avatar" width="50" 
                        src="<?= $fotoPerfilUsuario ?>" 
                        alt="Avatar">
                        <div>
                            <h2><?= $nomeUsuario ?></h2>
                            <p><?= $msg ?></p>
                            <p class="msg-time"><?= $dataMsg ?></p>
                        </div>
                        <div class="msg-view">
                            <?php
                            if ($dados["msgVisualizada"] == 0) {
                                ?>
                                <p class='msg-viewed'>
                                Nao visualizada
                            </p>
                                <?php
                                
                            }else{
                                
                                ?>
                                <p class='msg-viewed'>
                                Visualizado
                            </p>
                                <?php
                            }
                            ?>
                        </div>
                    </article>
                <?php
                }
                ?>
       
            