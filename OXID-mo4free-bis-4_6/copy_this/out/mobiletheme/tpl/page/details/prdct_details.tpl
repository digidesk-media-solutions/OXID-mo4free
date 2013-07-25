    <div class="contMain box info">

    <table cellpadding="0" cellspacing="0" width="100%">
    <tr class="details-block">
        <td width="50%"> <!--image td starts -->
            <div class="item_img">

                <div class="img_div">
                    <img src="[{ $oView->getActPicture() }]" id="product_img" class="photo" alt="[{ $product->oxarticles__oxtitle->value|strip_tags }] [{ $product->oxarticles__oxvarselect->value|default:'' }]">
                </div>
                [{if $oView->morePics() }]<br>
                <div class="morepics">
                    [{foreach from=$oView->getIcons() key=picnr item=ArtIcon name=MorePics}]
                    <a id="test_MorePics_[{$smarty.foreach.MorePics.iteration}]" rel="nofollow" href="[{ $product->getLink()|oxaddparams:"actpicid=`$picnr`" }]" ><img src="[{$product->getIconUrl($picnr)}]" alt=""></a>
                    [{/foreach}]
                </div>
                [{/if}]
            </div>
        </td><!--image td ends -->

    <tr>
        <td colspan="2">
            <div class="priceblock clearfix" style="margin-top: 20px;">
                <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">

                    <div>
                        [{ $oViewConf->getHiddenSid() }]
                        [{ $oViewConf->getNavFormParams() }]
                        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                        <input type="hidden" name="fnc" value="tobasket">
                        <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
                        <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
                    </div>

                    [{*if $oView->getSelectLists() }]
        [{foreach key=iSel from=$oView->getSelectLists() item=oList}]
         <div class="variants">
          <label>[{ $oList.name }]:</label>
            <select id="test_select_[{$product->oxarticles__oxid->value}]_[{$iSel}]" name="sel[[{$iSel}]]" onchange="oxid.sellist.set(this.name,this.value);">
              [{foreach key=iSelIdx from=$oList item=oSelItem}]
                [{ if $oSelItem->name }]<option value="[{$iSelIdx}]">[{ $oSelItem->name }]</option>[{/if}]
              [{/foreach}]
            </select>
        </div>
        [{/foreach}]
        [{/if*}]

                    <table width="100%">
                        [{oxhasrights ident="TOBASKET"}]
                        [{ if $product->isBuyable() }]
                        <tr>
                            <td><div class="amount">
                                <strong><label>[{ oxmultilang ident="DETAILS_QUANTITY" }]</label></strong><input id="test_AmountToBasket" type="text" size="3" name="am" value="1">
                            </div></td>
                            <td align="right">
                                <div class="tobasket clearfix"><input class="btn-new" id="toBasketBtn" type="submit" value="[{if $size=='small'}][{oxmultilang ident="INC_PRODUCTITEM_ADDTOCARD3" }][{else}][{oxmultilang ident="INC_PRODUCTITEM_ADDTOCARD2"}][{/if}]"></div>
                            </td>
                        </tr>
                        [{else}]
                        <tr><td>
                            [{if $oView->isPriceAlarm() && !$product->isParentNotBuyable()}]
                            <div class="pricealarm">
                                <a rel="nofollow" href="#preisalarm_link">[{ oxmultilang ident="DETAILS_PRICEALARM2" }]</a>
                            </div>
                            [{/if}]
                        </td>
                        </tr>
                        [{/if}]
                        [{/oxhasrights}]

                    </table>

                </form>
            </div><!-- priceblock ends--><br/>
        </td>
    </tr>

    <!--<tr>
            <td colspan="2" vaign="top" class="details-block">
            <div class="tobasket clearfix">
                [{oxhasrights ident="TOBASKET"}]
                    <input type="button" name="toBasketBtn" id="toBasketBtn" value="Add to Shopping Cart" />
                [{/oxhasrights}]
            </div>
            </td>
          </tr>-->

    <td valign="top" width="50%" class="tright"> <!--content td starts -->
        <div class="prod_brief">
            <div class="art-no clearfix">
                <span class="itemno"><b>[{ oxmultilang ident="INC_PRODUCTITEM_ARTNOMBER2" }] </b><span id="artnum">[{ $product->oxarticles__oxartnum->value }]</span></span>
            </div>
        <div class="price_etc clearfix">
            [{if $product->getFTPrice() || $product->getPricePerUnit() || $product->loadAmountPriceInfo() }]
            <div class="price_block list-det">
                [{if $product->getFTPrice() }]
                <strong><span class="old">[{ oxmultilang ident="DETAILS_PERSPARAM_REDUCEDFROM" }] <del>[{ $product->getFTPrice()}] [{ $currency->sign}]</del></span></strong><span>[{ oxmultilang ident="DETAILS_PERSPARAM_NOWONLY" }]</span>
                [{/if}]
                [{if $product->getFPrice() }]
                <div class="price">
                    <span id="product_price">[{ $product->getFPrice() }]</span> [{ $currency->sign}]*
                    [{if $product->getPricePerUnit()}]
                                                            <span class="pperunit">
                                                                ([{$product->getPricePerUnit()}] [{ $currency->sign}]/[{$product->oxarticles__oxunitname->value}])
                                                            </span>
                    [{/if}]
                </div>
                [{/if}]
                [{assign var="oCont" value=$oView->getContentByIdent("dd_oxdeliveryinfo_iphone") }]
            </div>
            [{ /if }]

            [{ if !$product->getFTPrice() && !$product->getPricePerUnit() && !$product->loadAmountPriceInfo() }]
            [{oxhasrights ident="SHOWARTICLEPRICE"}]
                <div class="price list-det">
                    [{if $product->getFTPrice() }]
                    <span class="old">[{ oxmultilang ident="DETAILS_PERSPARAM_REDUCEDFROM" }] <del>[{ $product->getFTPrice()}] [{ $currency->sign}]</del></span>
                    [{else}]
                    <!-- <span class="old">&nbsp;</span>	            	-->
                    [{/if}]
                    [{if $product->getFPrice() }]
                    <big><span id="product_price">[{ $product->getFPrice() }]</span> [{ $currency->sign}]*</big>
                    [{/if}]
                    [{assign var="oCont" value=$oView->getContentByIdent("dd_oxdeliveryinfo_iphone") }]
                    [{*}]
                                                    <span class="dinfo">[{ oxmultilang ident="DETAILS_PERSPARAM_PLUSSHIPPING" }]<a href="[{ $oCont->getLink() }]" rel="nofollow">[{ oxmultilang ident="DETAILS_PERSPARAM_PLUSSHIPPING2" }]</a></span>
                                                    [{*}]
                </div>
                [{/oxhasrights}]
            [{ /if }]
        </div> <!-- price_etc block ends-->

            [{*
                                <div class="rating_stars clearfix list-det">
                                    [{math equation="x*y" x=20 y=$product->getArticleRatingAverage() assign="currentRate" }]
                                        <form action="[{ $oViewConf->getSelfActionLink() }]" method="post" id="rating">
                                        [{ $oViewConf->getHiddenSid() }]
                                            [{ $oViewConf->getNavFormParams() }]
                                            [{oxid_include_dynamic file="dyn/formparams.tpl" }]
                                            <input type="hidden" name="fnc" value="savereview">
                                            <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                                            <input type="hidden" name="anid" value="[{ $product->oxarticles__oxid->value }]">
                                                    <ul id="star_rate_top" class="rating">
                                                      <li id="current_rate" class="current_rate" style="width: 0px;"><a title="[{$_star_title}]"><b>1</b></a></li>
                                                [{section name=star start=1 loop=6}]
                                                <li class="s[{$smarty.section.star.index}]"><a rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=review" params="anid=`$product->oxarticles__oxnid->value`&amp;"|cat:$oViewConf->getNavUrlParams() }]" onclick="oxid.review.rate([{$smarty.section.star.index}]);return false;" title="[{$smarty.section.star.index}] [{if $smarty.section.star.index==1}][{ oxmultilang ident="DETAILS_STAR" }][{else}][{ oxmultilang ident="DETAILS_STARS" }][{/if}]"><b>[{$smarty.section.star.index}]</b></a></li>
                                                [{/section}]
                                                    </ul>
                                        </form>
                                </div> <!--rating_stars  ends-->

                                *}]

        <div class="specification clearfix" >
            [{ if $oView->getAttributes() }]
            <strong id="test_specsHeader" class="boxhead">[{ oxmultilang ident="DETAILS_SPECIFICATION" }]</strong>
            <div class="divspec">
                <table width="100%" class="attributes" align="right">
                    <colgroup><col width="50%" span="2"></colgroup>
                    [{foreach from=$oView->getAttributes() item=oAttr name=attribute}]
                    <tr [{if $smarty.foreach.attribute.last}]class="last"[{/if}]>
                    <td id="test_attrTitle_[{$smarty.foreach.attribute.iteration}]"><b>[{ $oAttr->title }]</b></td></tr><tr>
                        <td id="test_attrValue_[{$smarty.foreach.attribute.iteration}]">[{ $oAttr->value }]</td>
                    </tr>
                    <tr><td colspan="2" height="3"></td></tr>
                    [{/foreach}]
                </table>
            </div>
            [{/if}]
        </div><!-- specification block ends -->
            <br/>

            <div class="variants clearfix">

                [{if $oView->getVariantList() || $oView->drawParentUrl()}]
                [{* <strong id="test_variantHeader" class="boxhead">
                                            [{if $oView->drawParentUrl()}]
                                                    <a id="test_backToParent" href="[{$oView->getParentUrl()}]">[{oxmultilang ident="INC_PRODUCT_VARIANTS_BACKTOMAINPRODUCT"|oxmultilangassign|cat:" "|cat:$oView->getParentName() }]</a>
                                            [{else}]
                                                    [{oxmultilang ident="INC_PRODUCT_VARIANTS_VARIANTSELECTIONOF"|oxmultilangassign|cat:" `$product->oxarticles__oxtitle->value`" }]
                                            [{/if}]
                                        </strong>
                                        <div class="variantslist">
                                            [{ if $oView->drawParentUrl() && count( $oView->getVariantList() ) }]
                                                <b id="test_variantHeader1">[{ oxmultilang ident="INC_PRODUCT_VARIANTS_OTHERVARIANTSOF" }] [{ $oView->getParentName() }]</b>         <br>
                                                <div class="txtseparator inbox"></div>
                                            [{/if}]
                                        </div>*}]
            <form name="tobasket.current" action="[{ $oViewConf->getSelfActionLink() }]" method="post">
                [{if $size=='big'}][{$smarty.capture.product_price}][{/if}]
            <div class="variants">
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                [{if $owishid}]
                    <input type="hidden" name="owishid" value="[{$owishid}]">
                    [{/if}]
                [{if $toBasketFunction}]
                    <input type="hidden" name="fnc" value="[{$toBasketFunction}]">
                    [{else}]
                    <input type="hidden" name="fnc" value="tobasket">
                    [{/if}]
                <input type="hidden" name="aid" value="[{ $product->oxarticles__oxid->value }]">
                [{if $altproduct}]
                    <input type="hidden" name="anid" value="[{ $altproduct }]">
                    [{else}]
                    <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
                    [{/if}]
                [{if $recommid}]
                    <input type="hidden" name="recommid" value="[{ $recommid }]">
                    [{/if}]
                <input type="hidden" name="pgNr" value="[{ $oView->getActPage() }]">
                [{if $size!='thin' && $size!='thinest'}]
                    <input id="test_am_current" type="hidden" name="am" value="1">
                    [{/if}]

                [{ if $product->getVariants() || $product->oxarticles__oxparentid->value }]
                [{ assign var=actproduct value=$product }]
                [{ if $product->oxarticles__oxparentid->value }]
                [{ assign var=actproduct value=$product->getParentArticle() }]
                [{ /if }]
                <label>[{ $actproduct->oxarticles__oxvarname->value }]:</label>
                [{ if $product->getVariants() || $product->oxarticles__oxparentid->value }]
                [{ assign var=actproduct value=$product }]
                [{ if $product->oxarticles__oxparentid->value }]
                [{ assign var=actproduct value=$product->getParentArticle() }]
                [{assign var="mainproductlink" value=$actproduct->getLink()}]
                [{ /if }]

                [{assign var="currentproduct" value=$oView->getLink()}]
                <ul class="variants det-variants" id="mdVariant_current">
                    [{foreach from=$actproduct->getVariants() item=variant}]
                    <li [{if $product->oxarticles__oxid->value == $variant->oxarticles__oxid->value}]class="current"[{/if}]><a href="[{$variant->getLink()}]" title="[{ $variant->oxarticles__oxvarselect->value }]">[{oxhasrights ident="SHOWARTICLEPRICE"}] [{ $variant->oxarticles__oxvarselect->value }] [{ $variant->getFPrice() }] [{ $currency->sign|strip_tags}]* [{/oxhasrights}]</a></li>
                    [{/foreach}]
                </ul>




                [{/if}]
                [{/if}]

            </div>
            </form>
                [{/if}]
            </div><!-- variants block ends -->


        </div> <!-- prod_breif ends -->
    </td>
    </tr>
    <br>
    [{oxhasrights ident="SHOWLONGDESCRIPTION"}]
    <tr>
        <td colspan="2" vaign="top">
            <div id="longdesc_box" class="longdesc_box">
                <div class="longdesc">
                    [{$product->getLongDesc()}]
                </div>
            </div>
        </td>
    </tr>
    [{/oxhasrights}]
    </table>
    </div>
