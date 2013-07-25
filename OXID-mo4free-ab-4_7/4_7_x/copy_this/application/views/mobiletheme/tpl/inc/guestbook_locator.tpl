[{assign var="pageNavigation" value=$oView->getPageNavigation()}]
  <div class="locator box">
    [{if $pageNavigation->NrOfPages > 1}]
      <div class="lochead">
          <strong class="h4">[{ oxmultilang ident="INC_GUESTBOOK_LOCATOR_PAGE" }] [{ $pageNavigation->actPage  }] / [{ $pageNavigation->NrOfPages  }]</strong>
          <div class="right">
           [{ if $pageNavigation->previousPage }]
             <a href="[{$pageNavigation->previousPage}]"><span class="arrow">&laquo;</span></a>
           [{/if}]
              |
           [{foreach key=iPage from=$pageNavigation->changePage item=page}]
             [{if $iPage > ($pageNavigation->actPage - 10) && $iPage < ($pageNavigation->actPage + 10)}]
               <a href="[{$page->url}]" class="textblock[{if $iPage == $pageNavigation->actPage }] active[{/if}]">[{$iPage}]</a>
             [{/if}]
           [{/foreach}]
              |
           [{ if $pageNavigation->nextPage }]
             <a href="[{$pageNavigation->nextPage}]"><span class="arrow">&raquo;</span></a>
           [{/if}]
          </div>
      </div>
    [{/if }]
      <div class="locbody">
           <div class="left">
               <span>[{ oxmultilang ident="INC_GUESTBOOK_LOCATOR_ENTRIESPERPAGE" }]</span>
               <span>[{foreach from=$oViewConf->getNrOfCatArticles() item=iArtPerPage}]
                 <a href="[{ $oViewConf->getSelfLink() }]tpl=[{$oViewConf->getActTplName()}]&amp;_artperpage=[{$iArtPerPage}]&amp;[{$oView->getAdditionalParams()}]" class="textblock[{if $oViewConf->getArtPerPageCount() == $iArtPerPage}] active[{/if}]" rel="nofollow">[{$iArtPerPage}]</a>
               [{/foreach}]</span>
           </div>
           <div class="right">
               [{include file="inc/sort_guestbook.snippet.tpl"}]
           </div>
      </div>
  </div>
