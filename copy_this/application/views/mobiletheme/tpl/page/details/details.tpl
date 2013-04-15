
[{if $oView->getSearchTitle() }]
  [{ assign var="template_location" value=$oView->getSearchTitle()}]
[{else}]
  [{ assign var="template_location" value=""}]
  [{ assign var="blSep" value=""}]
  [{foreach from=$oView->getCatTreePath() item=oCatPath}]
    [{ if $blSep == "y"}]
      [{ assign var="template_location" value=$template_location|cat:" / "}]
    [{/if}]
    [{ assign var="template_location" value=$template_location|cat:"<a href=\""|cat:$oCatPath->getLink()|cat:"\">"|cat:$oCatPath->oxcategories__oxtitle->value|cat:"</a>"}]
    [{ assign var="blSep" value="y"}]
  [{/foreach}]
[{/if}]

[{assign var="actCategory" value=$oView->getActiveCategory()}]
[{include file="_header.tpl" location=$template_location }]
<div id="content">
<!-- article locator -->
<!-- ox_mod01 details -->
[{assign var="currency" value=$oView->getActCurrency() }]
[{assign var="product" value=$oView->getProduct() }]
[{include file="_titlesection.tpl" header=$product->oxarticles__oxtitle->value|cat:"&nbsp;"|cat:$product->oxarticles__oxvarselect->value back=$actCategory->toListLink}]

  
	  
	  	[{include file="page/details/prdct_details.tpl"}]	  
	 
 

</div>
[{ insert name="oxid_tracker" title="DETAILS_TITLE"|oxmultilangassign product=$product cpath=$oView->getCatTreePath() }]
[{include file="_footer.tpl" popup=$sZoomPopup backurl = $actCategory->toListLink}]
