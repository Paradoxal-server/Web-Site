<div class="info center-align" data-aos="fade">
    <div class="main">
        <div class="row">
            <div class="col 24 s12">
                <!--<img class="responsive-img" src="style/img/play.png">-->
                <div class="card white darken-1">
                    <div class="card-content dark-text">
                        <span class="card-title"><h4>Liste des joueur</h4></span>
                        <table class="responsive-table text-white">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Pseudo</th>
                                    <th>Metier</th>
                                    <th>Mondes</th>
                                    <th>Voir Profils</th>
                                </tr>
                            </thead>
                            <tbody>
                                {section name=player start=1 loop=$val.player.count step=1}
                                    {assign var="id" value="id-"|cat:$smarty.section.player.index}
                                    {assign var="Pseudo" value="Pseudo-"|cat:$smarty.section.player.index}
                                    {assign var="uuid" value="uuid-"|cat:$smarty.section.player.index}
                                    {assign var="Metier" value="Metier-"|cat:$smarty.section.player.index}
                                    {assign var="idworld" value="idworld-"|cat:$smarty.section.player.index}
                                    {assign var="Name" value="Name-"|cat:$smarty.section.player.index}
                                    <tr>
                                        <td>{$val.player[$id]}</td>
                                        <td>
                                            <img src="https://crafatar.com/avatars/{$val.player[$uuid]}?size=35" class="rounded-circle">
                                            {$val.player[$Pseudo]}
                                        </td>
                                        <th>
                                            {$val.player[$Metier]}
                                        </th>
                                        <td>
                                            <a href="index.php?page=web_world.tpl&id={$val.player[$idworld]}" class="waves-effect waves-light btn-large">{$val.player[$Name]}<i class="material-icons right">send</i></a>
                                        </td>
                                        <td>
                                            <a href="index.php?page=web_profils.tpl&id={$val.player[$id]}" class="waves-effect waves-light btn-large">Voir le profils<i class="material-icons right">send</i></a>
                                        </td>
                                    </tr>
                                {/section}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>