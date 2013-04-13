[{assign var="template_title" value="ACCOUNT_ORDER_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location="ACCOUNT_ORDER_LOCATION"|oxmultilangassign|cat:$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=account"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink }]
[{assign var="currency" value=$oView->getActCurrency() }]
<div id="content">
<!-- page locator -->
[{include file="inc/list_locator.tpl" sLocatorCaption="INC_LIST_LOCATOR_ORDERSPERPAGE"|oxmultilangassign }]


  [{if count($oView->getOrderList()) > 0 }]
  [{assign var=oArticleList value=$oView->getOrderArticleList()}]

    <div class="box info">
    <table class="form" width="100%">
  [{foreach from=$oView->getOrderList() item=order }]
 
    [{if $blShowLine }]
      <tr class="sep">
        <td colspan="3"></td>
      </tr>
     
    [{else }]
      [{assign var="blShowLine" value=true }][{/if }]
            <tr class="headrow">
              <th>[{ oxmultilang ident="ACCOUNT_ORDER_DATE" }]</th>
              <td width="5"></td>
              <td id="test_accOrderDate_[{$order->oxorder__oxordernr->value}]">[{ $order->oxorder__oxorderdate->value }]</td>
            </tr>
            <tr class="sep">
              <td colspan="3"></td>
            </tr>
            <tr>
              <th><b>[{ oxmultilang ident="ACCOUNT_ORDER_STATUS" }]</b></th>
              <td width="5"></td>
              <td id="test_accOrderStatus_[{$order->oxorder__oxordernr->value}]">
                [{if $order->oxorder__oxstorno->value}]
                  <span class="inlineSuccess">[{ oxmultilang ident="ACCOUNT_ORDER_STORNO" }]</span>
                [{elseif $order->oxorder__oxsenddate->value !="-" }]
                  <span class="done">[{ oxmultilang ident="ACCOUNT_ORDER_SHIPPED" }]</span>
                [{else }]
                  <span>[{ oxmultilang ident="ACCOUNT_ORDER_NOTSHIPPED" }]</span>
                [{/if }]              </td>
            </tr>
            <tr>
              <td colspan="3"></td>
            </tr>
            <tr>
               <th><b>[{ oxmultilang ident="ACCOUNT_ORDER_ORDERNO" }]</b></th>
               <td width="5"></td>
              <td id="test_accOrderNo_[{$order->oxorder__oxordernr->value}]">[{ $order->oxorder__oxordernr->value }]</td>
            </tr>
            <tr>
              <td colspan="3"></td>
            </tr>
             [{if $order->getShipmentTrackingUrl()}]
             
             <tr>
              <th><b>[{ oxmultilang ident="ACCOUNT_ORDER_TRACKINGID" }]</b></th>
              <td width="5"></td>
              <td id="test_accOrderTrack_[{$order->oxorder__oxordernr->value}]">
                  <a href="[{$order->getShipmentTrackingUrl()}]">[{ oxmultilang ident="ACCOUNT_ORDER_TRACKSHIPMENT" }]</a>
              </td>
            </tr>
            <tr>
              <td colspan="3"></td>
            </tr>
            [{/if }]
            
            <tr>
              <th><b>[{ oxmultilang ident="ACCOUNT_ORDER_SHIPMENTTO" }]</b></th>
              <td width="5"></td>
              <td id="test_accOrderName_[{$order->oxorder__oxordernr->value}]">
                [{if $order->oxorder__oxdellname->value }]
                  [{ $order->oxorder__oxdelfname->value }]
                  [{ $order->oxorder__oxdellname->value }]
                [{else }]
                  [{ $order->oxorder__oxbillfname->value }]
                  [{ $order->oxorder__oxbilllname->value }]
                [{/if }]
              </td>
            </tr>
            <tr class="sep">
              <td colspan="3"></td>
            </tr>
            <tr class="headrow">
              <th colspan="3">[{ oxmultilang ident="ACCOUNT_ORDER_CART" }]</th>
             </tr>
             [{foreach from=$order->getOrderArticles() item=orderitem name=testOrderItem}]
					[{assign var=sArticleId value=$orderitem->oxorderarticles__oxartid->value }]
					[{assign var=oArticle value=$oArticleList[$sArticleId] }]
            <tr>
              <td>
                [{ if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]<a id="test_accOrderLink_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ $oArticle->getLink() }]" class="artlink">[{/if }]
                [{ $orderitem->oxorderarticles__oxtitle->value }] [{ $orderitem->oxorderarticles__oxselvariant->value }]
                [{ if $oArticle->oxarticles__oxid->value && $oArticle->isVisible() }]</a>[{/if }]

                [{foreach key=sVar from=$orderitem->getPersParams() item=aParam}]
                    [{if $aParam }]
                    <br />[{ oxmultilang ident="ORDER_DETAILS" }]: [{$aParam}]
                    [{/if }]
                [{/foreach}]

            </td>
            <td width="5"></td>
            <td align="left" class="amount" id="test_accOrderAmount_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]">[{ $orderitem->oxorderarticles__oxamount->value }]</td>
              
              [{*<td align="right">
                 Commented due to Trusted Shops precertification. Enable if needed *}]
                [{*
                [{oxhasrights ident="TOBASKET"}]
                [{if $oArticle->isBuyable() }]
                  [{if $oArticle->oxarticles__oxid->value }]
                    <a  id="test_accOrderToBasket_[{$order->oxorder__oxordernr->value}]_[{$smarty.foreach.testOrderItem.iteration}]" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account_order" params="fnc=tobasket&amp;aid=`$oArticle->oxarticles__oxid->value`&amp;am=1" }]" class="tocart" rel="nofollow"></a>
                  [{/if }]
                [{/if }]
                [{/oxhasrights}]
               
              </td> *}]
            </tr>
            			
          [{/foreach }]
          <tr>
				<td><strong>[{ oxmultilang ident="ACCOUNT_ORDER_SUM" }]</strong></td>
				<td width="5"></td>
				<td><strong>[{$order->getFormattedTotalOrderSum()}]&nbsp;[{$currency->sign}]</strong></td>
           </tr>
      <tr><td colspan="3"><hr class="line"/></td></tr>
  [{/foreach }]
</table>
      </div>
  [{/if }]
  [{if !$blShowLine }]
	<div class="box">[{ oxmultilang ident="ACCOUNT_ORDER_EMPTYHISTORY" }]</div>
  [{/if }]


<!-- page locator -->
[{include file="inc/list_locator.tpl" sLocatorCaption="INC_LIST_LOCATOR_ORDERSPERPAGE"|oxmultilangassign }]
    </div>

[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=account"}]
