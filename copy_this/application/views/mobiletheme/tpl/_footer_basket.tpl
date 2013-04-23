	
	<div class="footer_basket block clearfix">
             <div class="next_step_on[{if !$nextStep}] disable[{/if}]">
          	<form name="next_step" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
          		[{ $oViewConf->getHiddenSid() }]
          		<input type="hidden" name="cl" value="user">
          		[{if !$nextStep}]
	          		<span>[{ oxmultilang ident="GO_TO_NEXT_STEP" }]</span>
          		[{else}]
          		    <input type="submit" class="btn-new" value="[{ oxmultilang ident="Zur Kasse" }]"/>
	          		
          		[{/if}]
          	</form>
          </div>
          		
   </div>

