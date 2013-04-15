[{assign var="currency" value=$oView->getActCurrency()}]
<div class="block-list [{if $noBrd==true}] noBrd[{/if}]">
	<a href="[{ $product->getLink() }]">
	<table class="product_notice" cellspacing="0" cellpadding="0">
	  <tr>
	    <td rowspan="3" class="prdct_pic" valign="top" width="60" align="center">
	    	<div class="img">
	          	<div>
		          <a href="[{ $product->getLink() }]"  class="picture"[{if $oView->noIndex() }] rel="nofollow"[{/if}]>
				     <img src="[{$product->getIconUrl() }]" alt="[{ $product->oxarticles__oxtitle->value|strip_tags }] [{ $product->oxarticles__oxvarselect->value|default:'' }]">
				  </a>
		        </div>
	        </div>
	    </td>
	    <td width="10">&nbsp;</td>
	    <td colspan="2" class="price_col tright">
			<h1><a class="prdct_title" href="[{ $product->getLink()}]"[{if $oView->noIndex() }] rel="nofollow"[{/if}]>[{$product->oxarticles__oxtitle->value}] [{$product->oxarticles__oxvarselect->value}]</a></h1>
	    </td>
	  </tr>
	  <tr>
		<td width="10">&nbsp;</td>
		<td align="left">
	    	
	    	[{if $product->getFTPrice()}] <span class="old">[{ oxmultilang ident="DETAILS_PERSPARAM_REDUCEDFROM" }] <del>[{ $product->getFTPrice()}] [{ $currency->sign}]</del></span>
	    	<span>[{ oxmultilang ident="DETAILS_PERSPARAM_NOWONLY" }]</span>
	    	[{/if}]
			
			[{if !$product->isParentNotBuyable() }]
				<span class="price">[{ $product->getFPrice() }] [{ $currency->sign}]*</span>
            [{else}]
				
				<span class="price">ab [{ $product->getFVarMinPrice() }] [{ $currency->sign}]*</span>
			[{/if}]
			
	    	[{*[{if $product->getFPrice()}]
				<span class="price">[{ $product->getFPrice() }] [{ $currency->sign}]*</span>
	        [{/if}]*}]
			</td>
	  </tr>
	  <tr>
		<td width="10">&nbsp;</td>
		<td>
		    [{if $product->getStockStatus() == -1}]
		        <span class="flag red"></span>[{ oxmultilang ident="WIDGET_PRODUCT_NO_STOCK" }]
		    [{elseif $product->getStockStatus() == 1}]
		        <span class="flag orange"></span>[{ oxmultilang ident="WIDGET_PRODUCT_LOW_STOCK" }]
		    [{elseif $product->getStockStatus() == 0}]
		        <span class="flag green"></span>[{ oxmultilang ident="WIDGET_PRODUCT_IN_STOCK" }]
		    [{/if}]
		</td>
	  </tr>
	</table>
	</a>	
</div>


