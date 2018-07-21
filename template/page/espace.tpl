<div class="info center-align" data-aos="fade">
    <div class="main">
        <div class="row">
            <div class="col 24 s6">
                <img class="responsive-img" src="style/img/logging.png">
                <h4>Connection</h4>
                <form class="col s12" id="formConnect" method="POST">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="pseudo_connect" name="pseudo_connect" type="text" class="validate">
                            <label for="pseudo_connect" class="active">Pseudo</label>

                        </div>
                        <div class="input-field col s12">
                            <input name="mdp_connect" id="mdp_connect" type="password" class="validate">
                            <label for="password">Mot de passe</label>
                        </div>
                        <button class="btn waves-effect waves-light" type="submit">Se connecter</button>
                    </div>
                </form>
                <script>
                    $( "#formConnect" ).submit(function( event ) {
                        event.preventDefault();
                        $.ajax({
                            type: "POST",
                            url: "login.php",
                            data: $("#formConnect").serialize(),
                            success: function (data) {
                                eval(data);
                            },
                        });
                    });
                </script>
            </div>
            <div class="col 24 s6">
                <img class="responsive-img" src="style/img/register.png">
                <h4>Inscription</h4>
                <form class="col s12" id="formInscription" method="POST">
                    <div class="row">
                        <div class="input-field col s12">
                            <input id="pseudo_insc" name="pseudo_insc" type="text" class="validate">
                            <label for="pseudo_insc" class="active">Pseudo</label>
                            <span class="helper-text" data-error="wrong" data-success="right">Le pseudo permet de vous indentifier sur le site (/!\ Utiliser votre pseudo Minecraft)</span>
                        </div>
                        <div class="input-field col s12">
                            <input id="mdp_insc" name="mdp_insc" type="password" class="validate">
                            <label for="mdp_insc" class="active">Mot de passe</label>
                            <span class="helper-text" data-error="wrong" data-success="right">Ce mot de passe permet de vous connectez à votre session </span>
                        </div>
                        <div class="input-field col s12">
                            <input id="mdp_insc_conf" name="mdp_insc_conf" type="password" class="validate">
                            <label for="mdp_insc_conf" class="active">Confirmez votre mot de passe</label>
                            <span class="helper-text" data-error="wrong" data-success="right">Ce mot de passe permet de vous connectez à votre session </span>
                        </div>
                        <div class="input-field col s12">
                            <input id="email_insc" name="email_insc" type="email" class="validate">
                            <label for="email_insc" class="active">Addresse Email</label>
                            <span class="helper-text" data-error="wrong" data-success="right">Cette Addresse permetra de récuperer votre mot de passe en cas de perte ou selon votre choix de recevoir les new du serveur.</span>
                        </div>
                        <div class="input-field col s12">
                            <input id="email_insc_conf" name="email_insc_conf" type="email" class="validate">
                            <label for="email_insc_conf" class="active">Confirmez votre addresse Email</label>
                            <span class="helper-text" data-error="wrong" data-success="right">Cette Addresse permetra de récuperer votre mot de passe en cas de perte ou selon votre choix de recevoir les new du serveur.</span>
                        </div>
                        <button class="btn waves-effect waves-light" type="submit">Se connecter</button>
                    </div>
                </form>
                <script>
                    $( "#formInscription" ).submit(function( event ) {
                        event.preventDefault();
                        $.ajax({
                            type: "POST",
                            url: "insc.php",
                            data: $("#formInscription").serialize(),
                            success: function (data) {
                                eval(data);
                            },
                        });
                    });
                </script>
                <div class="col s12 m12">
                    <div class="card grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">Information</span>
                            <p>
                                Dans le cadre la réglementation du CNIL.<br>
                                Vous disposez de vos droit concernent vos information stocker sur le site.<br>
                                A tout môment vous pouvez demmandez la liste des information que nous stockons sur vous.<br>
                                Pour cela:<br>
                                    --> Connectez vous.<br>
                                    --> Dans Support : -> Droit<br>
                                    --> Fiche Information<br>
                                Ou sur discord
                            </p>
                        </div>
                        <div class="card-action">
                            <a href="#">This is a link</a>
                            <a href="#">This is a link</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>