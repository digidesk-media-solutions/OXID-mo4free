[{assign var="template_title" value="BASKET_BASKET"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
<div id="content">
<!-- ordering steps -->
[{*include file="inc/steps_item.tpl" highlight=1 *}]
[{assign var="backurl" value=$oViewConf->getSelfLink()|cat:"cl=start" }]
[{include file="_titlesection.tpl" header="HEADER_BASKET"|oxmultilangassign back=$backurl}]
<div class="contMain">
[{assign var="currency" value=$oView->getActCurrency() }]
[{if !$oxcmp_basket->getProductsCount()  }]
    <div class="block tcenter info">[{ oxmultilang ident="BASKET_EMPTYSHIPPINGCART" }]</div><br/>

[{else }]

  [{*  <div class="bar prevnext order">
    [{if $oView->showBackToShop()}]
    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
      <div>
          [{ $oViewConf->getHiddenSid() }]
          <input type="hidden" name="cl" value="basket">
          <input type="hidden" name="fnc" value="backtoshop">
          <div class="left arrowdown">
              <input type="submit" value="[{ oxmultilang ident="BASKET_CONTINUESHOPPING" }]">
          </div>
      </div>
    </form>
    [{/if}]

  [{if $oView->isLowOrderPrice() }]
      <div class="minorderprice">[{ oxmultilang ident="BASKET_MINORDERPRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
    [{else}]
    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
      <div>
          [{ $oViewConf->getHiddenSid() }]
          <input type="hidden" name="cl" value="user">
          <div class="right arrowright">
              <input id="test_BasketNextStepTop" type="submit" class="btn-new" value="[{ oxmultilang ident="BASKET_NEXTSTEP" }]">
          </div>
      </div>
    </form>
    [{/if}]
  </div>*}]

<!-- basket contents -->
    <div>
         [{ $oViewConf->getHiddenSid() }]
         <input type="hidden" name="cl" value="basket">
         <input type="hidden" name="fnc" value="changebasket">
         <input type="hidden" name="CustomError" value='basket'>
    </div>
<div>
  <table class="basket product_notice" cellspacing="0" cellpadding="0" width="100%">
    <tbody>
    	[{assign var="basketitemlist" value=$oView->getBasketArticles() }]
	    [{foreach key=basketindex from=$oxcmp_basket->getContents() item=basketitem name=test_Contents}]    
	    [{assign var="basketproduct" value=$basketitemlist.$basketindex }]

		<tr class="basket_item [{if $smarty.foreach.test_Contents.last}]bask-last[{/if}]">
			<td class="prdct_pic" valign="top" align="center" width="100">
			<div class="img">
	          	 <a class="picture"  href="[{$basketproduct->getLink()}]" id="test_basketPic_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.test_Contents.iteration}]"  rel="nofollow">
		             <img src="[{ $basketproduct->getIconUrl() }]" alt="[{ $basketproduct->oxarticles__oxtitle->value|strip_tags }]">
		          </a>
		      </div>
			</td>
			<td>
				<table cellspacing="0" cellpadding="0" width="100%" class="tab-cart-contents">
					<tr>
						<td class="list-det">
						
						
						<h1><a class="prdct_title" id="test_basketTitle_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.test_Contents.iteration}]" rel="nofollow" href="[{ $basketproduct->getLink() }]">[{ $basketproduct->oxarticles__oxtitle->value }][{if $basketproduct->oxarticles__oxvarselect->value }], [{ $basketproduct->oxarticles__oxvarselect->value }][{/if}]</a>[{if $basketitem->isSkipDiscount() }]</h1>[{/if}]</td>
					</tr>
					<tr>
						<td class="list-det">
						 <span class="price">
							 [{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
							   [{ $basketitem->getFUnitPrice() }]&nbsp;[{ $currency->sign }]
                                [{assign var=dRegUnitPrice value=$basketitem->getRegularUnitPrice()}]
                                [{assign var=dUnitPrice value=$basketitem->getUnitPrice()}]
                                [{if $dRegUnitPrice->getPrice() > $dUnitPrice->getPrice() }]
                                    <br><s>[{ $basketitem->getFRegularUnitPrice() }]&nbsp;[{ $currency->sign}]</s>
                                [{/if}]
							 [{/if}]
						 </span>
						</td>
					</tr>
					<tr>
						<td class="amount list-det">
							[{assign var=form_name value="basket$basketindex" }]
							<form id="basket[{ $basketindex }]" name="basket[{ $basketindex }]" action="[{ $oViewConf->getSelfActionLink() }]" method="post" style="display: inline">
								[{ $oViewConf->getHiddenSid() }] 
								<input type="hidden" name="cl" value="basket"> 
								<input type="hidden" name="fnc" value="changebasket"> 
								<input type="hidden" name="CustomError" value='basket'> 
								<input type="hidden" name="aproducts[[{ $basketindex }]][aid]" value="[{ $basketproduct->oxarticles__oxid->value }]"> <input type="hidden" name="aproducts[[{ $basketindex }]][basketitemid]" value="[{ $basketindex }]"> 
								<input type="hidden" name="aproducts[[{ $basketindex }]][override]" value="1">
												
								[{if $basketitem->getdBundledAmount() > 0 && ($basketitem->isBundle() || $basketitem->isDiscountArticle()) }]
									<div id="test_basketAmount_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.test_Contents.iteration}]" align="center">+[{ $basketitem->getdBundledAmount() }]</div>
								[{/if}]
					
								[{if !$basketitem->isBundle() || !$basketitem->isDiscountArticle()}]
								  [{foreach key=sVar from=$basketitem->getPersParams() item=aParam }]
									<b>[{ $sVar }]:</b>&nbsp;<input type="text" name="aproducts[[{ $basketindex }]][persparam][[{ $sVar }]]" value="[{ $aParam }]"><br>
								  [{/foreach }]
								  
								  
								  [{include file="inc/menge_slct.tpl" name="aproducts"|cat:"["|cat:$basketindex|cat:"]"|cat:"[am]" amount=$basketitem->getAmount() }]
								  
								[{/if}]
								<input type="hidden" name="aproducts[[{ $basketindex }]][remove]" value="1">
							
								<input class="removeBtn"  name="removeBtn" value="" type="submit"/>
						</form>
						</td>
					</tr>
					<tr>
						<td>
							<div class="list-det">
							   [{if $basketitem->oProduct->getStockStatus() == -1}]
							   <span class="flag red"></span>
								 [{ if $basketitem->oProduct->oxarticles__oxnostocktext->value  }]
								   [{ $basketitem->oProduct->oxarticles__oxnostocktext->value  }]
								 [{elseif $oViewConf->getStockOffDefaultMessage() }]
								   [{ oxmultilang ident="WIDGET_PRODUCT_NO_STOCK" }]
								 [{/if}]
							
								 [{ if $basketitem->oProduct->getDeliveryDate() }]
								   <br>[{ oxmultilang ident="DETAILS_PERSPARAM_AVAILABLEON" }] [{ $basketitem->oProduct->getDeliveryDate() }]
								 [{/if}]
							
							   [{elseif $basketitem->oProduct->getStockStatus() == 1}]
									<span class="flag orange"></span>[{ oxmultilang ident="WIDGET_PRODUCT_LOW_STOCK" }]
								 
								 
							
							   [{elseif $basketitem->oProduct->getStockStatus() == 0}]
							
								<span class="flag green"></span>
							
								 [{ if $basketitem->oProduct->oxarticles__oxstocktext->value  }]
								   [{ $basketitem->oProduct->oxarticles__oxstocktext->value  }]
								 [{elseif $oViewConf->getStockOnDefaultMessage() }]
								  [{ oxmultilang ident="WIDGET_PRODUCT_IN_STOCK" }]
								 [{/if}]
							
							   [{/if}]
							 </div>
						</td>
					</tr>
		
					[{if $basketproduct->oxarticles__oxvpe->value > 1}]
					<tr class="notice">
						<td id="test_basket_VPE_[{ $basketproduct->oxarticles__oxid->value }]_[{$smarty.foreach.test_Contents.iteration}]" colspan="4">
						 [{ oxmultilang ident="BASKET_VPE_MESSAGE" }] [{ $basketproduct->oxarticles__oxvpe->value}]
						</td>
					</tr>
					[{/if}]
					[{foreach from=$Errors.basket item=oEr key=key }]
					[{if $oEr->getErrorClassType() == 'oxOutOfStockException'}]
					<!-- display only the exceptions for the current article-->
					   [{if $basketproduct->oxarticles__oxartnum->value == $oEr->getValue('articleNr') }]
						   <tr>
						 <td id="test_basket_StockError_[{ $basketproduct->oxarticles__oxid->value }]_[{$key}]" colspan="4">
							 <span class=err">[{ $oEr->getOxMessage() }] [{ $oEr->getValue('remainingAmount') }]</span>
						 </td>
						   </tr>
						[{/if}]
					 [{/if}]
					 [{if $oEr->getErrorClassType() == 'oxArticleInputException'}]
						[{if $basketproduct->oxarticles__oxartnum->value == $oEr->getValue('articleNr') }]
						<tr class="notice">
						 <td>
							 [{ $oEr->getOxMessage() }]
						 </td>
						   </tr>
						[{/if}]
					 [{/if}]
					 [{/foreach}]
		 		</table>
			</td>
		</tr>
		
	    <!--  basket items end  -->

	    [{/foreach }]
	    </tbody>
	</table>
</div>    
	    
	    
<div class="block">
<table class="basket-total product_notice" cellspacing="0" width="100%">
    <tbody>
	    <!--  basket summary  -->
	    [{if !$oxcmp_basket->getDiscounts() }]
	     <tr class="sumrow">
	       <td class="sumdesc">[{ oxmultilang ident="BASKET_TOTALNET" }]</td>
	       <td id="test_basketNet" class="price" align="right">[{ $oxcmp_basket->getProductsNetPrice() }]&nbsp;[{ $currency->sign }]</td>
	     </tr>
	     [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key }]
	     <tr class="sumrow">
	       <td class="sumdesc">[{ oxmultilang ident="BASKET_TAX1" }]&nbsp;[{ $key }][{ oxmultilang ident="BASKET_TAX2" }]</td>
	       <td id="test_basketVAT_[{$key}]" class="price" align="right">[{ $VATitem }]&nbsp;[{ $currency->sign }]</td>
	     </tr>
	     [{/foreach }]
	    [{/if }]
	
	    <tr class="sumrow">
	      <td class="sumdesc">[{ oxmultilang ident="BASKET_TOTALGROSS" }]</td>
	      <td id="test_basketGross" class="price" align="right">[{ $oxcmp_basket->getFProductsPrice() }]&nbsp;[{ $currency->sign }]</td>
	    </tr>
	
	    [{if $oxcmp_basket->getDiscounts() }]
	      [{foreach from=$oxcmp_basket->getDiscounts() item=oDiscount name=test_Discounts}]
	       <tr class="sumrow">
	         <td class="sumdesc discount">
	           <b class="fs11">[{if $oDiscount->dDiscount < 0 }][{ oxmultilang ident="BASKET_CHARGE" }][{else}][{ oxmultilang ident="BASKET_DISCOUNT2" }][{/if}]&nbsp;</b>
	           [{ $oDiscount->sDiscount }]:
	         </td>
	         <td class="price" id="test_basketDiscount_[{$smarty.foreach.test_Discounts.iteration}]" align="right">
	           [{if $oDiscount->dDiscount < 0 }][{ $oDiscount->fDiscount|replace:"-":"" }][{else}]-[{ $oDiscount->fDiscount }][{/if}]&nbsp;[{ $currency->sign }]
	         </td>
	       </tr>
	      [{/foreach }]
	      <tr class="sumrow">
	        <td class="sumdesc">[{ oxmultilang ident="BASKET_TOTALNET" }]</td>
	        <td  class="price" id="test_basketNet" align="right">[{ $oxcmp_basket->getProductsNetPrice() }]&nbsp;[{ $currency->sign }]</td>
	      </tr>
	      [{foreach from=$oxcmp_basket->getProductVats() item=VATitem key=key }]
	       <tr class="sumrow">
	         <td class="sumdesc">[{ oxmultilang ident="BASKET_TAX1" }][{ $key }][{ oxmultilang ident="BASKET_TAX2" }]</td>
	         <td class="price" id="test_basketVAT_[{$key}]" align="right">[{ $VATitem }]&nbsp;[{ $currency->sign }]</td>
	       </tr>
	      [{/foreach }]
	    [{/if }]
	
	    [{if $oxcmp_basket->getVoucherDiscValue() }]
	      [{foreach from=$oxcmp_basket->getVouchers() item=sVoucher key=key name=Voucher}]
	        <tr class="sumrow">
	          <td class="coupon">
	            <b class="fs11">&nbsp;&nbsp;[{ oxmultilang ident="BASKET_COUPON" }]</b>&nbsp;
	            <span id="test_basketVoucher_[{$smarty.foreach.Voucher.iteration}]">([{ oxmultilang ident="BASKET_NOMBER" }] [{ $sVoucher->sVoucherNr }])</span>:
	            &nbsp;&nbsp;<div class="frombasket">
	            <a id="test_basketVoucherRemove_[{$smarty.foreach.Voucher.iteration}]" href="[{ $oViewConf->getSelfLink() }]&amp;cl=basket&amp;fnc=removeVoucher&amp;voucherId=[{ $sVoucher->sVoucherId }]&amp;CustomError=basket" class="" rel="nofollow">[{ oxmultilang ident="BASKET_REMOVE2" }]</a>
	            </div>
	          </td>
	          <td class="price" align="right">
	            <span id="test_basketVoucherDiscount_[{$smarty.foreach.Voucher.iteration}]">-
	            [{ $sVoucher->fVoucherdiscount }]&nbsp;
	            [{ $currency->sign }]</span>
	          </td>
	        </tr>
	      [{/foreach }]
	    [{/if }]
	[{if $oxcmp_basket->getFDeliveryCosts() }]
	      <tr class="sumrow">
	        <td class="sumdesc">[{if $oxcmp_basket->getDelCostVat() }][{ oxmultilang ident="BASKET_SHIPPINGNET" }][{else}][{ oxmultilang ident="BASKET_SHIPPING" }][{/if }]</td>
	        <td class="price" id="test_basketDeliveryNet" align="right">[{ $oxcmp_basket->getFDeliveryCosts() }]&nbsp;[{ $currency->sign }]</td>
	      </tr>
	  [{/if}]
	    [{if $oxcmp_basket->getDelCostVat() }]
	      <tr class="sumrow">
	        <td class="sumdesc">[{ oxmultilang ident="BASKET_PLUSTAX1" }] [{ $oxcmp_basket->getFDeliveryCostsPercent() }][{ oxmultilang ident="BASKET_PLUSTAX2" }]</td>
	        <td class="price" id="test_basketDeliveryVAT" align="right">[{ $oxcmp_basket->getFDeliveryCosts() }]&nbsp;[{ $currency->sign }]</td>
	      </tr>
	    [{/if }]
	
	    [{if $oxcmp_basket->getPaymentCosts() }]
	      <tr class="sumrow">
	        <td class="sumdesc">[{if $oxcmp_basket->getFPaymentCosts() >= 0}][{ oxmultilang ident="BASKET_PAYMENT" }][{else}][{ oxmultilang ident="BASKET_CHARGE2" }][{/if}] [{ oxmultilang ident="BASKET_DISCOUNT3" }]</td>
	        <td class="price" id="test_basketPaymentNet" align="right">[{ $oxcmp_basket->getFPaymentCosts() }]&nbsp;[{ $currency->sign }]</td>
	      </tr>
	      [{if $oxcmp_basket->getPayCostVat() }]
	        <tr class="sumrow">
	          <td class="sumdesc">[{ oxmultilang ident="BASKET_PAYMENTTAX1" }][{ $oxcmp_basket->getFPaymentCostsVatPercent() }][{ oxmultilang ident="BASKET_PAYMENTTAX2" }]</td>
	          <td class="price" id="test_basketPaymentVAT" align="right">[{ $oxcmp_basket->getFPaymentCosts() }]&nbsp;[{ $currency->sign }]</td>
	        </tr>
	      [{/if }]
	    [{/if }]
	
	    [{ if $oxcmp_basket->getWrappCostNet() }]
	        <tr class="sumrow">
	          <td class="sumdesc">[{if $oxcmp_basket->getWrappCostVat() }][{ oxmultilang ident="ORDER_WRAPPINGNET" }][{else}][{ oxmultilang ident="ORDER_WRAPPINGGROSS1" }][{/if}]</td>
	          <td class="price" id="test_basketWrappNet" align="right">[{ $oxcmp_basket->getWrappCostNet() }] [{ $currency->sign}]</td>
	        </tr>
	      [{if $oxcmp_basket->getWrappCostVat() }]
	        <tr class="sumrow">
	          <td class="sumdesc">[{ oxmultilang ident="ORDER_WRAPPINGTAX1" }] [{ $oxcmp_basket->getWrappCostVatPercent() }][{ oxmultilang ident="ORDER_WRAPPINGTAX2" }]</td>
	          <td class="price" id="test_basketWrappVat" align="right">[{ $oxcmp_basket->getWrappCostVat() }] [{ $currency->sign}]</td>
	        </tr>
	      [{/if}]
	    [{/if}]
	    <tr class="sumrow total">
	      <td class="sumdesc"><b>[{ oxmultilang ident="BASKET_GRANDTOTAL" }]</b></td>
	      <td class="price" id="test_basketGrandTotal" align="right"><b>[{ $oxcmp_basket->getFPrice() }]&nbsp;[{ $currency->sign }]</b></td>
	    </tr>
	
	    [{if $oxcmp_basket->hasSkipedDiscount() }]
	      <tr class="sumrow">
	        <td colspan="2" align="list-det"><span id="SkipDiscounts_link"><span class="note">**</span> [{ oxmultilang ident="BASKET_DISCOUNTS_NOT_APPLIED_FOR_ARTICLES" }]</span></td>
	      </tr>
	    [{/if}]
    </tbody>
  </table>  
</div>	    
[{include file="_footer_basket.tpl" nextStep=$oxcmp_basket->getProductsCount()}]
[{/if }]

</div>

[{insert name="oxid_tracker" title=$template_title }]
</div>
[{include file="_footer.tpl"}]
