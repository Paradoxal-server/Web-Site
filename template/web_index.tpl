{include file="design/header.tpl"}
{include file="design/navbar.tpl"}
{include file="design/msgPage.tpl"}
{assign var="page" value="page/"|cat:$paget}
{include file=$page}
{include file="design/footer.tpl"}
