[{assign var="template_title" value="GUESTBOOKENTRY_TITLE"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title }]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=guestbook"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink}]
<div id="content">
<!-- page locator -->

[{if !$oView->floodProtection()}]
    <div class="box">
        <strong class="boxhead">[{ oxmultilang ident="GUESTBOOKENTRY_WRITEENTRY" }]</strong>
    </div>
  
    <form action="[{ $oViewConf->getSelfActionLink() }]" method="post">
     
          [{ $oViewConf->getHiddenSid() }]
          [{ $oViewConf->getNavFormParams() }]
          [{oxid_include_dynamic file="dyn/formparams.tpl" }]
          <input type="hidden" name="fnc" value="saveEntry">
          <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
          <ul class="edit rounded userform">
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="GUESTBOOKENTRY_YOURMESSAGE" }]</label></div>
			        <div class="user-content">
                           <textarea name="rvw_txt" ></textarea>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content"><input type="submit" value="[{ oxmultilang ident="GUESTBOOKENTRY_SEND" }]" class="btn-new">
                 </li>
          </ul>
          
    </form>
  
[{/if}]
<div class="box">
<strong class="boxhead">[{ oxmultilang ident="GUESTBOOKENTRY_GUESTBOOK" }]</strong>
</div>

[{include file="inc/guestbook_locator.tpl" }]

  [{ if $oView->getEntries() }]
    
      [{foreach from=$oView->getEntries() item=entry}]
      <div class="box">
      <table style="margin-right:-3px;min-width:100%;width:94%;">
      <colgroup><col width="60%"><col width="25%"><col width="15%"></colgroup>
        <tr><td colspan="3"><div class="categoryline"></div></td></tr>
        <tr>
          <td class="fontblack font11">
            <span class="fontbold">[{ $entry->oxuser__oxfname->value }]</span> [{ oxmultilang ident="GUESTBOOKENTRY_WRITES" }]
          </td>
          <td class="fontgray1 font11">
            <span class="fontgray1 fontbold">[{ oxmultilang ident="GUESTBOOKENTRY_DATE" }]</span>&nbsp;[{ $entry->oxgbentries__oxcreate->value|date_format:"%d.%m.%Y" }]
          </td>
          <td class="fontgray1 font11">
            <span class="fontgray1 fontbold">[{ oxmultilang ident="GUESTBOOKENTRY_TIME" }]</span>&nbsp;[{ $entry->oxgbentries__oxcreate->value|date_format:"%H:%M" }]
          </td>
        </tr>
        <tr><td colspan="3"><div class="categoryline"></div></td></tr>
        <tr><td class="fontblack" colspan="3">[{ $entry->oxgbentries__oxcontent->value|nl2br }]<br><br></td></tr>
        <tr></tr>
        </table>
        </div>
      [{/foreach}]
    
  [{else}]
    <div class="box na">[{ oxmultilang ident="GUESTBOOKENTRY_NOENTRYAVAILABLE" }]</div>
  [{/if}]

<!-- page locator -->
[{include file="inc/guestbook_locator.tpl" }]
</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=guestbook"}]
