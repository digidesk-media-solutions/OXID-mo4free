[{assign var="template_title" value="ACCOUNT_RECOMM_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location="ACCOUNT_RECOMM_LOCATION"|oxmultilangassign|cat:$template_title}]
<div id="content">

[{assign var="actvrecommlist" value=$oView->getActiveRecommList() }]
<div class="box info">
    <strong id="test_recomListHeader1" class="boxhead">[{if $actvrecommlist}][{$actvrecommlist->oxrecommlists__oxtitle->value}][{else}][{ oxmultilang ident="ACCOUNT_RECOMM_NEWLIST" }][{/if}]</strong>
</div>
[{include file="inc/error.tpl" Errorlist=$Errors.user errdisplay="inbox"}]

    <form action="[{ $oViewConf->getSelfActionLink() }]" name="saverecommlist" method="post">
      <div>
          [{ $oViewConf->getHiddenSid() }]
          [{ $oViewConf->getNavFormParams() }]
          <input type="hidden" name="fnc" value="saveRecommList">
          <input type="hidden" name="cl" value="account_recommlist">
          [{if $actvrecommlist}]
            <input type="hidden" name="recommid" value="[{$actvrecommlist->getId()}]">
          [{/if}]
      </div>

      [{if $actvrecommlist && $oView->isSavedList()}]
        [{ oxmultilang ident="ACCOUNT_RECOMM_LISTSAVED" }]
      [{/if}]

      <div class="dot_sep mid"></div>

      <ul class="edit rounded userform">
        <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_RECOMM_LISTTITLE" }]:</label></div>
			        <div class="user-content">
                          <input type="text" name="recomm_title" value="[{$actvrecommlist->oxrecommlists__oxtitle->value}]" >
            <span class="req">*</span>
         </li>
          <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_RECOMM_LISTAUTHOR" }]:</label></div>
			        <div class="user-content">
                          <input type="text" name="recomm_author" value="[{if $actvrecommlist->oxrecommlists__oxauthor->value}][{$actvrecommlist->oxrecommlists__oxauthor->value}][{elseif !$actvrecommlist}][{ $oxcmp_user->oxuser__oxfname->value }] [{ $oxcmp_user->oxuser__oxlname->value }][{/if}]" >
            <span class="req">*</span>
         </li>
         <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_RECOMM_LISTDESC" }]:</label></div>
			        <div class="user-content">
                         <textarea cols="70" rows="8" name="recomm_desc" >[{$actvrecommlist->oxrecommlists__oxdesc->value}]</textarea>
            
         </li>
         <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
                         <input id="test_recomListSave" type="submit" value="[{ oxmultilang ident="ACCOUNT_RECOMM_SAVE" }]" class="btn-new">
            
         </li>
      </ul>

      

    </form>


  [{assign var="blEdit" value=true }]
  [{include file="inc/recomm_lists.tpl" blEdit=$blEdit template_title=$template_title }]

</div>
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=account"}]
