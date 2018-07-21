<script src="template/design/js/world.js"></script>
<link href="template/design/css/world.css" rel="stylesheet">
<div class="info center-align" data-aos="fade">
    <div class="main">
        <div class="row">
            <h4>{$val.word.Name}</h4>
            <h5>{$val.word.Description}</h5>
            <div class="col 12 s3">
                <!--<img class="responsive-img" src="style/img/play.png">-->
                <div class="card white darken-1">
                    <div class="card-content dark-text">
                        <span class="card-title">Information du Monde</span>
                        {if $val.worldinfo.count eq 1 }
                            <h6>Maitre du monde</h6>

                        {else}
                            <h6>Les Maitres du monde</h6>
                        {/if}
                        {section name=ownmer_world start=1 loop=$val.worldinfo.count+1 step=1}
                            {assign var="pseudo" value="pseudo-"|cat:$smarty.section.ownmer_world.index}
                            {$val.worldinfo[$pseudo]}<br>
                        {/section}
                        <hr>
                        <span class="card-title">Théme</span>
                        <h6>{$val.word.Theme}</h6>
                        <hr>
                        {if $val.word.idguest eq $val.word.id }
                            <a class="waves-effect waves-light btn " href="index.php?page=web_param_world&id={$val.word.id}">Modifier le mondes
                                <i class="material-icons left">settings</i>
                            </a>
                        {else}
                            <a class="waves-effect waves-light btn disabled">Modifier le mondes
                                <i class="material-icons left">settings</i>
                            </a>
                        {/if}
                    </div>
                </div>
            </div>
            <div class="col 24 s9">
                <!--<img class="responsive-img" src="style/img/play.png">-->
                <div class="card white darken-1">
                    <div class="card-content dark-text">
                        <span class="card-title">Image du monde</span>
                        <br>
                        <br>
                        <div class="carousel carousel-slider">
                            <a class="carousel-item"><img class="responsive-img" src="world/Imortias/back1.jpg"></a>
                            <a class="carousel-item"><img class="responsive-img" src="https://www.parisgamesweek.com/media/upload/article/content/88ba62d075dc-Ban_MINECRAFT_1920x1280.jpg"></a>
                            <a class="carousel-item"><img class="responsive-img" src="https://www.parisgamesweek.com/media/upload/article/content/88ba62d075dc-Ban_MINECRAFT_1920x1280.jpg"></a>
                        </div>
                        <br>
                        <br>
                        <button class="btn waves-effect waves-light" onclick="LastSlide()">Gauche
                            <i class="material-icons right">arrow_back</i>
                        </button>
                        <button class="btn waves-effect waves-light " onclick="NextSlide()">Droit
                            <i class="material-icons left">arrow_forward</i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col 12 s3">
            <div class="card white darken-1">
                <div class="card-content dark-text">
                    <span class="card-title">
                        {if $val.worldinfo.count eq 1 }
                            <h6>Message du Maitre du monde</h6>
                        {else}
                            <h6>Message des Maitres du monde</h6>
                        {/if}
                    </span>
                    <p>{$val.word.Message}</p>
                </div>
            </div>
        </div>

        <div class="col 12 s3">
            <div class="card white darken-1">
                <div class="card-content dark-text">
                    <span class="card-title">Vue 3D du mondes</span>.
                        <div class="video-container">
                        {$val.word.link_3d}
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>