[{assign var="template_title" value="USER_LOGINTITLE"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]

<!-- ordering steps -->
[{*include file="inc/steps_item.tpl" highlight=2 *}]
<div id="content">
[{assign var="loginoption" value=$oView->getLoginOption()}]
[{if $loginoption|@count == 0}]
          [{assign var="backurl" value=$oViewConf->getBasketLink()}]
    [{else}]
            [{assign var="backurl" value=$oViewConf->getSelfLink()|cat:"cl=user"}]
[{/if}]
[{include file="_titlesection.tpl" header="INC_STEPS_ITEM_SEND"|oxmultilangassign back=$backurl }]
<div class="contMain">
   [{if !$oxcmp_user && $loginoption|@count == 0}]
   <ul class="ul-navi">
				<li>
				    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
				    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="cl" value="user"/>
                    <input type="hidden" name="fnc" value=""/>
                    <input type="hidden" name="option" value="2"/>
                    <!--<div class="user-title"><label>[{ oxmultilang ident="USER_TITLE" }]</label></div>-->
					<input type="submit" class="sub-link" name="submitbut" value="[{ oxmultilang ident="USER_LOGIN" }]"/>
					</form>
				</li>
				<li>
				    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
				    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="cl" value="user"/>
                    <input type="hidden" name="fnc" value=""/>
                    <input type="hidden" name="option" value="1"/>
                    <input type="submit" class="sub-link" name="submitbut" value="[{ oxmultilang ident="USER_GUESTCHECKOUT" }]"/>
					</form>
				</li>
				<li>
				    <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
				    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="cl" value="user">
                    <input type="hidden" name="fnc" value="">
                    <input type="hidden" name="option" value="3"/>
                    <input type="submit" class="sub-link" name="submitbut" value="[{ oxmultilang ident="USER_REGISTER" }]"/>
					</form>
				</li>
        </ul>
        [{else}]


[{assign var="_blshownoregopt" value=$oView->getShowNoRegOption()}]

  [{ if !$oxcmp_user && !$loginoption  && !$oView->isConnectedWithFb() }]
    [{*if $_blshownoregopt }]
      <div class="left">
          <strong class="useroptboxhead">[{ oxmultilang ident="USER_OPTION1" }]</strong>
          <div class="useroptbox">
              <b>[{ oxmultilang ident="USER_ORDERWITHOUTREGISTER1" }]</b><br><br>
              [{ oxmultilang ident="USER_ORDERWITHOUTREGISTER2" }]<br><br>
              <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                <div>
                    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="cl" value="user">
                    <input type="hidden" name="fnc" value="">
                    <input type="hidden" name="option" value="1">
                    <span><input id="test_UsrOpt1" type="submit" name="send" value="[{ oxmultilang ident="USER_NEXT" }]" class="btn-new"></span>
                </div>
              </form>
          </div>
      </div>
    [{/if*}]


          [{*<strong class="useroptboxhead[{if !$_blshownoregopt }]big[{/if}]">[{if !$_blshownoregopt }][{ oxmultilang ident="USER_OPTION1" }][{else}][{ oxmultilang ident="USER_OPTION2" }][{/if}]</strong>*}]
          <div class="useroptbox[{if !$_blshownoregopt }]big[{/if}]">
              [{*<b>[{ oxmultilang ident="USER_ALREADYCUSTOMER" }]</b><br><br>*}]
              <b>[{ oxmultilang ident="USER_PLEASELOGIN" }]</b>
            </div>

            [{if $Errors.user}]
            [{foreach from=$Errors.user item=oEr key=key }]<div class="err">[{ $oEr->getOxMessage()}]</div>[{/foreach}]
            [{/if}]



              <form action="[{ $oViewConf->getSslSelfLink() }]" method="post" id="loginstep" name="loginstep">
	            <div>
	                [{ $oViewConf->getHiddenSid() }]
	                [{ $oViewConf->getNavFormParams() }]
	                <input type="hidden" name="fnc" value="login_noredirect">
	                <input type="hidden" name="cl" value="user">
	                <input type="hidden" name="option" value="2">
	                <input type="hidden" name="lgn_cook" value="0">
	                <input type="hidden" name="CustomError" value='user'>
					<ul class="edit rounded userform">
						<li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_EMAIL" }]</label></div>
							<div class="user-content"><input id="test_UsrOpt2_usr" type="text" name="lgn_usr" value=""></div>

						</li>
						<li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PWD" }]</label></div>
							<div class="user-content"><input id="test_UsrOpt2_pwd" type="password" name="lgn_pwd" value=""></div>

						</li>
						<li class="userli">
							<div class="user-title"><label></label></div>
							<div class="user-content"><input id="test_UsrOpt2" type="submit" name="send" value="[{ oxmultilang ident="USER_LOGIN" }]" class="btn-new">
							</div>

						</li>
						<li class="userli">
							<div class="user-title"><label></label></div>
							<div class="user-content"><a id="test_UsrOpt2_forgotPwd" rel="nofollow" href="[{ oxgetseourl ident=$oViewConf->getSelfLink()|cat:"cl=forgotpwd" }]" class="link">[{ oxmultilang ident="USER_FORGOTPWD" }] ?</a></div>

						</li>

			</ul>
					</div>
	          </form><br>


[{*
      <div class="left">
          <strong class="useroptboxhead[{if !$_blshownoregopt }]big[{/if}]">[{if !$_blshownoregopt }][{ oxmultilang ident="USER_OPTION2" }][{else}][{ oxmultilang ident="USER_OPTION3" }][{/if}]</strong>
          <div class="useroptbox[{if !$_blshownoregopt }]big[{/if}]">
              <b>[{ oxmultilang ident="USER_OPENPERSONALACCOUNT1" }]</b><br><br>
              [{ oxmultilang ident="USER_OPENPERSONALACCOUNT2" }] [{ oxmultilang ident="USER_OPENPERSONALACCOUNT3" }]<br><br>
              <span class="fs11">
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT4" }]<br>
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT5" }]<br>
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT6" }]<br>
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT7" }]<br>
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT8" }]<br>
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT9" }]<br>
                  [{ oxmultilang ident="USER_OPENPERSONALACCOUNT10" }]
              </span>
              <br><br>
              <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
                <div>
                    [{ $oViewConf->getHiddenSid() }]
                    [{ $oViewConf->getNavFormParams() }]
                    <input type="hidden" name="cl" value="user">
                    <input type="hidden" name="fnc" value="">
                    <input type="hidden" name="option" value="3">
                    <span><input id="test_UsrOpt3" type="submit" name="send" value="[{ oxmultilang ident="USER_LOGIN2" }]" class="btn-new"></span>
                </div>
              </form>
          </div>
      </div>*}]

  [{else}]
    [{assign var="invadr" value=$oView->getInvoiceAddress()}]
    [{assign var="currency" value=$oView->getActCurrency() }]

    [{if !$oxcmp_user && $oView->isConnectedWithFb()}]
      <strong class="boxhead">[{ oxmultilang ident="USER_LOGIN3" }]</strong>
      <div class="box info">
          [{ oxmultilang ident="USER_FB_UPDATEACCOUNTMSG" }]
          <br>
          <br>

          <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">

            <div>
                [{ $oViewConf->getHiddenSid() }]
                [{ $oViewConf->getNavFormParams() }]
                <input type="hidden" name="fnc" value="">
                <input type="hidden" name="cl" value="user">
                <input type="hidden" name="option" value="2">
                <input type="hidden" name="lgn_cook" value="0">
                <input type="hidden" name="fblogin" value="1">
                <input type="hidden" name="CustomError" value='popup'>
                <span><input id="test_UsrOpt2UpdateAccount" type="submit" name="send" value="[{ oxmultilang ident="USER_UPDATE_ACCOUNT" }]" class="btn-new"></span><br><br>
             </div>
          </form>
      </div>
    [{/if}]


    <form action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
      <div>
          [{ $oViewConf->getHiddenSid() }]
          [{ $oViewConf->getNavFormParams() }]
          <input type="hidden" name="option" value="[{$oView->getLoginOption()}]">
          <input type="hidden" name="cl" value="user">
          <input type="hidden" name="CustomError" value='user'>
          <input type="hidden" name="blhideshipaddress" value="0">
          [{if !$oxcmp_user->oxuser__oxpassword->value }]
            <input type="hidden" name="fnc" value="createuser">
          [{else}]
            <input type="hidden" name="fnc" value="changeuser">
            <input type="hidden" name="lgn_cook" value="0">
          [{/if}]
      </div>

      [{if $oView->isLowOrderPrice()}]
        <div class="bar prevnext order">
            <div class="minorderprice">[{ oxmultilang ident="BASKET_MINORDERPRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
        </div>
      [{else}]
        [{*<div class="bar prevnext order">
            <div class="right arrowright">
                <input id="test_UserNextStepTop" name="userform" type="submit" value="[{ oxmultilang ident="USER_NEXTSTEP" }]">
            </div>
        </div>
        *}]
      [{/if}]

      [{if $Errors.user}]
          [{include file="inc/error.tpl" Errorlist=$Errors.user}]

      [{/if}]

      [{if $oView->getLoginOption() == 3 || (!$oxcmp_user && $oView->isConnectedWithFb()) }]
        [{*<div class="box">
        <strong class="boxhead">[{ oxmultilang ident="USER_LOGIN3" }]</strong>
        </div>*}]

            <div class="box">
            <b>[{ oxmultilang ident="USER_ENTEREMAILANDPWD" }]<br>
            [{ oxmultilang ident="USER_RECEIVECONFIRMATION" }]</b>
            </div>
            <div class="dot_sep"></div>
            <ul class="edit rounded userform">
						<li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_EMAILADDRESS" }]</label></div>
							<div class="user-content">
	<input id="userLoginName" type="text" name="lgn_usr" value="[{$oView->getActiveUsername()}]" ><span class="req">*</span></div>

						</li>
						<li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PASSWORD" }]</label></div>
							<div class="user-content">
	                        <input id="userPassword" type="password" name="lgn_pwd" value="[{$lgn_pwd}]"><span class="req">*</span></div></li>
						<li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PASSWORD" }]</label></div>
							<div class="user-content">
	<input id="userPasswordConfirm" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]"><span class="req">*</span></div>

						</li>
		</ul>


      [{/if}]
        <div class="box">
            <strong class="boxhead"><b>[{ oxmultilang ident="USER_BILLINDADDRESS" }]</b>&nbsp;&nbsp;&nbsp;&nbsp;<span class="error">[{ oxmultilang ident="USER_COMPLETEALLMARKEDFIELDS" }]</span></strong>
        </div>


          <div class="dot_sep"></div>
            <ul class="edit rounded userform">
                [{ if !$oxcmp_user->oxuser__oxpassword->value && $oView->getLoginOption() != 3 && !$oView->isConnectedWithFb() }]
                      <li class="userli">
                        <div class="user-title"><label>[{ oxmultilang ident="USER_EMAILADDRESS2" }]</label></div>
                        <div class="user-content">
                        <input id="userLoginName" type="text" name="lgn_usr" value="[{$oView->getActiveUsername()}]"><span class="req">*</span></div>

                      </li>
                 [{/if}]
                <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_TITLE" }]</label></div>
							<div class="user-content">
	[{include file="inc/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value value2=$invadr.oxuser__oxsal}]
                [{if $oView->isFieldRequired(oxuser__oxsal) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_FIRSTNAME" }]</label></div>
							<div class="user-content">
	 <input type="text"  name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else}][{ $oxcmp_user->oxuser__oxfname->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxfname) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_LASTNAME" }]</label></div>
							<div class="user-content">
	 <input type="text" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else}][{ $oxcmp_user->oxuser__oxlname->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxlname) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_COMPANY" }]</label></div>
							<div class="user-content">
	 <input type="text" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany ) }][{ $invadr.oxuser__oxcompany }][{else}][{$oxcmp_user->oxuser__oxcompany->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxcompany) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_STREET" }]</label></div>
							<div class="user-content">
	 <input type="text" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet ) }][{$invadr.oxuser__oxstreet }][{else}][{$oxcmp_user->oxuser__oxstreet->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr) }]<span class="req">*</span>[{/if}]</div>

			    </li>

			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_STREET_NR" }]</label></div>
							<div class="user-content">
	                 <input type="text"  name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr ) }][{ $invadr.oxuser__oxstreetnr }][{else}][{ $oxcmp_user->oxuser__oxstreetnr->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxstreet) || $oView->isFieldRequired(oxuser__oxstreetnr) }]<span class="req">*</span>[{/if}]</div>

			    </li>

			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PLZ" }]</label></div>
							<div class="user-content">
	                 <input type="text" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip ) }][{$invadr.oxuser__oxzip }][{else}][{$oxcmp_user->oxuser__oxzip->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_CITY" }]</label></div>
							<div class="user-content">
	                <input type="text" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity ) }][{$invadr.oxuser__oxcity }][{else}][{$oxcmp_user->oxuser__oxcity->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxzip) || $oView->isFieldRequired(oxuser__oxcity) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_VATID" }]</label></div>
							<div class="user-content">
	                <input type="text" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid ) }][{$invadr.oxuser__oxustid }][{else}][{$oxcmp_user->oxuser__oxustid->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxustid) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_ADDITIONALINFO" }]</label></div>
							<div class="user-content">
	                 <input type="text" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{$invadr.oxuser__oxaddinfo }][{else}][{$oxcmp_user->oxuser__oxaddinfo->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxaddinfo) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_COUNTRY" }]</label></div>
							<div class="user-content">
	                 <select id="invCountrySelect" name="invadr[oxuser__oxcountryid]">
                  [{*<option value="">-</option>*}]
                  [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                    <option value="[{$country->oxcountry__oxid->value}]"[{if isset( $invadr.oxuser__oxcountryid ) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value}] selected[{ elseif $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value }] selected[{/if}]>[{$country->oxcountry__oxtitle->value}]</option>
                  [{/foreach}]
                </select>[{if $oView->isFieldRequired(oxuser__oxcountryid) }]<span class="req">*</span>[{/if}]</div>

			    </li>

			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PHONE" }]</label></div>
							<div class="user-content">
	                 <input type="text" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{$invadr.oxuser__oxfon }][{else}][{$oxcmp_user->oxuser__oxfon->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxfon) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_FAX" }]</label></div>
							<div class="user-content">
	                 <input type="text" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax ) }][{$invadr.oxuser__oxfax }][{else}][{$oxcmp_user->oxuser__oxfax->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxfax) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_MOBIL" }]</label></div>
							<div class="user-content">
	                 <input type="text"  name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon ) }][{$invadr.oxuser__oxmobfon }][{else}][{$oxcmp_user->oxuser__oxmobfon->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxmobfon) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    [{*
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PRIVATPHONE" }]</label></div>
							<div class="user-content">
	                 <input type="text" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxprivfon) }]<span class="req">*</span>[{/if}]</div>

			    </li> *}]
			     [{if $oViewConf->showBirthdayFields() }]
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_BIRTHDATE" }]</label></div>
							<div class="user-content">
	                 <input type="text" size="3" maxlength="2" name="invadr[oxuser__oxbirthdate][day]" value="[{if isset( $invadr.oxuser__oxbirthdate.day ) }][{$invadr.oxuser__oxbirthdate.day }][{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}][{$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]([0-9]{1,2})[-]/":"" }][{/if}]">&nbsp;&nbsp;
                <input type="text" size="3" maxlength="2" name="invadr[oxuser__oxbirthdate][month]" value="[{if isset( $invadr.oxuser__oxbirthdate.month ) }][{$invadr.oxuser__oxbirthdate.month }][{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }][{$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/^([0-9]{4})[-]/":""|regex_replace:"/[-]([0-9]{1,2})$/":"" }][{/if}]">&nbsp;&nbsp;
                <input type="text" size="8" maxlength="4" name="invadr[oxuser__oxbirthdate][year]" value="[{if isset( $invadr.oxuser__oxbirthdate.year ) }][{$invadr.oxuser__oxbirthdate.year }][{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }][{$oxcmp_user->oxuser__oxbirthdate->value|regex_replace:"/[-]([0-9]{1,2})[-]([0-9]{1,2})$/":"" }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxbirthdate) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    [{/if}]
			     <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_SUBSCRIBENEWSLETTER" }]</label></div>
							<div class="user-content">
	                 <input type="hidden" name="blnewssubscribed" value="0">
                <input id="test_newsReg" type="checkbox" name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed()}]checked[{/if}]>
                <span class="fs10">[{ oxmultilang ident="USER_SUBSCRIBENEWSLETTER_MESSAGE" }]</span></div>

			    </li>
                <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_YOURMESSAGE" }]</label></div>
							<div class="user-content">
	                 [{ if !$oView->getOrderRemark()}]
                  [{assign var="order_remark" value=""}]
                [{else}]
                  [{assign var="order_remark" value=$oView->getOrderRemark()}]
                [{/if}]
                <textarea  name="order_remark">[{$order_remark}]</textarea>

			    </li> 
    
            </ul>
                 <div class="footer_basket block clearfix">
        <div class="prev_step_on">
            <a href="[{$oViewConf->getBasketLink()}]" class="one-line btn-new">[{ oxmultilang ident="USER_Cart" }]</a>

        </div>
        <div class="next_step_on">
            <input id="test_UserNextStepBottom" name="userform" class="btn-new" type="submit" value="[{ oxmultilang ident="CONTINUE" }]">

        </div>
       </div>
          <div class="dot_sep"></div>



         <div class="box">
          <b>[{ oxmultilang ident="USER_SHIPPINGADDRESS" }]</b>
          </div>
          <div class="box">
          <div class="dot_sep"></div>

          [{*if !$oView->showShipAddress()*}]
            [{*<span><input type="submit" name="blshowshipaddress" value="[{ oxmultilang ident="USER_DIFFERENTSHIPPINGADDRESS" }]" class="btn-new"></span><br /><br />}]
            <span><input type="submit" name="blshowshipaddress" value="[{ oxmultilang ident="USER_SHIPPINGADDRESS" }]" class="btn-new"></span><br /><br />
          [{else}]
            <span><input type="submit" name="blhideshipaddress" value="[{ oxmultilang ident="USER_DISABLESHIPPINGADDRESS" }]" class="btn-new"></span><br /><br />
          [{/if*}]

          <div class="fs10 def_color_1"><span class="req">[{ oxmultilang ident="USER_NOTE" }]</span> [{ oxmultilang ident="USER_DIFFERENTDELIVERYADDRESS" }]</div>
          </div>
          [{*if $oView->showShipAddress()*}]
          <ul class="edit rounded userform">
            <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_ADDRESSES" }]</label></div>
							<div class="user-content">
	                <select name="oxaddressid" onchange="this.form.submit();">
	                  <option value="-1" SELECTED>[{ oxmultilang ident="USER_NEWADDRESS" }]</option>
                    [{if $oxcmp_user}]
                        [{foreach from=$oxcmp_user->getUserAddresses() item=address}]
                            <option value="[{$address->oxaddress__oxid->value}]" [{ if $address->isSelected()}][{assign var="delivadr" value=$address}]SELECTED[{/if}]>[{$address}]</option>
                        [{/foreach}]
                    [{/if}]
                  </select></div>

			 </li>
			 <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_TITLE2" }]</label></div>
							<div class="user-content">
	                 [{include file="inc/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value}]
                  [{if $oView->isFieldRequired(oxaddress__oxsal) }]<span class="req">*</span>[{/if}]</div>

			    </li>
             <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_FIRSTNAME" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxfname]" value="[{if isset( $deladr.oxaddress__oxfname ) }][{ $deladr.oxaddress__oxfname }][{else}][{ $delivadr->oxaddress__oxfname->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxfname) }]<span class="req">*</span>[{/if }]
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_LASTNAME" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxlname]" value="[{if isset( $deladr.oxaddress__oxlname ) }][{ $deladr.oxaddress__oxlname }][{else}][{ $delivadr->oxaddress__oxlname->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxlname) }]<span class="req">*</span>[{/if }]
            </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_COMPANY2" }]</label></div>
							<div class="user-content">
	                  <input type="text" name="deladr[oxaddress__oxcompany]" value="[{if isset( $deladr.oxaddress__oxcompany ) }][{$deladr.oxaddress__oxcompany}][{else}][{$delivadr->oxaddress__oxcompany->value }][{/if}]">
                  [{if $oView->isFieldRequired(oxaddress__oxcompany) }]<span class="req">*</span>[{/if}]</div>

			    </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_STREET" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxstreet]" value="[{if isset( $deladr.oxaddress__oxstreet ) }][{ $deladr.oxaddress__oxstreet }][{else}][{ $delivadr->oxaddress__oxstreet->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxstreet)}]<span class="req">*</span>[{/if }]
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_STREET_NR" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxstreetnr]" value="[{if isset( $deladr.oxaddress__oxstreetnr ) }][{ $deladr.oxaddress__oxstreetnr }][{else}][{ $delivadr->oxaddress__oxstreetnr->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxstreetnr) }]<span class="req">*</span>[{/if }]
            </li>

            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_PLZ" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxzip]" value="[{if isset( $deladr.oxaddress__oxzip ) }][{ $deladr.oxaddress__oxzip }][{else}][{ $delivadr->oxaddress__oxzip->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxzip)}]<span class="req">*</span>[{/if }]
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_CITY" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxcity]" value="[{if isset( $deladr.oxaddress__oxcity ) }][{ $deladr.oxaddress__oxcity }][{else}][{ $delivadr->oxaddress__oxcity->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxcity) }]<span class="req">*</span>[{/if }]
            </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_COUNTRY2" }]</label></div>
							<div class="user-content">
	                  <select id="delCountrySelect" name="deladr[oxaddress__oxcountryid]">
                    [{*<option value="">-</option>*}]
                    [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                      <option value="[{$country->oxcountry__oxid->value}]" [{if isset( $deladr.oxaddress__oxcountryid ) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value}]selected[{elseif $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value}]selected[{/if}]>[{$country->oxcountry__oxtitle->value}]</option>
                    [{/foreach}]
                  </select>
                  [{if $oView->isFieldRequired(oxaddress__oxcountryid) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
						    <div class="user-title"><label>[{ oxmultilang ident="USER_ADDITIONALINFO" }]</label></div>
							<div class="user-content">
	                  <input type="text" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo ) }][{$deladr.oxaddress__oxaddinfo}][{else}][{$delivadr->oxaddress__oxaddinfo->value }][{/if}]">
                  [{if $oView->isFieldRequired(oxaddress__oxaddinfo) }]<span class="req">*</span>[{/if}]</div>

			    </li>

			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_PHONE2" }]</label></div>
							<div class="user-content">
	                  <input type="text" name="deladr[oxaddress__oxfon]" value="[{if isset( $deladr.oxaddress__oxfon ) }][{$deladr.oxaddress__oxfon}][{else}][{$delivadr->oxaddress__oxfon->value }][{/if}]">
                    [{if $oView->isFieldRequired(oxaddress__oxfon) }]<span class="req">*</span>[{/if}]</div>

			    </li>
			    <li class="userli">
							<div class="user-title"><label>[{ oxmultilang ident="USER_FAX2" }]</label></div>
							<div class="user-content">
	                 <input type="text" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax ) }][{$deladr.oxaddress__oxfax}][{else}][{$delivadr->oxaddress__oxfax->value }][{/if}]">
                    [{if $oView->isFieldRequired(oxaddress__oxfax) }]<span class="req">*</span>[{/if}]</div>

			    </li>
          </ul>

          [{/if}]
          [{if $oView->isLowOrderPrice()}]
        <div class="bar prevnext order">
          <div class="minorderprice">[{ oxmultilang ident="BASKET_MINORDERPRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
        </div>
      [{else}]
      <div class="footer_basket block clearfix">
        <div class="prev_step_on">
            <a href="[{$oViewConf->getBasketLink()}]" class="one-line btn-new">[{ oxmultilang ident="USER_Cart" }]</a>

        </div>
        <div class="next_step_on">
            <input id="test_UserNextStepBottom" name="userform" class="btn-new" type="submit" value="[{ oxmultilang ident="CONTINUE" }]">

        </div>
       </div>
      [{/if}]

    </form>
    &nbsp;

  [{*/if*}]
      </div>

    [{/if}]

</div>
</div>

[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
