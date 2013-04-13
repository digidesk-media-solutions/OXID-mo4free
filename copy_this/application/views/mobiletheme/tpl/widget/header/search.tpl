<span class="searchsec">
<form class="search" action="[{ $oViewConf->getSelfActionLink() }]" method="get" name="search">
        
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="cl" value="search">
             <input class="txt" type="text" id="searchParam" name="searchparam" value="[{$oView->getSearchParamForHtml()}]">
             <input value="Go" class="btn" type="submit"/>
        
</form>
</span>
