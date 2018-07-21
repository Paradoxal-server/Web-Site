{include file="design/header.tpl"}
{include file="design/navabar.tpl"}
<!-- PAGE CONTAINER-->
<div class="page-container2">
    <!-- HEADER DESKTOP-->
    <header class="header-desktop2">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="header-wrap2">
                    <div class="logo d-block d-lg-none">
                        <a href="#">
                            <img src="images/icon/logo-white.png" alt="CoolAdmin"/>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- END HEADER DESKTOP-->

    <!-- BREADCRUMB-->
    <section class="au-breadcrumb m-t-75">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="au-breadcrumb-content">
                            <div class="au-breadcrumb-left">
                                <span class="au-breadcrumb-span">Vous etez:</span>
                                <ul class="list-unstyled list-inline au-breadcrumb__list">
                                    <li class="list-inline-item active">
                                        <a href="#!">Panel Utilisateur</a>
                                    </li>
                                    <li class="list-inline-item seprate">
                                        <span>/</span>
                                    </li>
                                    <li class="list-inline-item">Dashboard</li>
                                    <li class="list-inline-item seprate">
                                        <span>/</span>
                                    </li>
                                    <li class="list-inline-item">Visualisation - Modification de sont profils</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END BREADCRUMB-->

    <!-- STATISTIC-->
    <section class="statistic">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 col-lg-3">
                        <div class="card">
                            <div class="card-header user-header alt bg-dark">
                                <h2 class="text-light display-6">Profils</h2>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    Pseudo : {$val.infoPseudo.Pseudo}
                                </li>
                                <li class="list-group-item">
                                    Email : {$val.infoPseudo.Email}
                                </li>
                                <li class="list-group-item">
                                    Data inscription : {$val.infoPseudo.Date_Inscription}
                                </li>
                                <li class="list-group-item">
                                    Dernier Connextion : {$val.infoPseudo.Date_Connection}
                                </li>
                                <li class="list-group-item">
                                    UUID Minecraft : {$val.user.uuid}
                                </li>
                                <li class="list-group-item">
                                    Rang : {$val.user.NameRang}
                                </li>
                            </ul>
                        </div>
                        <div class="card">
                            <div class="card-header user-header alt bg-dark">
                                <h2 class="text-light display-6">Skin</h2>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">
                                    <img src="https://crafatar.com/renders/head/{$val.user.uuid}">
                                </li>
                                <li class="list-group-item">
                                    <img src="https://crafatar.com/renders/body/{$val.user.uuid}">
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="card">
                            <div class="card-header user-header alt bg-dark">
                                <h2 class="text-light display-6">Modification du profils</h2>
                            </div>
                            <div class="card-body card-block">
                                <form action="" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="text-input" class=" form-control-label">Pseudo</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="pseudo" name="pseudo" placeholder="Entrez votre pseudo" class="form-control" value="{$val.infoPseudo.Pseudo}">
                                            <small class="form-text text-muted">Ce champs de vous indentifier sur le site (Cela doit être votre pseudo Minecraft)</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="text-input" class=" form-control-label">Addresse Email</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="email" id="email" name="email" placeholder="Entrez addresse Email" class="form-control" value="{$val.infoPseudo.Email}">
                                            <small class="form-text text-muted">l'addresse permet de vous réenvoyer le lien en cas de perte de votre mot de passe</small>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="text-input" class=" form-control-label">Mot de passe</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="password" id="password" name="password" placeholder="Entrez un nouveaux mot de passe" class="form-control">
                                            <small class="form-text text-muted">Le mot permet de vous connctez aux site</small>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Modifier
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-sm">
                                            <i class="fa fa-ban"></i> Reset
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-header user-header alt bg-dark">
                                <h2 class="text-light display-6">Supression de votre compte</h2>
                            </div>
                            <div class="card-body card-block">
                                <form action="" method="post" class="form-horizontal">
                                    <div class="row form-group">
                                        <div class="col col-md-3">
                                            <label for="text-input" class=" form-control-label">Pseudo</label>
                                        </div>
                                        <div class="col-12 col-md-9">
                                            <input type="text" id="pseudoConf" name="pseudoConf" placeholder="Confirmez votre pseudo" class="form-control" >
                                            <small class="form-text text-muted">Attention cela suprimera votre compte</small>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-danger btn-sm">
                                            <i class="fa fa-dot-circle-o"></i> Surpprimer
                                        </button>
                                        <button type="reset" class="btn btn-danger btn-sm">
                                            <i class="fa fa-ban"></i> Reset
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END STATISTIC-->
{include file="design/footer.tpl"}