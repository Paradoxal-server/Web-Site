<div class="info center-align" data-aos="fade">
    <div class="main">
        <div class="row">
            <div class="col l4 s12">
                <img class="responsive-img" src="style/img/news.png">
                <h4>News</h4>
                {section name=new start=0 loop=2 step=1}
                    {assign var="author" value="author-"|cat:$smarty.section.new.index}
                    {assign var="title" value="title-"|cat:$smarty.section.new.index}
                    {assign var="date" value="date-"|cat:$smarty.section.new.index}
                    {assign var="message" value="message-"|cat:$smarty.section.new.index}
                    <div class="card grey darken-1">
                        <div class="card-content white-text">
                            <span class="card-title">{$val.new[$title]}</span>
                            <hr>
                            <div class="card-content">
                                <p>{$val.new[$message]}</p>
                            </div>

                            <div class="card-action">
                                <a href="#!">{$val.new[$author]}</a><br>
                                <a href="#!">Date: {$val.new[$date]}</a>
                            </div>
                        </div>
                    </div>


                {/section}
            </div>
            <div class="col l4 s12">
                <img class="responsive-img" src="style/img/twitter.png">
                <h4>Nos réseaux social</h4>
                <a class="twitter-timeline" data-dnt="true" data-theme="dark" data-link-color="#9266CC" href="https://twitter.com/Paradoxal18?ref_src=twsrc%5Etfw">Tweets by Paradoxal18</a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                <img class="responsive-img" src="style/img/discord.png">
                <h4>Discord</h4>
                <iframe src="https://discordapp.com/widget?id=437909882411417601&theme=dark" width="350" height="500" allowtransparency="true" frameborder="0"></iframe>
            </div>
            <div class="col l4 s12">
                <img class="responsive-img" src="style/img/Logo.png">
                <h4>Serveur</h4>

                     {if $val.serveur.server eq 1}
                         <div class="card green darken-1">
                             <div class="card-content white-text">
                                 <span class="card-title">Serveur ouvert</span>
                                 <i class="chip">
                                     {$val.serveur.player_online} / {$val.serveur.max_Player} Joueur en ligne
                                 </i>
                                 <div class="progress white">
                                     <div class="determinate red" style="width: {$val.serveur.percentage}%"></div>
                                 </div>
                             </div>
                             <div class="card-action">
                                 <a class="btn-large waves-effect waves-light grey darken-1" style="margin-bottom: 9%; margin-top: 2%;">Voir la liste des joueurs</a>
                                 <a class="btn-large waves-effect waves-light grey darken-4" style="margin-bottom: 9%; margin-top: 2%;">Rejoindre le serveur</a>
                             </div>
                         </div>
                         <br>
                     {else}
                         <div class="card red darken-1">
                             <div class="card-content white-text">
                                 <span class="card-title">Le serveur est fermer</span>
                                 <p>Actuellement le serveur le fermer, nous excusons de cette fermeture.</p>
                                 <p>Pour savoir quand le serveur sera réouvert, cliquer sur "En savoir plus" </p>
                             </div>
                         </div>
                         <br>
                         <a class="btn-large waves-effect waves-light grey darken-4" style="margin-bottom: 9%; margin-top: 2%;">En savoir plus</a>
                     {/if}
                </i>
            </div>
        </div>
    </div>
</div>