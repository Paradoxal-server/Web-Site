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
        <div class="row">
            <div class="col-md-6">
                <h2>Connection</h2>
                {if $val.buc.error_co eq 1 }
                    <div class="alert alert-danger" role="alert">
                        {$val.buc.msg_co}
                    </div>
                {/if}
                <form action="login.php" method="POST">
                    <div class="form-group row">
                        <label for="pseudo_connect" class="col-sm-2 col-form-label">Pseudo</label>
                        <div class="col-sm-10">
                            <input type="text" name="pseudo_connect" class="form-control" id="pseudo_connect" placeholder="Votre Pseudo">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="mdp_connect" class="col-sm-2 col-form-label">Mot de passe</label>
                        <div class="col-sm-10">
                            <input type="password" name="mdp_connect" class="form-control" id="mdp_connect" placeholder="Votre mot de passe">
                        </div>
                    </div>
                    <div class="col-auto my-auto">
                        <button type="submit" class="btn btn-primary">Se connecter</button>
                    </div>
                </form>
            </div>
            <div class="col-md-6">
                <h2>Inscription</h2>
                {if $val.bug.error_inc eq 1 }
                    <div class="alert alert-danger" role="alert">
                       {$val.bug.msg_inc}
                    </div>
                {/if}
                {if $val.bug.error_inc eq 2 }
                    <div class="alert alert-success" role="alert">
                       Votre compte à été crée, vous pouvez vous conncetez.
                    </div>
                {/if}
                <form action="insc.php" method="POST">
                    <div class="form-group row">
                        <label for="pseudo_insc" class="col-sm-2 col-form-label">Pseudo</label>
                        <div class="col-sm-10">
                            <input type="text" name="pseudo_insc" class="form-control" id="pseudo_insc" placeholder="Entrez un  Pseudo" value="{$val.bug.pseudo}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="mdp_insc" class="col-sm-2 col-form-label">Mot de passe</label>
                        <div class="col-sm-10">
                            <input type="password" name="mdp_insc" class="form-control" id="mdp_insc" placeholder="Entrez un mot de passe">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="mdp_insc_conf" class="col-sm-2 col-form-label">Confirmez votre  Mot de passe</label>
                        <div class="col-sm-10">
                            <input type="password" name="mdp_insc_conf" class="form-control" id="mdp_insc_conf" placeholder="Confirmez votre mot de passe">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email_insc" class="col-sm-2 col-form-label">Addrese email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email_insc" class="form-control" id="email_insc" placeholder="Entrez une addresse Email" value="{$val.bug.email}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email_insc_conf" class="col-sm-2 col-form-label">Confirmez votre addresse email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email_insc_conf" class="form-control" id="email_insc_conf" placeholder="Confirmez votre addresse email" value="{$val.bug.email}">
                        </div>
                    </div>
                    <div class="col-auto my-auto">
                        <button type="submit" class="btn btn-primary">Se connecter</button>
                    </div>
                </form>
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
