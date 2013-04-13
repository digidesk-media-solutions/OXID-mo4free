 [{assign var="pageNavigation" value=$oView->getPageNavigation()}]
  <div class="locator">
    [{if $pageNavigation->NrOfPages > 1}]
    <div>
    	<div class="pages">
    		<span class="pfeil_links [{ if !$pageNavigation->previousPage }]disable[{/if}]">
    			<a href="[{ if $pageNavigation->previousPage }][{$pageNavigation->previousPage}][{/if}]" >&nbsp;<<&nbsp;</a>
    		</span>
    		<span>[{ oxmultilang ident="INC_LIST_LOCATOR_PAGE" }] [{ $pageNavigation->actPage  }] / [{ $pageNavigation->NrOfPages  }]</span>
	    	<span class="pfeil_rechts [{ if !$pageNavigation->nextPage }]disable[{/if}]">
    			<a href="[{ if $pageNavigation->nextPage }][{$pageNavigation->nextPage}][{/if}]">&nbsp;>>&nbsp;</a></a>
	    	</span>
	    </div>
    </div>
    [{/if}]
  </div>
