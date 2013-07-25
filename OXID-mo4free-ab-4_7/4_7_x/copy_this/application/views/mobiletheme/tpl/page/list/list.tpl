
[{include file="_header.tpl" tree_path=$oView->getTreePath() titlepagesuffix=$oView->getTitlePageSuffix()}]
[{assign var="tree" value=$oxcmp_categories}]


[{assign var="catcount" value=$tree|@count }]

   <div id="content"> 
        [{capture name=list_details}]
     [{assign var="actCategory" value=$oView->getActiveCategory()}]
     [{assign var ="parentcategory" value=$actCategory->getParentCategory()}]
     
		[{assign var = "backurl" value=$oViewConf->getSelfActionLink()" }]
		
		[{if $parentcategory}]
			[{assign var = "backurl" value=$parentcategory->getLink() }]
		[{else}]
			[{foreach  from=$tree name="catloop" item="cat"}]
				[{if ($actCategory->oxcategories__oxid->value == $cat->oxcategories__oxid->value) && ($smarty.foreach.catloop.iteration > $oView->getTopNavigationCatCnt())}]
					[{assign var = "backurl" value=$oViewConf->getSelfActionLink()|cat:"showmore=1" }]
				[{/if}]
			[{/foreach}]
		[{/if}]
		
			
     [{include file="_titlesection.tpl" header=$actCategory->oxcategories__oxtitle->value back=$backurl}]
      
     
     
     
     

        [{if $oView->hasVisibleSubCats()}]
            
            <div class="contMain">
        <ul class="ul-navi">
            [{foreach from=$oView->getSubCatList() item=category name=MoreSubCat}]
            <li>
                [{if $category->getContentCats() }]
                    [{foreach from=$category->getContentCats() item=ocont name=MoreCms}]
                    <li><a id="test_MoreSubCms_[{$smarty.foreach.MoreSubCat.iteration}]_[{$smarty.foreach.MoreCms.iteration}]" href="[{$ocont->getLink()}]">[{ $ocont->oxcontents__oxtitle->value }]</a></li>
                    [{/foreach}]
                [{/if}]
                [{if $category->getIsVisible()}]
                    [{assign var="iconUrl" value=$category->getIconUrl()}]
                    [{if $iconUrl}]
                        <a id="test_MoreSubCatIco_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{ $category->getLink() }]">
                        
                           
				[{$sSpacer}][{$category->oxcategories__oxtitle->value}] [{if $category->getNrOfArticles() > 0}] ([{$category->getNrOfArticles()}])[{/if}]</a>
                        </a>
                    [{else}]
                        <li><a id="test_MoreSubCat_[{$smarty.foreach.MoreSubCat.iteration}]" href="[{ $category->getLink() }]">[{ $category->oxcategories__oxtitle->value }][{ if $category->getNrOfArticles() > 0 }] ([{ $category->getNrOfArticles() }])[{/if}]</a></li>
                    [{/if}]
                [{/if}]
            [{/foreach}]
            </li>
            </ul>
            </div>
        [{/if}]

        [{if $actCategory->oxcategories__oxlongdesc->value}]
            <hr>
            <span id="test_catLongDesc">[{oxeval var=$actCategory->oxcategories__oxlongdesc}]</span>
        [{/if}]
    [{/capture}]

    
    [{$smarty.capture.list_details}]
    

    [{if $oView->getArticleCount() }]
        [{include file="inc/list_locator.tpl" PageLoc="Top"}]
    [{/if}]

    [{foreach from=$oView->getArticleList() item=actionproduct name=test_articleList}]
        [{include file="inc/product_list.tpl" product=$actionproduct testid="action_"|cat:$actionproduct->oxarticles__oxid->value test_Cntr=$smarty.foreach.test_articleList.iteration}]
        
    [{/foreach}]


    [{if $oView->getArticleCount() }]
        [{include file="inc/list_locator.tpl" PageLoc="Bottom"}]
    [{/if}]
</div>
[{insert name="oxid_tracker" title="LIST_CATEGORY"|oxmultilangassign product=""}]

[{assign var ="parentcategory" value=$actCategory->getParentCategory()}]  
[{if $parentcategory}][{assign var = "backurl" value=$parentcategory->getLink() }][{/if}]

[{include file="_footer.tpl" backurl=$backurl }]

