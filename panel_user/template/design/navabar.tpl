<!-- MENU SIDEBAR-->
<aside class="menu-sidebar2">
    <div class="logo">
        <a href="index.php">
            <img src="template/design/images/icon/logo-white.png" alt="Cool Admin"/>
        </a>
    </div>
    <div class="menu-sidebar2__content js-scrollbar1">
        <div class="account2">
            <div class="image img-cir img-120">
                <img src="https://crafatar.com/avatars/{$val.user.uuid}?size=125" class="rounded-circle">
            </div>
            <h4 class="name">{$val.user.pseudo}</h4>
            <button id="logout" type="button" class="btn btn-primary">Se déconnecter</button>
        </div>
        <nav class="navbar-sidebar2">
            <ul class="list-unstyled navbar__list">
                <li class="active has-sub">
                    <a href="index.php">
                        <i class="fas fa-tachometer-alt"></i>Dashboard
                    </a>
                </li>
                <li class="active has-sub">
                    <a href="index.php?page=profils">
                        <i class="fas fa-user-circle"></i>Profils
                    </a>
                </li>
                <li class="active has-sub">
                    <a href="index.php?page=world">
                        <i class="fas fa-book"></i>Mondes
                    </a>
                </li>
                <li class="active has-sub">
                    <a href="index.php?page=support">
                        <i class="fas fa-anchor"></i>Support
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <script>
        $( "#logout" ).click(function( event ) {
            event.preventDefault();
            $.ajax({
                type: "POST",
                url: "../logout.php",
                data: $("#logout").serialize(),
                success: function (data) {
                    eval(data);
                },
            });
        });
    </script>
</aside>
<!-- END MENU SIDEBAR-->