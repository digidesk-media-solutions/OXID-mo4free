[{assign var="search_title" value="SEARCH_TITLE"|oxmultilangassign}]
[{assign var="searchparamforhtml" value=$oView->getSearchParamForHtml() }]
[{assign var="template_title" value="$search_title - $searchparamforhtml"}]

[{include file="_header.tpl" title=$template_title location="SEARCH_LOCATION"|oxmultilangassign }]
[{include file="_titlesection.tpl" header="INC_LEFTITEM_PRODUCTSEARCH"|oxmultilangassign|cat:"&nbsp;-&nbsp;\"&nbsp;"|cat:$oView->getSearchParamForHtml()|cat:"&nbsp;\"" back=$newurl }]
<div id="content">

[{if $oView->showSearch() }]
    
    <form action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search" class="search" id="f.search">
        <div class="box">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="search">
            <input type="text" name="searchparam" value="[{$oView->getSearchParamForHtml()}]"  id="f.search.param" class="txt">

            [{*if $oView->getSearchCatTree() }]
            <select id="test_searchCategorySelect" class="search_input" name="searchcnid" [{if $oViewConf->getViewThemeParam('blAutoSearchOnCat') }]onchange="oxid.search('f.search','f.search.param');"[{/if}]>
                <option value=""> [{ oxmultilang ident="INC_SEARCHLEFTITEM_ALLCATEGORIES" }] </option>
                [{include file="inc/category_options.tpl" tree=$oView->getSearchCatTree() sSpacer=""}]
            </select>
            [{/if*}]

            [{*if $oView->getVendorlist() }]
            <select id="test_searchVendorSelect" class="search_input" name="searchvendor">
                <option value=""> [{ oxmultilang ident="INC_SEARCHLEFTITEM_ALLDISTRIBUTORS" }] </option>
                [{foreach from=$oView->getVendorlist() item=oVendorlistentry}]
                    <option value="[{$oVendorlistentry->oxvendor__oxid->value}]"[{if $oView->getSearchVendor() == $oVendorlistentry->oxvendor__oxid->value}] selected[{/if}]>[{ $oVendorlistentry->oxvendor__oxtitle->value }][{ if $oVendorlistentry->getNrOfArticles() > 0 }] ([{$oVendorlistentry->getNrOfArticles()}])[{/if}]</option>
                [{/foreach}]
            </select>
            [{/if*}]

            [{*if $oView->getManufacturerlist() }]
            <select id="test_searchManufacturerSelect" class="search_input" name="searchmanufacturer">
                <option value=""> [{ oxmultilang ident="INC_SEARCHLEFTITEM_ALLMANUFACTURERS" }] </option>
                [{foreach from=$oView->getManufacturerlist() item=oManufacturerlistentry}]
                    <option value="[{$oManufacturerlistentry->oxmanufacturers__oxid->value}]"[{if $oView->getSearchManufacturer() == $oManufacturerlistentry->oxmanufacturers__oxid->value}] selected[{/if}]>[{ $oManufacturerlistentry->oxmanufacturers__oxtitle->value }][{ if $oManufacturerlistentry->getNrOfArticles() > 0 }] ([{$oManufacturerlistentry->getNrOfArticles()}])[{/if}]</option>
                [{/foreach}]
            </select>
            [{/if*}]

            <span><input id="test_searchGo" type="submit" class="btn" value="GO!"></span>
        </div>
    </form>
[{/if}]

  <!-- page locator -->
  [{if $oView->getArticleCount() }]
    [{include file="inc/list_locator.tpl" PageLoc="Top"}]
  [{else}]
    <div class="block msg">[{ oxmultilang ident="SEARCH_NOITEMSFOUND" }]</div>
  [{/if}]

  [{if $oView->getArticleList() }]
    [{assign var="search_head" value="SEARCH_HITSFOR"|oxmultilangassign}]
    [{assign var="search_head" value=$oView->getArticleCount()|cat:" "|cat:$search_head|cat:" &quot;"|cat:$oView->getSearchParamForHtml()|cat:"&quot;"}]
    [{assign var='rsslinks' value=$oView->getRssLinks() }]
    [{if $rsslinks.searchArticles}]
        [{assign var="search_head" value="`$search_head` <a class=\"rss\" id=\"rssSearchProducts\" href=\"`$rsslinks.searchArticles.link`\" title=\"`$rsslinks.searchArticles.title`\"></a>"}]
        [{oxscript add="oxid.blank('rssSearchProducts');"}]
    [{/if}]

    [{foreach from=$oView->getArticleList() name=search item=product}]

      [{if $smarty.foreach.search.first && !$smarty.foreach.search.last}]
        [{assign var="search_class" value="firstinlist"}]
      [{elseif $smarty.foreach.search.last}]
        [{assign var="search_class" value="lastinlist"}]
      [{else}]
        [{assign var="search_class" value="inlist"}]
      [{/if}]

     [{include file="inc/product_list.tpl" product=$product testid="action_"|cat:$product->oxarticles__oxid->value test_Cntr=$smarty.foreach.search.iteration}]

      [{assign var="search_head" value=""}]
      [{if !$smarty.foreach.search.last }]
        <div class="separator"></div>
      [{/if}]

    [{/foreach}]
  [{/if}]


  <!-- page locator -->
  [{if $oView->getArticleCount() }]
    [{include file="inc/list_locator.tpl" PageLoc="Bottom"}]
  [{/if}]
</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
