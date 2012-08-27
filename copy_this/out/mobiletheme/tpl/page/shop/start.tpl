[{include file="_header.tpl" title=$template_title location="START_TITLE"|oxmultilangassign isStart=true}]
<div id="content">
[{if $smarty.get.showmore}]
	[{assign var="showback" value=false}]
[{else}]
	[{assign var="showback" value=true}]
[{/if}]

[{include file="_titlesection.tpl" header="PAGE_START_CATEGORIES"|oxmultilangassign needbacklink=$showback}]

[{if $oxcmp_categories }]
  [{if $oView->showTopCatNavigation()}]
    [{include file="inc/category_tree.tpl" tree=$oxcmp_categories->getClickRoot() act=$oxcmp_categories->getClickCat() class="category-list" more=$smarty.get.showmore}]
  [{else}]
    [{include file="inc/category_tree.tpl" tree=$oxcmp_categories act=$oxcmp_categories->getClickCat() class="category-list" more=$smarty.get.showmore}]
  [{/if}]
[{/if}]
</div>

[{include file="_footer.tpl" }] 
[{ insert name="oxid_tracker" title=$template_title }]


