[{assign var="template_title" value="ACCOUNT_PASSWORD_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location="ACCOUNT_PASSWORD_LOCATION"|oxmultilangassign|cat:$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=account"}]
[{include file="_titlesection.tpl" header="ACCOUNT_PASSWORD_PERSONALSETTINGS"|oxmultilangassign back=$backlink }]
<div id="content">
<div class="box">
<strong>[{ oxmultilang ident="ACCOUNT_PASSWORD_PERSONALSETTINGS" }]&nbsp;&nbsp;-&nbsp;&nbsp;[{ oxmultilang ident="ACCOUNT_PASSWORD_TOCHANGEPASSWORD" }]</strong><br><br>
<small><span class="note">[{ oxmultilang ident="ACCOUNT_PASSWORD_NOTE" }]</span><span class="def_color_1">[{ oxmultilang ident="ACCOUNT_PASSWORD_PASSWORDMINLENGTH" }]</span></small>

</div>
    [{if $oView->isPasswordChanged() }]
    <div class="block success">[{ oxmultilang ident="ACCOUNT_PASSWORD_PASSWORDCHANGED" }]</div>
     [{/if }]
        
      [{include file="inc/error.tpl" Errorlist=$Errors.user errdisplay="inbox"}]
        
          <form action="[{ $oViewConf->getSelfActionLink() }]" name="changepassword" method="post">
            
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="fnc" value="changePassword">
                <input type="hidden" name="cl" value="account_password">
                <input type="hidden" name="CustomError" value='user'>
                <strong class="h4"></strong>
                
               <ul class="edit rounded userform">
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_PASSWORD_OLDPASSWORD" }]</label></div>
			        <div class="user-content"><input type="password" name="password_old"></div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_PASSWORD_NEWPASSWORD" }]</label></div>
			        <div class="user-content"><input type="password" name="password_new"></div>
                 </li>   
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_PASSWORD_CONFIRMPASSWORD" }]</label></div>
			        <div class="user-content"><input type="password" name="password_new_confirm"></div>
                 </li>   
                 <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content"><input id="test_savePass" type="submit" value="[{ oxmultilang ident="ACCOUNT_PASSWORD_SAVE" }]" class="btn-new"></div>
                 </li> 
               </ul>
          </form>
 <br>       
</div>

[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=account"}]
