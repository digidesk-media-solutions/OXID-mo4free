[{assign var="template_title" value="ORDER_COMPLETEORDER"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
<!-- ordering steps -->
[{*include file="inc/steps_item.tpl" highlight=4*}]
 [{assign var="newurl" value=$oViewConf->getSslSelfLink()|cat:"cl=payment&continue=1"}]
[{include file="_titlesection.tpl" header="ORDER_VERIFYYOURINPUT"|oxmultilangassign back=$newurl }]
<div id="content">
    <div class="contMain">
[{ if $oView->isConfirmAGBActive() && $oView->isConfirmAGBError() == 1 }]
    <div class="box errorbox error">[{ oxmultilang ident="ORDER_READANDCONFIRMTERMS" }]</div>
[{/if}]

[{ if !$oxcmp_basket->getProductsCount()  }]
  <div class="box error msg">[{ oxmultilang ident="ORDER_BASKETEMPTY" }]</div>
[{else}]
[{assign var="currency" value=$oView->getActCurrency() }]

  [{if $oView->isLowOrderPrice()}]
      <div class="box bar prevnext order">
        <div class="minorderprice">[{ oxmultilang ident="BASKET_MINORDERPRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
      </div>
  [{else}]
    [{if $oView->showOrderButtonOnTop()}]
      <div class="box bar prevnext terms">
        <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
          <div>
              [{ $oViewConf->getHiddenSid() }]
              [{ $oViewConf->getNavFormParams() }]
              <input type="hidden" name="cl" value="order">
              <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
              <input type="hidden" name="challenge" value="[{$challenge}]">
              [{ if $oView|method_exists:"getDeliveryAddressMD5" }]
                  <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
              [{ /if }]
              <div class="right arrowright">
                  <input id="test_OrderSubmitTop" type="submit" value="[{ oxmultilang ident="ORDER_SUBMITORDER" }]">
              </div>
              [{if $oView->isConfirmAGBActive() }]
                <div class="termsconfirm">
                    <input type="hidden" name="ord_agb" value="0">
                    <table>
                      <tr>
                        <td><input id="test_OrderConfirmAGBTop" type="checkbox" class="chk" name="ord_agb" value="1"></td>
                        <td>
                            [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                              [{ $oContent->oxcontents__oxcontent->value }]
                            [{/oxifcontent}]
                        </td>
                      </tr>
                    </table>
                </div>
              [{/if}]
          </div>
        </form>
      </div>
    [{/if}]
  [{/if}]

[{ if $oViewConf->getShowVouchers() && $oxcmp_basket->getVouchers()}]
<strong class="boxhead">[{ oxmultilang ident="ORDER_USEDCOUPONS" }]</strong>
<div class="box info">
    [{foreach from=$Errors.basket item=oEr key=key }]
    [{if $oEr->getErrorClassType() == 'oxVoucherException'}]
        <span class="err">[{ oxmultilang ident="BASKET_COUPONNOTACCEPTED1" }] [{ $oEr->getValue('voucherNr') }] [{ oxmultilang ident="BASKET_COUPONNOTACCEPTED2" }]</span><br>
        <span class="err">[{ oxmultilang ident="BASKET_REASON" }]</span>
        <span class="err">[{ $oEr->getOxMessage() }]</span><br>
        [{/if}]
    [{/foreach}]
    [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=aVouchers}]
    <span id="test_orderVouchersUsed_[{$smarty.foreach.aVouchers.iteration}]">[{ $sVoucher->sVoucherNr }]</span><br>
    [{/foreach }]
</div>
[{/if}]

<!--<strong class="boxhead">[{ oxmultilang ident="ORDER_SEND" }]</strong>-->
<div class="titleSec"><span class="titlelbl"><strong>[{ oxmultilang ident="ORDER_BILLINGADDRESS" }]</strong></span></div>
<div class="box info">


    <div>
        [{ oxmultilang ident="ORDER_EMAIL" }]&nbsp;[{ $oxcmp_user->oxuser__oxusername->value }]<br>
        [{if $oxcmp_user->oxuser__oxcompany->value }] [{ $oxcmp_user->oxuser__oxcompany->value }]&nbsp;<br> [{/if}]
        [{ $oxcmp_user->oxuser__oxsal->value|oxmultilangsal}]&nbsp;[{ $oxcmp_user->oxuser__oxfname->value }]&nbsp;[{ $oxcmp_user->oxuser__oxlname->value }]<br>
        [{if $oxcmp_user->oxuser__oxaddinfo->value }] [{ $oxcmp_user->oxuser__oxaddinfo->value }]<br> [{/if}]
        [{ $oxcmp_user->oxuser__oxstreet->value }]&nbsp;[{ $oxcmp_user->oxuser__oxstreetnr->value }]<br>
        [{ $oxcmp_user->getState() }]
        [{ $oxcmp_user->oxuser__oxzip->value }]&nbsp;[{ $oxcmp_user->oxuser__oxcity->value }]<br>
        [{ $oxcmp_user->oxuser__oxcountry->value }]<br><br>
        [{if $oxcmp_user->oxuser__oxfon->value }] [{ oxmultilang ident="ORDER_PHONE" }] [{ $oxcmp_user->oxuser__oxfon->value }]&nbsp;<br> [{/if}]
        <br>
        <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="fnc" value="">
                <span><input id="test_orderChangeBillAdress" type="submit" value="[{ oxmultilang ident="ORDER_MODIFYADDRESS2" }]" class="btn-new"></span>
            </div>
        </form>
    </div>
</div>

[{assign var="oDelAdress" value=$oView->getDelAddress() }]
[{if $DelAdress}]
<div class="titleSec"><span class="titlelbl"><strong>[{ oxmultilang ident="ORDER_SHIPPINGADDRESS" }]</strong></span></div>
<div class="box info">
    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
        <div>
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="user">
            <input type="hidden" name="fnc" value="">
            <span><input id="test_orderChangeShipAdress" type="submit" value="[{ oxmultilang ident="ORDER_MODIFYADDRESS2" }]" class="btn-new"></span>
        </div>
    </form>
    <br>

    [{if $oDelAdress }]
    <br>
    [{if $oDelAdress->oxaddress__oxcompany->value }] [{ $oDelAdress->oxaddress__oxcompany->value }]&nbsp;<br> [{/if}]
    [{ $oDelAdress->oxaddress__oxsal->value|oxmultilangsal}]&nbsp;[{ $oDelAdress->oxaddress__oxfname->value }]&nbsp;[{ $oDelAdress->oxaddress__oxlname->value }]<br>
    [{if $oDelAdress->oxaddress__oxaddinfo->value }] [{ $oDelAdress->oxaddress__oxaddinfo->value }]<br> [{/if}]
    [{ $oDelAdress->oxaddress__oxstreet->value }]&nbsp;[{ $oDelAdress->oxaddress__oxstreetnr->value }]<br>
    [{ $oDelAdress->getState() }]
    [{ $oDelAdress->oxaddress__oxzip->value }]&nbsp;[{ $oDelAdress->oxaddress__oxcity->value }]<br>
    [{ $oDelAdress->oxaddress__oxcountry->value }]<br><br>
    [{if $oDelAdress->oxaddress__oxfon->value }] [{ oxmultilang ident="ORDER_PHONE2" }] [{ $oDelAdress->oxaddress__oxfon->value }]&nbsp;<br>[{/if}]
    [{/if}]
</div>
[{/if}]

[{assign var="orderreview" value=$oView->getOrderRemark() }]
[{if $orderreview}]
<div class="box info">
    <b>[{ oxmultilang ident="ORDER_WHATIWANTEDTOSAY" }]</b></div>
<div class="box">
    [{ $orderreview }]</div>
[{/if}]



<div class="titleSec"><span class="titlelbl"><strong>[{ oxmultilang ident="ORDER_SHIPPINGCARRIER" }]</strong></span></div>

<div class="box info">
    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
        <div  id="test_orderShipping">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="payment">
            <input type="hidden" name="fnc" value="">
            [{assign var="oShipSet" value=$oView->getShipSet() }]
            <b>[{ $oShipSet->oxdeliveryset__oxtitle->value }]</b>&nbsp;<br/><span><input id="test_orderChangeShipping" type="submit" value="[{ oxmultilang ident="ORDER_MODIFY3" }]" class="btn-new"></span>
        </div>
    </form>
</div>



<div class="titleSec"><span class="titlelbl"><strong>[{ oxmultilang ident="ORDER_PAYMENTMETHOD" }]</strong></span></div>

<div class="box info">
    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
        <div  id="test_orderPayment">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="payment">
            <input type="hidden" name="fnc" value="">
            [{assign var="payment" value=$oView->getPayment() }]
            [{ $payment->oxpayments__oxdesc->value }]&nbsp;<br/><span><input id="test_orderChangePayment" type="submit" value="[{ oxmultilang ident="ORDER_MODIFY2" }]" class="btn-new"></span>
        </div>
    </form>
</div>

<!-- basket contents -->
<div class="box">
  <table class="basket" width="100%">

     <!-- basket header -->
      <thead>
        <tr>
            <th align="left">[{ oxmultilang ident="ORDER_ARTICLE" }]</th>
            <!-- <th align="left">[{if $oView->isWrapping() }][{ oxmultilang ident="ORDER_GIFTOPTION" }][{/if}]</th>
            <th align="right">[{ oxmultilang ident="ORDER_UNITPRICE" }]</th>-->
            <th align="right">[{ oxmultilang ident="ORDER_QUANTITY" }]</th>
            <!--<th align="right">[{ oxmultilang ident="ORDER_TAX" }]</th>-->
            <th align="right">[{ oxmultilang ident="ORDER_TOTAL" }]</th>
            <!--<th class="lastcol"></th>-->
        </tr>
      </thead>

      <!-- basket items -->
      [{assign var="basketitemlist" value=$oView->getBasketArticles() }]
      [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=testArt}]
      [{assign var="basketproduct" value=$basketitemlist.$basketindex }]
        <tr>
          <!-- product image -->
          <td>
              <div class="art_title"><a id="test_orderUrl_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" rel="nofollow" href="[{ $basketproduct->getLink() }]">[{ $basketproduct->oxarticles__oxtitle->value }][{if $basketproduct->oxarticles__oxvarselect->value }], [{ $basketproduct->oxarticles__oxvarselect->value }][{/if }]</a>[{if $basketitem->isSkipDiscount() }] <sup><a rel="nofollow" href="#SkipDiscounts_link" class="note">**</a></sup>[{/if}]</div>
              <div class="art_num" id="test_orderArtNo_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]">[{ oxmultilang ident="ORDER_ARTICLENOMBER" }] [{ $basketproduct->oxarticles__oxartnum->value }]</div>

            [{if $basketitem->isBundle() }]
            [{else}]
                [{foreach from=$basketitem->getChosenSelList() item=oList}]
                  [{ $oList->name }] : [{ $oList->value }]<br>
                [{/foreach}]
            [{/if}]
              <a id="test_orderPic_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" class="picture" href="[{ $basketproduct->getLink() }]">
                <img src="[{$basketproduct->getIconUrl()}]" alt="[{ $basketproduct->oxarticles__oxtitle->value|strip_tags }]">
              </a>
          </td>

             

          <!-- product quantity manager -->
          [{*
          <td>
            [{if $oView->isWrapping() }]
              [{ if !$basketitem->getWrappingId() }]
                [{ oxmultilang ident="ORDER_NONE" }]<br />
              [{else}]
                [{assign var="oWrap" value=$basketitem->getWrapping() }]
                [{$oWrap->oxwrapping__oxname->value}]<br />
              [{/if}]
              <span class="wrapmod">
                  <a id="test_orderWrapp_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=wrapping" params="aid="|cat:$basketitem->getProductId() }]" title="[{ oxmultilang ident="ORDER_MODIFYALT" }]">[{ oxmultilang ident="ORDER_MODIFY" }]</a>
              </span>
            [{/if}]
          </td>
          
          

          <!-- product price -->
          <td id="test_orderUnitPrice_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" class="orderprice" align="right">
            [{if $basketitem->getFUnitPrice() }][{ $basketitem->getFUnitPrice() }]&nbsp;[{ $currency->sign}][{/if}]
          </td>
          
          *}]

          <!-- product count -->
          <td id="test_orderUnitCount_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" class="amount" align="right">
            [{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle()) }]
             <b class="note">+[{ $basketitem->getdBundledAmount() }]</b>
            [{else}]
             [{ $basketitem->getAmount() }]&nbsp;
            [{/if}]
          </td>

        [{*
          <!-- product VAT percent -->
          <td align="right" id="test_orderUnitVat_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" class="vat_order">
            [{ $basketitem->getVatPercent()}]%
          </td>
          
          *}]

          <!-- product quantity * price -->
          <td id="test_orderTotalPrice_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.testArt.iteration}]" align="right" class="totalprice">
            [{ $basketitem->getFTotalPrice() }]&nbsp;[{ $currency->sign}]
          </td>
          
        </tr>
        
        [{foreach key=sVar from=$basketitem->getPersParams() item=aParam name=orderPersParam}]
          <tr>
            <td class="brd"></td>
            <td id="test_orderPersParam_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.orderPersParam.iteration}]" colspan="7">[{ oxmultilang ident="ORDER_DETAILS" }]: <input type="text" name="persparam[[{$sVar}]]" value="[{$aParam}]" readonly disabled></td>
            <td></td>
          </tr>
        [{/foreach}]

      [{foreach from=$Errors.basket item=oEr key=key name=orderErrors}]
       [{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
       <!-- display only the excpetions for the current article-->
           [{if $basketitem->getProductId() == $oEr->getValue('productId') }]
           <tr>
             <td class="brd"></td>
             <td id="test_orderErrors_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.orderErrors.iteration}]" colspan="7"><span class="err">[{ $oEr->getOxMessage() }] [{ $oEr->getValue('remainingAmount') }]</span></td>
             <td></td>
           </tr>
           [{/if}]
        [{/if}]
        [{/foreach}]

        [{*<tr class="bsk_sep"><td class="brd"></td><td colspan="7" class="line"></td><td></td></tr>*}]
      <!--  basket items end  -->
      [{/foreach}]
        </table></div><div class="box">
        <table width="100%"> 

      [{ if $oViewConf->getShowGiftWrapping() }]
      [{assign var="oCard" value=$oxcmp_basket->getCard() }]
      [{ if $oCard }]
        <tr class="sumrow">
          <td class="brd"></td>
          <td id="test_orderCardTitle" colspan="3"><b class="fs10">[{ oxmultilang ident="ORDER_GREETINGCARD" }] "[{ $oCard->oxwrapping__oxname->value }]"</b></td>
          <td id="test_orderCardPrice" align="right" class="orderprice">[{ $oCard->getFPrice() }]&nbsp;[{ $currency->sign }]</td>
          <td></td>
          <td class="vat_order">[{if $oxcmp_basket->getWrappCostVat() }][{ $oxcmp_basket->getWrappCostVatPercent() }]%[{/if}]</td>
          <td id="test_orderCardTotalPrice" align="right" class="totalprice">[{ $oCard->getFPrice() }]&nbsp;[{ $currency->sign }]</td>
          <td></td>
        </tr>
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="7"><b class="fs10">[{ oxmultilang ident="ORDER_YOURMESSAGE" }]</b></td>
          <td></td>
        </tr>
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="7"><div id="test_orderCardText" class="fs10">[{ $oxcmp_basket->getCardMessage()|nl2br }]</div></td>
          <td></td>
        </tr>
        <tr class="bsk_sep"><td class="brd"></td><td colspan="7" class="line"></td><td></td></tr>
      [{/if}]
      [{/if}]

      [{if !$oxcmp_basket->getDiscounts() }]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_TOTALNET" }]</td>
          <td id="test_orderNetPrice" align="right">[{ $oxcmp_basket->getProductsNetPrice() }]&nbsp;[{ $currency->sign}]</td>
          <td></td>
        </tr>

        [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key}]
          <tr class="sumrow">
            <td class="brd"></td>
            <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_PLUSTAX1" }] [{ $key }][{ oxmultilang ident="ORDER_PLUSTAX2" }]</td>
            <td id="test_orderVat_[{ $key }]" align="right">[{ $VATitem }]&nbsp;[{ $currency->sign}]</td>
            <td></td>
          </tr>
        [{/foreach}]
      [{/if}]

      <tr class="sumrow">
        <td class="brd"></td>
        <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_TOTALGROSS" }]</td>
        <td id="test_orderGrossPrice" align="right">[{ $oxcmp_basket->getFProductsPrice() }]&nbsp;[{ $currency->sign}]</td>
        <td></td>
      </tr>

      [{ if $oxcmp_basket->getDiscounts() }]
        <tr class="bsk_sep"><td class="brd"></td><td colspan="7" class="line"></td><td></td></tr>
        [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=orderDiscounts}]
        <tr class="sumrow">
          <td class="brd"></td>
          <td id="test_orderDiscountTitle_[{$smarty.foreach.orderDiscounts.iteration}]" colspan="6" class="sumdesc discount">
            <b class="fs11">[{if $oDiscount->dDiscount < 0 }][{ oxmultilang ident="ORDER_CHARGE" }][{else}][{ oxmultilang ident="ORDER_DISCOUNT" }][{/if}] </b>
            [{ $oDiscount->sDiscount }]:
          </td>
          <td id="test_orderDiscount_[{$smarty.foreach.orderDiscounts.iteration}]" align="right">
            [{if $oDiscount->dDiscount < 0 }][{ $oDiscount->fDiscount|replace:"-":"" }][{else}]-[{ $oDiscount->fDiscount }][{/if}]&nbsp;[{ $currency->sign}]
          </td>
          <td></td>
        </tr>
        [{/foreach}]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_TOTALNET" }]</td>
          <td id="test_orderNetPrice" align="right">[{ $oxcmp_basket->getProductsNetPrice() }]&nbsp;[{ $currency->sign}]</td>
          <td></td>
        </tr>

        [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key name=orderVats}]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_PLUSTAX1" }] [{ $key }][{ oxmultilang ident="ORDER_PLUSTAX2" }]</td>
          <td id="test_orderVat_[{ $key }]" align="right">[{ $VATitem }]&nbsp;[{ $currency->sign}]</td>
          <td></td>
        </tr>
        [{/foreach}]
      [{/if}]

      [{if $oViewConf->getShowVouchers() && $oxcmp_basket->getVoucherDiscValue() }]
        <tr class="bsk_sep"><td class="brd"></td><td colspan="7" class="line"></td><td></td></tr>
        [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=orderVouchers}]
          <tr>
            <td class="brd"></td>
            <td id="test_orderVoucherNr_[{$smarty.foreach.orderVouchers.iteration}]" colspan="6" class="sumdesc coupon">
              <b class="fs11">&nbsp;&nbsp;[{ oxmultilang ident="ORDER_COUPON" }]</b>
              [{ oxmultilang ident="ORDER_NOMBER" }] [{ $sVoucher->sVoucherNr }]):
            </td>
            <td id="test_orderVoucher_[{$smarty.foreach.orderVouchers.iteration}]" align="right">-[{ $sVoucher->fVoucherdiscount }]&nbsp;[{ $currency->sign}]</td>
            <td></td>
          </tr>
        [{/foreach }]
      [{/if}]
      [{if $oxcmp_basket->getDeliveryCosts() }]
      <tr class="bsk_sep"><td class="brd"></td><td colspan="7" class="line"></td><td></td></tr>
      <tr class="sumrow">
        <td class="brd"></td>
        <td colspan="6" class="sumdesc">[{if $oxcmp_basket->getDelCostVat() }][{ oxmultilang ident="ORDER_SHIPPINGNET" }][{else}][{ oxmultilang ident="ORDER_SHIPPINGGROSS1" }][{/if}]</td>
        <td id="test_orderShippingNet" align="right">[{ $oxcmp_basket->getDelCostNet() }]&nbsp;[{ $currency->sign}]</td>
        <td></td>
      </tr>
      [{/if}]
      [{if $oxcmp_basket->getDelCostVat()}]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_PLUSSHIPPINGTAX1" }] [{ $oxcmp_basket->getDelCostVatPercent() }][{ oxmultilang ident="ORDER_PLUSSHIPPINGTAX2" }]</td>
          <td id="test_orderShippingVat" align="right">[{ $oxcmp_basket->getDelCostVat() }]&nbsp;[{ $currency->sign}]</td>
          <td></td>
        </tr>
      [{/if}]

      [{if $oxcmp_basket->getPaymentCosts() }]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{if $oxcmp_basket->getPaymentCosts() >= 0 }][{ oxmultilang ident="ORDER_PAYMENT1" }][{else}][{ oxmultilang ident="ORDER_PAYMENT2" }][{/if}] [{ oxmultilang ident="ORDER_PAYMENT3" }]</td>
          <td id="test_orderPaymentNet" align="right">[{ $oxcmp_basket->getPayCostNet() }]&nbsp;[{ $currency->sign}]</td>
          <td></td>
        </tr>
        [{if $oxcmp_basket->getPayCostVat() }]
          <tr class="sumrow">
            <td class="brd"></td>
            <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_PAYMENTCHARGETAX1" }] [{ $oxcmp_basket->getPayCostVatPercent()}][{ oxmultilang ident="ORDER_PAYMENTCHARGETAX2" }]</td>
            <td id="test_orderPaymentVat" align="right">[{ $oxcmp_basket->getPayCostVat() }]&nbsp;[{ $currency->sign}]</td>
            <td></td>
          </tr>
        [{/if}]
      [{/if}]

      [{if $oxcmp_basket->getTsProtectionCosts() }]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_TSPROTECTION" }]</td>
          <td id="test_orderTsProtectionNet" align="right">[{ $oxcmp_basket->getTsProtectionNet() }]&nbsp;[{ $currency->sign}]</td>
          <td></td>
        </tr>
        [{if $oxcmp_basket->getTsProtectionVat() }]
          <tr class="sumrow">
            <td class="brd"></td>
            <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_TSPROTECTIONCHARGETAX1" }] [{ $oxcmp_basket->getTsProtectionVatPercent()}][{ oxmultilang ident="ORDER_TSPROTECTIONCHARGETAX2" }]</td>
            <td id="test_orderTsProtectionVat" align="right">[{ $oxcmp_basket->getTsProtectionVat() }]&nbsp;[{ $currency->sign}]</td>
            <td></td>
          </tr>
        [{/if}]
      [{/if}]

      [{if $oViewConf->getShowGiftWrapping() && $oxcmp_basket->getWrappCostNet() }]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="6" class="sumdesc">[{if $oxcmp_basket->getWrappCostVat() }][{ oxmultilang ident="ORDER_WRAPPINGNET" }][{else}][{ oxmultilang ident="ORDER_WRAPPINGGROSS1" }][{/if}]</td>
          <td id="test_orderWrappNet" align="right">[{ $oxcmp_basket->getWrappCostNet() }] [{ $currency->sign}]</td>
          <td></td>
        </tr>
        [{if $oxcmp_basket->getWrappCostVat() }]
          <tr class="sumrow">
            <td class="brd"></td>
            <td colspan="6" class="sumdesc">[{ oxmultilang ident="ORDER_WRAPPINGTAX1" }] [{ $oxcmp_basket->getWrappCostVatPercent() }][{ oxmultilang ident="ORDER_WRAPPINGTAX2" }]</td>
            <td id="test_orderWrappVat" align="right">[{ $oxcmp_basket->getWrappCostVat() }] [{ $currency->sign}]</td>
            <td></td>
          </tr>
        [{/if}]
      [{/if}]

      <tr class="bsk_sep"><td class="brd"></td><td colspan="7" class="line"></td><td></td></tr>

      <tr class="sumrow total">
        <td class="brd"></td>
        <td colspan="6" class="sumdesc"><b>[{ oxmultilang ident="ORDER_GRANDTOTAL" }]</b></td>
        <td id="test_orderGrandTotal" align="right"><b>[{ $oxcmp_basket->getFPrice() }]&nbsp;[{ $currency->sign}]</b></td>
        <td></td>
      </tr>
      <tr class="bsk_sep">
        <td class="brd"></td>
        <td colspan="7" class="bigline"></td>
        <td></td>
      </tr>

      [{if $oxcmp_basket->hasSkipedDiscount() }]
        <tr class="sumrow">
          <td class="brd"></td>
          <td colspan="7"><span id="SkipDiscounts_link"><span class="note">**</span> [{ oxmultilang ident="ORDER_DISCOUNTS_NOT_APPLIED_FOR_ARTICLES" }]</span></td>
          <td></td>
        </tr>
      [{/if}]

      <tr class="sumrow">
        <td colspan="9" class="brd bottrow"></td>
      </tr>
    </table>
    </div>

        [{if $oView->isLowOrderPrice() }]
          <div class="box bar prevnext order">
            <div class="minorderprice">[{ oxmultilang ident="BASKET_MINORDERPRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
          </div>
        [{else}]
         
          <div class="bar prevnext terms">
            <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
            <div class="box info">
                [{if $oView->isActive('PsLogin') }]
                    <input type="hidden" name="ord_agb" value="1">
                  [{else}]
                    [{if $oView->isConfirmAGBActive()}]
                    <div class="termsconfirm">
                        <input type="hidden" name="ord_agb" value="0">
                        <table width="100%">
                          <tr>
                            <td><input id="test_OrderConfirmAGBBottom" type="checkbox" class="chk" name="ord_agb" value="1"></td>
                            <td>
                                [{oxifcontent ident="oxrighttocancellegend" object="oContent"}]
                                  [{ $oContent->oxcontents__oxcontent->value }]
                                [{/oxifcontent}]
                            </td>
                          </tr>
                        </table>
                    </div>
                    [{/if}]
                  [{/if}]
            </div>
           
              <div class="box info">
                  [{ $oViewConf->getHiddenSid() }]
                  [{ $oViewConf->getNavFormParams() }]
                  <input type="hidden" name="cl" value="order">
                  <input type="hidden" name="fnc" value="[{$oView->getExecuteFnc()}]">
                  <input type="hidden" name="challenge" value="[{$challenge}]">
                  [{ if $oView|method_exists:"getDeliveryAddressMD5" }]
                      <input type="hidden" name="sDeliveryAddressMD5" value="[{$oView->getDeliveryAddressMD5()}]">
                  [{ /if }]
                  <div class="btns">
	                    <div class="prev_step_on">
	                            <a href="[{$newurl}]" class="three-line btn-new">[{ oxmultilang ident="CHECKOUT_PAYMENT" }]</a>
                        </div>
                        <div class="next_step_on">
                    <input id="test_OrderSubmitBottom" type="submit" class="btn-new" value="[{ oxmultilang ident="ORDER_SUBMITORDER" }]">
           
        
          		
                    </div>
                </div>
                    

                  

              </div>
            </form>
          </div>
        [{/if}]

    &nbsp;
    <br><br><br>

[{/if}]
</div>
</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
