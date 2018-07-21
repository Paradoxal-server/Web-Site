<body>
<!-- Nav -->
<div class="header" style="background: url('style/img/cityscape.jpg'); background-position: 50% 10%; background-attachment: fixed;">
    <div class="navbar-fixed">

        <nav class="z-depth-0">
            <div class="nav-wrapper">
                <a href="index.php" class="brand-logo">{$val.title}</a>
                <ul class="right hide-on-med-and-down">
                    <li class="active"><a href="index.php"><i class="fas fa-home"></i> Accueil</a></li>
                    <li><a href="index.php?page=web_play.tpl"><i class="fas fa-info-circle"></i> Rejoindre le serveur</a></li>
                    <li><a href="index.php?page=web_menbre.tpl"><i class="fas fa-user"></i> Menbre du serveur</a></li>
                    <li><a href="index.php?page=web_staff.tpl"><i class="fas fa-star"></i> Staff</a></li>
                    <li><a href="index.php?page=web_rules.tpl"><i class="fas fa-book"></i> Régles</a></li>
                    {if $val.user.Permission >= 8}
                        <li><a href="#!"><i class="fas fa-unlock-alt"></i> Panneaux d'administration</a></li>
                    {/if}
                    {if $val.user.connect eq 1}
                    <li>
                        <!-- Dropdown Trigger -->
                        <a href='index.php?page=panel.php'>
                            <img src="https://crafatar.com/avatars/{$val.user.uuid}?size=35" class="rounded-circle"> {$val.user.pseudo}
                        </a>
                    </li>
                    <li>
                        <a href="logout.php"><i class="fas fa-power-off"></i></a>
                    </li>
                    {else}
                        <li><a href="index.php?page=web_espace.tpl"><i class="fas fa-power-off"></i></a></li>
                    {/if}
                </ul>
            </div>
        </nav>

        <!-- / Nav -->


