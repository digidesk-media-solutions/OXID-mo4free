[{assign var="template_title" value="ACCOUNT_USERTITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location="ACCOUNT_USER_LOCATION"|oxmultilangassign|cat:$template_title}]

[{assign var="invadr" value=$oView->getInvoiceAddress()}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=account"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink }]
<div id="content">

[{include file="inc/error.tpl" Errorlist=$Errors.user errdisplay="inbox"}]
<div class="box info">
    <strong>[{ oxmultilang ident="ACCOUNT_USER_BILLINGADDRESS" }] <small>[{ oxmultilang ident="ACCOUNT_USER_COMPLETEMARKEDFIELDS" }]</small></strong>
</div>
  
    <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
     
          [{ $oViewConf->getHiddenSid() }]
          [{ $oViewConf->getNavFormParams() }]
          <input type="hidden" name="fnc" value="changeuser_testvalues">
          <input type="hidden" name="cl" value="account_user">
          <input type="hidden" name="CustomError" value='user'>
          
          <ul class="edit rounded userform">
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_EMAIL" }]</label></div>
			        <div class="user-content"><input type="text" name="invadr[oxuser__oxusername]" value="[{if isset( $invadr.oxuser__oxusername ) }][{ $invadr.oxuser__oxusername }][{else }][{ $oxcmp_user->oxuser__oxusername->value }][{/if }]"><span class="req">*</span></div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_TITLE" }]</label></div>
			        <div class="user-content">[{include file="inc/salutation.tpl" name="invadr[oxuser__oxsal]" value=$oxcmp_user->oxuser__oxsal->value }][{if $oView->isFieldRequired(oxuser__oxsal) }]<span class="req">*</span>[{/if }]</div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_FIRSTNAME" }]</label></div>
			        <div class="user-content"><input type="text" name="invadr[oxuser__oxfname]" value="[{if isset( $invadr.oxuser__oxfname ) }][{ $invadr.oxuser__oxfname }][{else }][{ $oxcmp_user->oxuser__oxfname->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxfname) }]<span class="req">*</span>[{/if }]</div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_LASTNAME" }]</label></div>
			        <div class="user-content"> <input type="text" name="invadr[oxuser__oxlname]" value="[{if isset( $invadr.oxuser__oxlname ) }][{ $invadr.oxuser__oxlname }][{else }][{ $oxcmp_user->oxuser__oxlname->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxlname) }]<span class="req">*</span>[{/if }]</div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_COMPANY" }]</label></div>
			        <div class="user-content"> <input type="text" name="invadr[oxuser__oxcompany]" value="[{if isset( $invadr.oxuser__oxcompany ) }][{ $invadr.oxuser__oxcompany }][{else }][{ $oxcmp_user->oxuser__oxcompany->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxcompany) }]<span class="req">*</span>[{/if }]</div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_STREET" }]</label></div>
			        <div class="user-content"> <input type="text" name="invadr[oxuser__oxstreet]" value="[{if isset( $invadr.oxuser__oxstreet ) }][{ $invadr.oxuser__oxstreet }][{else }][{ $oxcmp_user->oxuser__oxstreet->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxstreet)}]<span class="req">*</span>[{/if }]</div>
                 </li>
                  <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_STREET_NR" }]</label></div>
			        <div class="user-content"> <input type="text"  name="invadr[oxuser__oxstreetnr]" value="[{if isset( $invadr.oxuser__oxstreetnr ) }][{ $invadr.oxuser__oxstreetnr }][{else}][{ $oxcmp_user->oxuser__oxstreetnr->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxstreetnr) }]<span class="req">*</span>[{/if}]</div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_PLZ" }]</label></div>
			        <div class="user-content">
                          <input type="text" name="invadr[oxuser__oxzip]" value="[{if isset( $invadr.oxuser__oxzip ) }][{ $invadr.oxuser__oxzip }][{else }][{ $oxcmp_user->oxuser__oxzip->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxzip)}]<span class="req">*</span>[{/if }]
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="USER_CITY" }]</label></div>
			        <div class="user-content">
              <input type="text" name="invadr[oxuser__oxcity]" value="[{if isset( $invadr.oxuser__oxcity ) }][{ $invadr.oxuser__oxcity }][{else }][{ $oxcmp_user->oxuser__oxcity->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxcity) }]<span class="req">*</span>[{/if }]
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_VATIDNO" }]</label></div>
			        <div class="user-content">
               <input type="text" name="invadr[oxuser__oxustid]" value="[{if isset( $invadr.oxuser__oxustid ) }][{ $invadr.oxuser__oxustid }][{else}][{ $oxcmp_user->oxuser__oxustid->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxustid) }]<span class="req">*</span>[{/if }]
                 </li>
                  <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_ADDITIONALINFO" }]</label></div>
			        <div class="user-content">
               <input type="text" name="invadr[oxuser__oxaddinfo]" value="[{if isset( $invadr.oxuser__oxaddinfo ) }][{ $invadr.oxuser__oxaddinfo }][{else }][{ $oxcmp_user->oxuser__oxaddinfo->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxaddinfo) }]<span class="req">*</span>[{/if }]
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_COUNTRY" }]</label></div>
			        <div class="user-content">
               <select id="invCountrySelect" name="invadr[oxuser__oxcountryid]">
                <option value="">-</option>
                [{foreach from=$oViewConf->getCountryList() item=country key=country_id }]
                  <option value="[{ $country->oxcountry__oxid->value }]"  [{if $oxcmp_user->oxuser__oxcountryid->value == $country->oxcountry__oxid->value }]selected[{/if }]>[{ $country->oxcountry__oxtitle->value }]</option>
                [{/foreach }]
              </select>[{if $oView->isFieldRequired(oxuser__oxcountryid) }]<span class="req">*</span>[{/if }]
                 </li>
                   
                 [{if $invadr.oxuser__oxstateid }]
			     <li class="userli">
							<div class="user-title"><label></label></div>
							<div class="user-content">
							     [{include file="inc/state_selector.snippet.tpl"
                        countrySelectId="invCountrySelect"
                        stateSelectName="invadr[oxuser__oxstateid]"
                        selectedStateIdPrim=$invadr.oxuser__oxstateid
                        selectedStateId=$oxcmp_user->oxuser__oxstateid
                     }]
	                    </div>
        
		        </li>
			    [{/if}]   
			    <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_PHONE" }]</label></div>
			        <div class="user-content">
               <input type="text" name="invadr[oxuser__oxfon]" value="[{if isset( $invadr.oxuser__oxfon ) }][{ $invadr.oxuser__oxfon }][{else }][{ $oxcmp_user->oxuser__oxfon->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxfon) }]<span class="req">*</span>[{/if }]
                 </li>
                  <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_FAX" }]</label></div>
			        <div class="user-content">
               <input type="text" name="invadr[oxuser__oxfax]" value="[{if isset( $invadr.oxuser__oxfax ) }][{ $invadr.oxuser__oxfax }][{else }][{ $oxcmp_user->oxuser__oxfax->value }][{/if }]">[{if $oView->isFieldRequired(oxuser__oxfax) }]<span class="req">*</span>[{/if }]
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_CELLUARPHONE" }]</label></div>
			        <div class="user-content">
              <input type="text" name="invadr[oxuser__oxmobfon]" value="[{if isset( $invadr.oxuser__oxmobfon ) }][{$invadr.oxuser__oxmobfon }][{else}][{$oxcmp_user->oxuser__oxmobfon->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxmobfon) }]<span class="req">*</span>[{/if}]
                 </li>
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_EVENINGPHONE" }]</label></div>
			        <div class="user-content">
              <input type="text" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxprivfon) }]<span class="req">*</span>[{/if}]
                 </li>
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
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_EVENINGPHONE" }]</label></div>
			        <div class="user-content">
              <input type="text" name="invadr[oxuser__oxprivfon]" value="[{if isset( $invadr.oxuser__oxprivfon ) }][{$invadr.oxuser__oxprivfon }][{else}][{$oxcmp_user->oxuser__oxprivfon->value }][{/if}]">[{if $oView->isFieldRequired(oxuser__oxprivfon) }]<span class="req">*</span>[{/if}]
                 </li>
                 [{if $invadr.oxuser__oxusername || $invadr.oxuser__oxusername == $oxcmp_user->oxuser__oxusername->value}]
                    <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="INC_CMP_LOGIN_RIGHT_PWD" }]</label></div>
			        <div class="user-content">
                          <input type="password" size="37" name="user_password"><span class="req">*</span>
                    </li>
                 [{/if}]
                    <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
                          <input id="test_accUserSaveTop" type="submit" name="save" class="btn-new" value="[{ oxmultilang ident="ACCOUNT_USER_SAVE" }]"><span class="req">*</span>
                    </li>
                 
              </ul>
          
           [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
           <div class="box info">
                <strong>[{ oxmultilang ident="ACCOUNT_USER_SHIPPINGADDRESSES" }]</strong>
           </div>
          <ul class="edit rounded userform">
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_ADDRESSES" }]</label></div>
			        <div class="user-content">
                          <select name="oxaddressid" onchange="oxid.form.reload(this.value === '-1','order','account_user','');oxid.form.clear(this.value !== '-1','order',/oxaddress__/);">
                <option value="-1">[{ oxmultilang ident="ACCOUNT_USER_NEWADDRESS" }]</option>
                [{foreach from=$oxcmp_user->getUserAddresses() item=address }]
                  <option value="[{ $address->oxaddress__oxid->value }]" [{if $address->isSelected()}]SELECTED[{/if }]>[{$address}]</option>
                [{/foreach }]
              </select>
            </li>
             <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_TITLE2" }]</label></div>
			        <div class="user-content">
                          [{include file="inc/salutation.tpl" name="deladr[oxaddress__oxsal]" value=$delivadr->oxaddress__oxsal->value value2=$deladr.oxaddress__oxsal }][{if $oView->isFieldRequired(oxaddress__oxsal) }]<span class="req">*</span>[{/if }]
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
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_COMPANY2" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxcompany]" value="[{if isset( $deladr.oxaddress__oxcompany ) }][{ $deladr.oxaddress__oxcompany }][{else}][{ $delivadr->oxaddress__oxcompany->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxcompany) }]<span class="req">*</span>[{/if }]
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
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_ADDITIONALINFO2" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxaddinfo]" value="[{if isset( $deladr.oxaddress__oxaddinfo ) }][{ $deladr.oxaddress__oxaddinfo }][{else}][{ $delivadr->oxaddress__oxaddinfo->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxaddinfo) }]<span class="req">*</span>[{/if }]
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_COUNTRY2" }]</label></div>
			        <div class="user-content">
                          <select id="delCountrySelect" name="deladr[oxaddress__oxcountryid]">
                <option value="">-</option>
                [{foreach from=$oViewConf->getCountryList() item=country key=country_id }]
                  <option value="[{ $country->oxcountry__oxid->value }]" [{if isset( $deladr.oxaddress__oxcountryid ) && $deladr.oxaddress__oxcountryid == $country->oxcountry__oxid->value }]selected[{elseif $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxtitle->value or $delivadr->oxaddress__oxcountry->value == $country->oxcountry__oxid->value or $delivadr->oxaddress__oxcountryid->value == $country->oxcountry__oxid->value }]selected[{/if }]>[{ $country->oxcountry__oxtitle->value }]</option>
                [{/foreach }]
              </select>[{if $oView->isFieldRequired(oxaddress__oxcountryid) }]<span class="req">*</span>[{/if }]
            </li>
            [{if $deladr.oxaddress__oxstateid }]
            <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
                           [{include file="inc/state_selector.snippet.tpl"
                        countrySelectId="delCountrySelect"
                        stateSelectName="deladr[oxaddress__oxstateid]"
                        selectedStateIdPrim=$deladr.oxaddress__oxstateid
                        selectedStateId=$delivadr->oxaddress__oxstateid->value
                     }]
            </li>
            [{/if}]
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_PHONE2" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxfon]" value="[{if isset( $deladr.oxaddress__oxfon ) }][{ $deladr.oxaddress__oxfon }][{else}][{ $delivadr->oxaddress__oxfon->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxfon) }]<span class="req">*</span>[{/if }]
            </li>
             <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_USER_FAX2" }]</label></div>
			        <div class="user-content">
                           <input type="text" name="deladr[oxaddress__oxfax]" value="[{if isset( $deladr.oxaddress__oxfax ) }][{ $deladr.oxaddress__oxfax }][{else}][{ $delivadr->oxaddress__oxfax->value }][{/if }]">[{if $oView->isFieldRequired(oxaddress__oxfax) }]<span class="req">*</span>[{/if }]
            </li>
             <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
                           <input type="hidden" name="blshowshipaddress" value="1">
              <input id="test_accUserSaveBottom" type="submit" class="btn-new" name="save" value="[{ oxmultilang ident="ACCOUNT_USER_SAVE2" }]">
            </li>
          </ul>
                
    </form>



</div>

[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=account"}]
