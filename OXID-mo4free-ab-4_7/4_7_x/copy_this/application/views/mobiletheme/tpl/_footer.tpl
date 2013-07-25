   [{assign var="currentclassname" value=$oView->getClassName()}]
   [{assign var ="basketcount" value=$oxcmp_basket->getItemsCount()}]
    <div id="footer">
    [{if $currentclassname != "basket"}]
		<div class="signSec">
		[{if $oxcmp_user}]
			<a href="[{ $oViewConf->getLogoutLink() }]" title="[{ oxmultilang ident="INC_ACCOUNT_HEADER_LOGOUT" }]" rel="nofollow">[{ oxmultilang ident="INC_ACCOUNT_HEADER_LOGOUT" }]</a>
		[{else}]
			<a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_SIGNIN" }]</a>
		[{/if}]
        </div>
     [{/if}]
      <div class="footernav [{if $currentclassname == "basket"}]cleardiv[{/if}]">
        <ul>
            <li><a href="[{$oViewConf->getHomeLink()}]" title="[{oxmultilang ident="INC_FOOTER_HOME"}]">[{oxmultilang ident="INC_FOOTER_HOME"}]</a></li>
            [{* <li><a href="#" rel="nofollow">[{ oxmultilang ident="INC_FOOTER_MYDESK" }]</a></li> *}]
            [{* <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" }]" rel="nofollow">[{if $oxcmp_user}][{ oxmultilang ident="INC_FOOTER_ACCOUNT" }][{else}][{ oxmultilang ident="INC_FOOTER_SIGNIN" }][{/if}]</a></li> *}]
            <li><a href="[{ $oViewConf->getBasketLink() }]">[{ oxmultilang ident="INC_FOOTER_CART" }]
            [{if $basketcount}]<span class="pop">[{$basketcount}]</span>[{/if}]</a>
            </li>
            [{oxifcontent ident="oxagb" object="_cont"}]
                <li><a href="[{ $_cont->getLink() }]">[{ oxmultilang ident="AGB" }]</a></li>
            [{/oxifcontent}]
            [{oxifcontent ident="oximpressum" object="_cont"}]
                <li><a href="[{ $_cont->getLink() }]">[{ oxmultilang ident="IMPRESUSUM" }]</a></li>
            [{/oxifcontent}]
            <li><a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=content" }]">[{ oxmultilang ident="INC_FOOTER_MORE" }]</a></li>
            
        </ul>
        <div class="dd_switch_version">
            <a href="[{ $oViewConf->getSelfLink()}]viewmode=std" onclick="setCookie( 'dd_mobile', 'std'); return true;">[{oxmultilang ident="DD_FOOTER_SWITCH_2_STD"}]</a>
        </div>
        [{oxifcontent ident="oxdeliveryinfo" object="oCont"}]
	        <div class="startext"><a href="[{ $oCont->getLink() }]">[{ oxmultilang ident="FOOTER_INCLTAXANDPLUSSHIPPING" }]</a></div>
        [{/oxifcontent}]
      </div>
      <div class="copyrts">[{oxifcontent ident="oxstdfooter" object="oCont"}]
                [{$oCont->oxcontents__oxcontent->value}]
            [{/oxifcontent}]</div>
    </div>
</div><!-- center div ends-->







