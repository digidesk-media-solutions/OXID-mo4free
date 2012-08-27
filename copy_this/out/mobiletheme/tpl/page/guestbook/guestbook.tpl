[{assign var="template_title" value="GUESTBOOK_TITLE"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=content"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink}]
<div id="content">
  <!-- page locator -->

  [{if !$oView->floodProtection() || !$oxcmp_user->oxuser__oxpassword->value}]
    <div class="box info"><strong id="test_guestbookWriteHeader" class="boxhead">[{ oxmultilang ident="GUESTBOOK_WRITEENTRY" }]</strong></div>
    <div class="box info">
      [{ if $oxcmp_user->oxuser__oxpassword->value }]
        <form name="guestbook" action="[{ $oViewConf->getSelfLink() }]" method="post">
          <div>
              [{ $oViewConf->getHiddenSid() }]
              [{ $oViewConf->getNavFormParams() }]
              <input type="hidden" name="cl" value="guestbookentry">
              <input type="submit" value="[{ oxmultilang ident="GUESTBOOK_CLICKHERETOWRITEENTRY" }]" class="btn-new">
          </div>
        </form>
      [{else}]
        <a href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=account" params="sourcecl="|cat:$oViewConf->getActiveClassName()|cat:$oViewConf->getNavUrlParams() }]" rel="nofollow" class="btn-new"><b>[{ oxmultilang ident="GUESTBOOK_YOUHAVETOBELOGGED" }]</b></a>
      [{/if}]
    </div>
  [{/if}]
    <div class="box">
        <strong id="test_guestbookHeader" class="boxhead">[{ oxmultilang ident="GUESTBOOK_GUESTBOOK" }]</strong>
    </div>
      [{include file="inc/guestbook_locator.tpl" }]
  
    [{ if $oView->getEntries() }]
      <div class="box info">
      <table width="100%" class="guestbook">
            <colgroup><col width="60%"><col width="25%"><col width="15%"></colgroup>
        [{foreach from=$oView->getEntries() item=entry}]
        
            
            <tr class="head">
                <td class="name">
                  <b>[{ $entry->oxuser__oxfname->value }]</b> [{ oxmultilang ident="GUESTBOOK_WRITES" }]
                </td>
                <td>
                  <b>[{ oxmultilang ident="GUESTBOOK_DATE" }]</b>&nbsp;[{ $entry->oxgbentries__oxcreate->value|date_format:"%d.%m.%Y" }]
                </td>
                <td>
                  <b>[{ oxmultilang ident="GUESTBOOK_TIME" }]</b>&nbsp;[{ $entry->oxgbentries__oxcreate->value|date_format:"%H:%M" }]
                </td>
            </tr>
            <tr class="body">
                <td colspan="3">[{ $entry->oxgbentries__oxcontent->value|nl2br }]</td>
            </tr>
            <tr>
                <td colspan="3" height="3"></td>
            </tr>
            
             
        [{/foreach}]
        </table>
       </div>
       
    [{else}]
      <div class="block na">[{ oxmultilang ident="GUESTBOOK_NOENTRYAVAILABLE" }]</div>
    [{/if}]
  
<!-- page locator -->
[{include file="inc/guestbook_locator.tpl" }]
</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=service"}]
