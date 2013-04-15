[{if $oView->showUpdateScreen() }]
  [{assign var="template_title" value="FORGOTPWD_UPDATETITLE"|oxmultilangassign}]
[{elseif $oView->updateSuccess() }]
  [{assign var="template_title" value="FORGOTPWD_UPDATESUCCESSTITLE"|oxmultilangassign}]
[{else}]
  [{assign var="template_title" value="FORGOTPWD_TITLE"|oxmultilangassign}]
[{/if}]

[{include file="_header.tpl" title=$template_title location=$template_title}]
<div id="content">
[{include file="_titlesection.tpl" header=$template_title back=$oViewConf->getSelfLink()|cat:"cl=account" }]
<div class="contMain">
[{include file="inc/error.tpl" Errorlist=$Errors.default}]
[{if $oView->isExpiredLink() }]

  <div class="box info"><strong class="boxhead">[{$template_title}]</strong></div>
  <div class="box info">
    [{ oxmultilang ident="FORGOTPWD_ERRLINKEXPIRED" }]
  </div>
  
  

[{elseif $oView->showUpdateScreen() }]

  <div class="box info">
    [{ oxmultilang ident="FORGOTPWD_ENTERNEWPASSWORD" }]<br><br>
    <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
      <div>
          [{ $oViewConf->getHiddenSid() }]
          [{ $oViewConf->getNavFormParams() }]
          <input type="hidden" name="fnc" value="updatePassword">
          <input type="hidden" name="uid" value="[{ $oView->getUpdateId() }]">
          <input type="hidden" name="cl" value="forgotpwd">
      </div>
      <ul class="edit rounded userform">
        <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="FORGOTPWD_NEWPASSWORD" }]</label></div>
							<div class="user-content"><input type="password" name="password_new" /></div>

        </li>
        <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="FORGOTPWD_CONFIRMPASSWORD" }]</label></div>
							<div class="user-content"><input type="password" name="password_new_confirm" size="45" /></div>

        </li>
        <li class="userli">
							<div class="user-title"><label></label></div>
							<div class="user-content"><input type="submit" name="save" value="[{ oxmultilang ident="FORGOTPWD_UPDATEPASSWORD" }]" class="btn-new"/>
							</div>

						</li>
      </ul>
      
    </form>
  </div>

[{elseif $oView->updateSuccess() }]


  <div class="box info">
    [{ oxmultilang ident="FORGOTPWD_UPDATE_SUCCESS" }]
  </div>

  <div class="bar prevnext">
    <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
      <div>
        [{ $oViewConf->getHiddenSid() }]
        <input type="hidden" name="cl" value="start">
        <div class="right">
          <input id="test_BackToShop" type="submit" class="sub-link" value="[{ oxmultilang ident="FORGOTPWD_BACKTOSHOP" }]">
        </div>
      </div>
    </form>
  </div>
[{else}]

  
  [{ if $oView->getForgotEmail()}]
    <div class="box info">
      [{ oxmultilang ident="FORGOTPWD_PWDWASSEND" }] [{$oView->getForgotEmail()}]
    </div>
    <div class="bar prevnext">
      <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
        <div>
          [{ $oViewConf->getHiddenSid() }]
          <input type="hidden" name="cl" value="start">
          <div class="right">
            <input id="test_BackToShop" type="submit" class="sub-link" value="[{ oxmultilang ident="FORGOTPWD_BACKTOSHOP" }]">
          </div>
        </div>
      </form>
    </div>
  [{else}]
    <div class="box info">
      [{ oxmultilang ident="FORGOTPWD_FORGOTPWD" }]<br><br>
      [{ oxmultilang ident="FORGOTPWD_WEWILLSENDITTOYOU" }]
    </div>
    <div class="box info">
      <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
        <div>
          [{ $oViewConf->getHiddenSid() }]
          [{ $oViewConf->getNavFormParams() }]
          <input type="hidden" name="fnc" value="forgotpassword">
          <input type="hidden" name="cl" value="forgotpwd">
        </div>
         <ul class="edit rounded userform">
        <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="FORGOTPWD_YOUREMAIL" }]</label></div>
							<div class="user-content"><input id="test_lgn_usr" type="text" name="lgn_usr" value="[{$oView->getActiveUsername()}]" /></div>

        </li>
         <li class="userli">
							<div class="user-title"><label></label></div>
							<div class="user-content"><input type="submit" name="save" value="[{ oxmultilang ident="FORGOTPWD_REQUESTPWD" }]" class="btn-new"/>
							</div>

						</li>
      </ul>
       </form>
      </div>
      <div class="box info">
      [{ oxmultilang ident="FORGOTPWD_AFTERCLICK" }]<br><br>
      [{ oxcontent ident="oxforgotpwd" }]
      </div>
  [{ /if}]
[{/if}]
</div>
</div>
[{ insert name="oxid_tracker" title=$template_title }]
    [{include file="_footer.tpl"}]

