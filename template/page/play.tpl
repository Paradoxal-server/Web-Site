<div class="info center-align" data-aos="fade">
    <div class="main">
        <div class="row">
            <div class="col 24 s12">
                <img class="responsive-img" src="style/img/play.png">
                <div class="card grey darken-1">
                    <div class="card-content white-text">
                        <span class="card-title">Comment rejoindre le serveur</span>
                        <p>
                            1) Crée un compte sur le site.<br>
                            2) Faire une demmande à ceux lien :
                                <a href="index.php?page=support/web_demmande.tpl" class="waves-effect waves-light btn"><i class="material-icons right">announcement</i>Faire ça demmande</a>
                            <br>
                            3) Aprés une réponse favorable. <br>
                            Le lien de téléchargement sera disponible<br>
                            {if $val.user.Permission >= 2}
                                <a id="dll" class="waves-effect waves-light btn">Téléchager le launcher</a>
                            {else}
                                <a id="dll" class="waves-effect waves-light btn disabled">Téléchager le launcher</a>
                            {/if}
                        </p>
                    </div>
                    <script>
                        $("#dll").click(function(e) {
                            e.preventDefault();
                            $.ajax({
                                type: "POST",
                                url: "dll.php",
                                data: $("#dll").val(),
                                success: function (data) {
                                    eval(data)
                                },
                            });
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>