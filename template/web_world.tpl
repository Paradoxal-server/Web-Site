<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="style/img/Logo.png">

        <title>{$val.title_page}</title>

        <!-- Bootstrap core CSS -->
        <link href="style/css/bootstrap.min.css" rel="stylesheet">
        <link href="style/bootstrap.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="style/jumbotron.css" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
              integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
            <div class="navbar-header">
                <a class="navbar-brand" href="index.php">{$val.title}</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                        aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="index.php"><i class="fas fa-home"></i> Accueil</a></li>
                    <li><a href="index.php?page=web_play.tpl"><i class="fas fa-info-circle"></i> Rejoindre le serveur</a></li>
                    <li><a href="index.php?page=web_menbre.tpl"><i class="fas fa-user"></i> Menbre du serveur</a></li>
                    <li><a href="index.php?page=web_rules.tpl"><i class="fas fa-book"></i> Régles</a></li>
                    <li><a href="index.php?page=web_staff.tpl"><i class="fas fa-star"></i> Staff</a></li>
                    <li><a href="index.php?page=web_world.tpl"><i class="fas fa-star"></i> Les mondes</a></li>
                    {if $val.user.Permission >= 8}
                        <li><a href="index.php?page=admin/admin_index.tpl"><i class="fas fa-unlock-alt"></i> Panneaux d'administration</a></li>
                    {/if}
                    {if $val.user.connect eq 1}
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <font color="black"><img src="https://crafatar.com/avatars/{$val.user.uuid}?size=35" class="rounded-circle"> {$val.user.pseudo}</font>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="index.php?page=web_profils.tpl&user={$val.user.pseudo}"><i class="fas fa-user"></i> Profils</a>
                                <a class="dropdown-item" href="index.php?page=web_compte.tpl"><i class="fas fa-shopping-cart"></i> Compte</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href=""><i class="fas fa-sign-out-alt"></i> Deconnection</a>
                            </div>
                        </li>
                    {else}
                        <li><a href="index.php?page=web_espace.tpl"><i class="fas fa-user"></i> Espace Menbre</a></li>
                    {/if}
                </ul>
            </div>
        </nav>

        <main role="main">

            <!-- Main jumbotron for a primary marketing message or call to action -->
            <div class="jumbotron homepage-opening">
                <div class="container ">

                    <br/>
                    <br/>
                    <br/>
                    <h1 class="head">{$val.title}</h1>
                    <br/>
                    <center><a class="btn btn-huge btn-info btn-glow" href="index.php?page=web_play.tpl">Rejoindre le
                            serveur</a></center>
                    <br/>
                    <br/>
                    <br/>
                </div>
            </div>

            <div class="container">
                <!-- Example row of columns -->
                    <div class="col-md-12">
                        <h2>Liste des mondes</h2>
                        <table class="table table-dark">
                            <thead>
                            <tr>
                                <th scope="col">Non du monde</th>
                                <th scope="col">Joueur</th>
                                <th scope="col">Voir le mondes</th>
                            </tr>
                            </thead>
                            <tbody>
                                {section name=world start=1 loop=$val.world.count+1 step=1}
                                    {assign var="name" value="Name-"|cat:$smarty.section.world.index}
                                    {assign var="joueur" value="Joueur-"|cat:$smarty.section.world.index}
                                    <tr>
                                        <td>{$val.world[$name]}</td>
                                        <td>{$val.world[$joueur]}</td>
                                        <td><a href="index.php?page=web_world_this.tpl&name={$val.world[$name]}" class="btn btn-light" role="button">Voir le mondes</a></td>
                                    </tr>
                                {/section}
                            </tbody>
                        </table>
                    </div>
                </div>

                <hr>

            </div> <!-- /container -->

        </main>

        <footer class="container">
            <p>&copy; Company 2017-2018</p>
        </footer>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="style/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="style/js/vendor/popper.min.js"></script>
        <script src="style/js/bootstrap.min.js"></script>
    </body>
</html>
