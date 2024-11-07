$(document).ready(function() {
    // Função para carregar o conteúdo e rolar para o final
    function loadMessages() {
      $("#box-msg").load("box-mensagens.php", function() {
        // Define a rolagem para o final da div após o carregamento do conteúdo
        $("html, body").animate({ scrollTop: $(document).height() }, "fast");
      });
    }
  

  
    // Atualiza o conteúdo e rola para o final a cada 2 segundos

  });