[{*}]
<div class="box"><strong id="test_LoginHeader" class="boxhead">[{ oxmultilang ident="INC_CMP_LOGIN_LOGIN2" }]</strong></div>[{*}]
  <div class="box">[{ oxmultilang ident="INC_CMP_LOGIN_ALREADYCUSTOMER" }]</div>
 
   [{include file="inc/error.tpl" Errorlist=$Errors.default}]
   <form name="login" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
    
        [{ $oViewConf->getHiddenSid() }]
        [{ $oViewConf->getNavFormParams() }]
        <input type="hidden" name="fnc" value="login_noredirect">
        <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
        <input type="hidden" name="tpl" value="[{$oViewConf->getActTplName()}]">
        [{if $oView->getArticleId()}]
          <input type="hidden" name="aid" value="[{$oView->getArticleId()}]">
        [{/if}]
        [{if $oView->getProduct()}]
          [{assign var="product" value=$oView->getProduct() }]
          <input type="hidden" name="anid" value="[{ $product->oxarticles__oxnid->value }]">
        [{/if}]
         [{if $Errors.user}]
       <div class="block error">
              [{foreach from=$Errors.user item=oEr key=key }]
                  <div class="err">[{ $oEr->getOxMessage()}]</div>
              [{/foreach}]
        </div>
        [{/if}]
        <ul class="edit rounded userform">
            <li class="userli">
                <div class="user-title"><label>[{ oxmultilang ident="INC_CMP_LOGIN_EMAIL" }]</label></div>
			    <div class="user-content">
	                 <input id="test_LoginEmail" type="text" name="lgn_usr"/></div>
            </li>
            <li class="userli">
                <div class="user-title"><label>[{ oxmultilang ident="INC_CMP_LOGIN_PWD" }]</label></div>
			    <div class="user-content">
	                 <input id="test_LoginPwd" type="password" name="lgn_pwd" value="" /></div>
            </li>
            <li class="userli">
                <div class="user-title"><label></label></div>
			    <div class="user-content">
	                  <input id="test_LoginKeepLoggedIn" class="chbox" type="checkbox" name="lgn_cook" value="1">&nbsp;&nbsp;[{ oxmultilang ident="INC_CMP_LOGIN_KEEPLOGGEDIN" }]</div>
            </li>
            <li class="userli">
							<div class="user-title"><label></label></div>
							<div class="user-content"><input id="test_Login" type="submit" name="send" value="[{ oxmultilang ident="INC_CMP_LOGIN_LOGIN" }]" class="btn-new"/>
							</div>

						</li>
        </ul>
        <div class="box">
        
            <a id="test_LoginRegister" href="[{ oxgetseourl ident=$oViewConf->getSslSelfLink()|cat:"cl=register" }]" class="btn-new" rel="nofollow">[{ oxmultilang ident="INC_CMP_LOGIN_OPENACCOUNT" }]</a><br/><br/>
            <a id="test_LoginLostPwd" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]" class="btn-new" rel="nofollow">[{ oxmultilang ident="INC_CMP_LOGIN_FORGOTPWD" }]</a>
        </div>
         
    
  </form>

