[{if !$smarty.get.oxcid}]
    [{include file="page/info/service.tpl"}]
[{else}]

[{assign var="oContent" value=$oView->getContent()}]

[{assign var="template_title" value=$oContent->oxcontents__oxtitle->value}]
[{assign var="tpl" value=$oViewConf->getActTplName()}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=content"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink}]
<div id="content">
    [{*}]<div id="test_contentHeader" class="box head"><b>[{$template_title}]</b></div>[{*}]
    <div id="test_contentBody" class="box">[{ oxcontent oxid=$oView->getContentId() }]</div>
</div>
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=service"}]

[{/if}]
