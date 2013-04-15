[{assign var="template_title" value="LINKS_TITLE"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
<div id="content">
[{include file="_titlesection.tpl" header="PAGE_SERVICE_HEADER"|oxmultilangassign }]
<div class="contMain">
<ul class="ul-navi">
    <li>
    <a id="test_link_footer_account" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]" rel="nofollow">[{if $oxcmp_user}][{ oxmultilang ident="INC_ACCOUNT_HEADER_MYACCOUNT" }][{$oxcmp_user->oxuser__oxusername->value}][{else}][{ oxmultilang ident="INC_CMP_LOGIN_LOGIN" }][{/if}]</a>
    </li>
    <li>
         <a id="test_link_footer_contact" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=contact" }]">[{ oxmultilang ident="INC_FOOTER_CONTACT" }]</a>
         
    </li>
    <li>
         <a id="test_link_footer_help" href="[{ $oViewConf->getHelpPageLink() }]">[{ oxmultilang ident="INC_FOOTER_HELP" }]</a>
    </li>
    <li>
         <a id="test_link_footer_guestbook" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=guestbook" }]">[{ oxmultilang ident="INC_FOOTER_GUESTBOOK" }]</a>
    </li>
    <li>
         <a id="test_link_footer_links" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=links" }]">[{ oxmultilang ident="INC_FOOTER_LINKS" }]</a>
    </li>
    [{oxifcontent ident="oximpressum" object="oCont"}]
        <li>
         <a id="test_link_footer_impressum" href="[{ $oCont->getLink() }]">[{ $oCont->oxcontents__oxtitle->value }]</a>
        </li>
    [{/oxifcontent}]
    [{oxifcontent ident="oxsecurityinfo" object="oCont"}]
                 <li><a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_POLICIES" }]</a></li>
    [{/oxifcontent}]
    
    [{oxifcontent ident="oxagb" object="oCont"}]
            <li><a id="test_link_footer_terms" href="[{ $oCont->getLink() }]" rel="nofollow">[{ $oCont->oxcontents__oxtitle->value }]</a></li>
    [{/oxifcontent}]
    [{*if $oViewConf->getShowCompareList()}]
        <li><a id="test_link_account_comparelist" class="[{if $active_link == 7}]active[{/if}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=compare" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_MYPRODUCTCOMPARISON" }]</a></li>
                
            [{/if*}]
    
    [{*if $oViewConf->getShowWishlist()}]
            <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wishlist" params="wishid="|cat:$oView->getWishlistUserId() }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_PUBLICWISHLIST" }]</a></li>
   [{/if*}]
   [{if $oxcmp_user}]
   <li>
           <a id="test_link_account_logout" href="[{ $oViewConf->getLogoutLink() }]" class="[{if $active_link == 9}]active[{/if}]">[{ oxmultilang ident="INC_ACCOUNT_HEADER_LOGOUT" }]</a>
            
   </li>
   [{/if}]
    
</ul>
</div>
<br/>
</div>

[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
