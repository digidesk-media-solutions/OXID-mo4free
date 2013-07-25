[{assign var="template_title" value="REGISTER_MYACCOUNT"|oxmultilangassign}]
[{if $oView->isActive('PsLogin') }]
[{include file="_header_plain.tpl" title=$template_title location=$template_title cssclass="body"}]
<div class="psLoginPlainBox">
[{else}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{/if}]
[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{include file="_titlesection.tpl" header="REGISTER_OPENACCOUNT"|oxmultilangassign back=$backurl }]
[{include file="inc/error.tpl" Errorlist=$Errors.default}]
<form action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
    <div class="box">
        <strong class="boxhead"><b>[{ oxmultilang ident="REGISTER_ACCOUNTINFO" }]</b></strong>
     </div>
	[{ $oViewConf->getHiddenSid() }]
    [{ $oViewConf->getNavFormParams() }]
    <input type="hidden" name="fnc" value="registeruser">
    <input type="hidden" name="cl" value="register">
    <input type="hidden" name="lgn_cook" value="0">
    <input type="hidden" id="reloadAddress" name="reloadaddress" value="">
    <input type="hidden" name="option" value="3">
	<ul class="edit rounded userform">
		<li class="userli">
            <div class="user-title"><label>[{ oxmultilang ident="REGISTER_EMAIL" }]</label></div>
		    <div class="user-content"><input id="test_lgn_usr" type="text" name="lgn_usr" value="[{ $oView->getActiveUsername() }]"/> <span class="req">*</span></div>
		</li>
		<li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="REGISTER_PWD" }]</label></div>
			        <div class="user-content">
						<input id="userPassword" type="password" name="lgn_pwd" value="[{$lgn_pwd}]"/> <span class="req">*</span>
					</div>
		</li>
		<li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="REGISTER_CONFIRMPWD" }]</label></div>
			        <div class="user-content">
						<input id="userPasswordConfirm" type="password" name="lgn_pwd2" value="[{$lgn_pwd2}]" /> <span class="req">*</span>
					</div>
		</li>
			   
		[{if $oView->isActive('PsLogin') }]
        <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
			        [{oxifcontent ident="oxagb" object="oCont"}]
                                  [{oxmultilang ident="ORDER_IAGREETOTERMS1" }] <a id="test_OrderOpenAGBBottom" rel="nofollow" href="[{ $oCont->getLink() }]" onclick="window.open('[{ $oCont->getLink()|oxaddparams:"plain=1"}]', 'agb_popup', 'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400');return false;" class="fontunderline">[{ oxmultilang ident="ORDER_IAGREETOTERMS2" }]</a> [{ oxmultilang ident="ORDER_IAGREETOTERMS3" }],&nbsp;
                                [{/oxifcontent}]
                                [{oxifcontent ident="oxrightofwithdrawal" object="oCont"}]
                                  [{oxmultilang ident="ORDER_IAGREETORIGHTOFWITHDRAWAL1" }] <a id="test_OrderOpenWithdrawalBottom" rel="nofollow" href="[{ $oCont->getLink() }]" onclick="window.open('[{ $oCont->getLink()|oxaddparams:"plain=1"}]', 'rightofwithdrawal_popup', 'resizable=yes,status=no,scrollbars=yes,menubar=no,width=620,height=400');return false;">[{ $oCont->oxcontents__oxtitle->value }]</a> [{ oxmultilang ident="ORDER_IAGREETORIGHTOFWITHDRAWAL3" }]
                                [{/oxifcontent}]
			        </div>
        </li>
        <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
			        <input type="hidden" name="ord_agb" value="0">
                    <input id="test_OrderConfirmAGBBottom" type="checkbox" class="chk" name="ord_agb" value="1"/>
			        </div>
        </li>
        [{/if}]
	</ul>
	<div class="box">
		<strong class="boxhead"><b>[{ oxmultilang ident="REGISTER_BILLINGADDRESS" }]</b></strong>
	</div>
	<ul class="edit rounded userform">
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_TITLE" }]</label></div>
			<div class="user-content">
				[{include file="inc/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value value2=$invadr.oxuser__oxsal}]
				[{if $oView->isFieldRequired(oxuser__oxsal) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_FIRSTNAME" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{$invadr.oxuser__oxfname }][{else}][{$oxcmp_user->oxuser__oxfname->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxfname) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_LASTNAME" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{$invadr.oxuser__oxlname }][{else}][{$oxcmp_user->oxuser__oxlname->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxlname) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_COMPANY" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany ) }][{$invadr.oxuser__oxcompany }][{else}][{$oxcmp_user->oxuser__oxcompany->value }][{/if}]"/>
				[{if $oView->isFieldRequired(oxuser__oxcompany) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="USER_STREET" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet ) }][{$invadr.oxuser__oxstreet }][{else}][{$oxcmp_user->oxuser__oxstreet->value }][{/if}]"/>
				[{if $oView->isFieldRequired(oxuser__oxstreet)}]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="USER_STREET_NR" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr ) }][{$invadr.oxuser__oxstreetnr }][{else}][{$oxcmp_user->oxuser__oxstreetnr->value }][{/if}]">
				[{if $oView->isFieldRequired(oxuser__oxstreetnr) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="USER_PLZ" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip ) }][{$invadr.oxuser__oxzip }][{else}][{$oxcmp_user->oxuser__oxzip->value }][{/if}]"/>
				[{if $oView->isFieldRequired(oxuser__oxzip)}]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="USER_CITY" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity ) }][{$invadr.oxuser__oxcity }][{else}][{$oxcmp_user->oxuser__oxcity->value }][{/if}]"/>
				[{if  $oView->isFieldRequired(oxuser__oxcity) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_VATID" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid ) }][{$invadr.oxuser__oxustid }][{else}][{$oxcmp_user->oxuser__oxustid->value }][{/if}]"> [{if $oView->isFieldRequired(oxuser__oxustid) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_ADDITIONALINFO" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{$invadr.oxuser__oxaddinfo }][{else}][{$oxcmp_user->oxuser__oxaddinfo->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxaddinfo) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_COUNTRY" }]</label></div>
			<div class="user-content">
				<select id="invCountrySelect" name="invadr[oxuser__oxcountryid]" >
                    <option value="">-</option>
                       [{foreach from=$oViewConf->getCountryList() item=country key=country_id}]
                          <option value="[{$country->oxcountry__oxid->value}]"[{if isset( $invadr.oxuser__oxcountryid ) && $invadr.oxuser__oxcountryid == $country->oxcountry__oxid->value}] selected[{elseif $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value}] selected[{/if}]>[{$country->oxcountry__oxtitle->value}]</option>
                        [{/foreach}]
				</select>
				[{if $oView->isFieldRequired(oxuser__oxcountryid) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_ADDITIONALINFO" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{$invadr.oxuser__oxaddinfo }][{else}][{$oxcmp_user->oxuser__oxaddinfo->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxaddinfo) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label></label></div>
			<div class="user-content">
				[{include file="inc/state_selector.snippet.tpl"
							countrySelectId="invCountrySelect"
							stateSelectName="invadr[oxuser__oxstateid]"
							selectedStateIdPrim=$invadr.oxuser__oxstateid
							selectedStateId=$oxcmp_user->oxuser__oxstateid->value
							}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_PHONE" }]</label></div>
			<div class="user-content">
				<input type="text" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{$invadr.oxuser__oxfon }][{else}][{$oxcmp_user->oxuser__oxfon->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxfon) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_FAX" }]</label></div>
			<div class="user-content">
				<input type="text"  name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax ) }][{$invadr.oxuser__oxfax }][{else}][{$oxcmp_user->oxuser__oxfax->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxfax) }]<span class="req">*</span>[{/if}]
			</div>
		</li>
		<li class="userli">
			<div class="user-title"><label>[{ oxmultilang ident="REGISTER_MOBIL" }]</label></div>
				<div class="user-content">
					<input type="text" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon ) }][{$invadr.oxuser__oxmobfon }][{else}][{$oxcmp_user->oxuser__oxmobfon->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxmobfon) }]<span class="req">*</span>[{/if}]
				</div>
			</li>
			<li class="userli">
				<div class="user-title"><label>[{ oxmultilang ident="REGISTER_PRIVATPHONE" }]</label></div>
				<div class="user-content">
						<input type="text" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]"/> [{if $oView->isFieldRequired(oxuser__oxprivfon) }]<span class="req">*</span>[{/if}]
						</div>
				</li>
				[{if $oViewConf->showBirthdayFields() }]
					<li class="userli">
						<div class="user-title"><label>[{ oxmultilang ident="USER_BIRTHDATE" }]</label></div>
						<div class="user-content">
							<input type="text" size="3" maxlength="2" name="invadr[oxuser__oxbirthdate][day]" value="[{if isset( $invadr.oxuser__oxbirthdate.day ) }][{$invadr.oxuser__oxbirthdate.day }][{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00"}][{$oxcmp_user->oxuser__oxbirthdate->value|date_format:"%d" }][{/if}]"/>&nbsp;&nbsp;
							<input type="text" size="3" maxlength="2" name="invadr[oxuser__oxbirthdate][month]" value="[{if isset( $invadr.oxuser__oxbirthdate.month ) }][{$invadr.oxuser__oxbirthdate.month }][{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }][{$oxcmp_user->oxuser__oxbirthdate->value|date_format:"%m" }][{/if}]"/>&nbsp;&nbsp;
							<input type="text" size="8" maxlength="4" name="invadr[oxuser__oxbirthdate][year]" value="[{if isset( $invadr.oxuser__oxbirthdate.year ) }][{$invadr.oxuser__oxbirthdate.year }][{elseif $oxcmp_user->oxuser__oxbirthdate->value && $oxcmp_user->oxuser__oxbirthdate->value != "0000-00-00" }][{$oxcmp_user->oxuser__oxbirthdate->value|date_format:"%Y" }][{/if}]"/>
								[{if $oView->isFieldRequired(oxuser__oxbirthdate) }]<span class="req">*</span>[{/if}]
						</div>
					</li> 
				[{/if}]
				<li class="userli">
					<div class="user-title"><label>[{ oxmultilang ident="REGISTER_NEWSLETTER" }]</label></div>
					<div class="user-content">
						<input type="hidden" name="blnewssubscribed" value="0"/>
						<input type="checkbox"  name="blnewssubscribed" value="1" [{if $oView->isNewsSubscribed() }]checked[{/if}]/>
						<span class="fs10">[{ oxmultilang ident="REGISTER_NEWSLETTER_MESSAGE" }]</span>
					</div>
				</li>
        </ul>

        <div class="box info">
        <div class="left"><input type="submit" class="btn-new" value="[{ oxmultilang ident='REGISTER_SEND' }]"></div>
    </div>
</form>
[{if $oView->isActive('PsLogin') }]
    </div>
    [{include file="_footer_plain.tpl" }]
[{else}]
    [{ insert name="oxid_tracker" title=$template_title }]
    [{include file="_footer.tpl" }]
[{/if}]
