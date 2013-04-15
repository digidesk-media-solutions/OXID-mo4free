<div class="contMain">
  
 <ul class="ul-navi">
        <li>
        <a id="test_link_account_password" class="[{if $active_link == 1}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_password" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_PERSONALSETTINGS" }]</a>
        <!--<span class="desc">[{ oxmultilang ident="INC_ACCOUNT_HEADER_CHANGEPWD" }]</span>-->
        </li>
        <li>
        <a id="test_link_account_newsletter" class="[{if $active_link == 2}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_newsletter" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_NEWSLETTERSETTINGS" }]</a>
        <!--<span class="desc">[{ oxmultilang ident="INC_ACCOUNT_HEADER_NEWSLETTERSUBSCRIBE" }]</span>-->
        </li>
         <li>
        <a id="test_link_account_billship" class="[{if $active_link == 3}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=account_user" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_BILLINGSHIPPINGSET" }]</a>
        <!--<span class="desc">[{ oxmultilang ident="INC_ACCOUNT_HEADER_UPDATEYOURBILLINGSHIPPINGSET" }]</span>-->
        </li>
        <li>
        <a id="test_link_account_order" class="[{if $active_link == 4}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_ORDERHISTORY" }]
        <span class="pop">[{ $oView->getOrderCnt() }]</span></a>
        </li>
            [{if $oView->isEnabledDownloadableFiles()}]
            <li>
                <a id="test_link_account_downloads" class="[{if $active_link == 5}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_downloads" }]" rel="nofollow">[{ oxmultilang ident="MY_DOWNLOADS" }]</a>
                
            </li>
            [{/if}]  
        [{*    
        <li>
        <a id="test_link_account_noticelist" class="[{if $active_link == 5}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_noticelist" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_MYNOTICELIST" }]
        <span class="pop">[{ if $oxcmp_user }][{ $oxcmp_user->getNoticeListArtCnt() }][{else}]0[{/if}]</span></a>
        </li>
        
        [{if $oViewConf->getShowWishlist()}]
            <li>
            <a id="test_link_account_wishlist" class="[{if $active_link == 6}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_wishlist" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_MYWISHLIST" }]
            <span class="pop">[{ if $oxcmp_user }][{ $oxcmp_user->getWishListArtCnt() }][{else}]0[{/if}]</span></a>
            </li>
        [{/if}]
        [{if $oViewConf->getShowCompareList()}]
        <li>
       <a id="test_link_account_comparelist" class="[{if $active_link == 7}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_MYPRODUCTCOMPARISON" }]
        <span class="pop">[{ if $oView->getCompareItemsCnt() }][{ $oView->getCompareItemsCnt() }][{else}]0[{/if}]</span></a>
        </li>
        [{/if}]
        [{if $oViewConf->getShowListmania()}]
            <li>
           <a id="test_link_account_recommlist" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_recommlist" }]" class="[{if $active_link == 8}]active[{/if}]">[{ oxmultilang ident="INC_ACCOUNT_HEADER_MYRECOMMLIST" }]
            <span class="pop">[{ if $oxcmp_user->getRecommListsCount() }][{ $oxcmp_user->getRecommListsCount() }][{else}]0[{/if}]</span></a>
            </li>
        [{/if}]
       *}] 
        <li>
           <a id="test_link_account_logout" href="[{ $oViewConf->getLogoutLink() }]" class="[{if $active_link == 9}]active[{/if}]">[{ oxmultilang ident="INC_ACCOUNT_HEADER_LOGOUT" }]</a>
        </li>
   </ul>
</div>
