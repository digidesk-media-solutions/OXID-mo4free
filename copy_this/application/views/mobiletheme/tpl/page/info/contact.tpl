[{assign var="template_title" value="CONTACT_TITLECONTACT"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=content"}]
[{include file="_titlesection.tpl" header=$template_title back=$backlink}]
<div id="content">
<div class="box info">
    <strong id="test_companyName" class="boxhead">[{ $oxcmp_shop->oxshops__oxcompany->value }]</strong>
</div>
<div class="box info">
  [{ $oxcmp_shop->oxshops__oxzip->value }]&nbsp;[{ $oxcmp_shop->oxshops__oxcity->value }]<br>
  [{ $oxcmp_shop->oxshops__oxstreet->value }]<br>
  [{ $oxcmp_shop->oxshops__oxcountry->value }]<br><br>

  [{ if $oxcmp_shop->oxshops__oxtelefon->value}]
    [{ oxmultilang ident="CONTACT_PHONE" }] [{ $oxcmp_shop->oxshops__oxtelefon->value }]<br>
  [{/if}]

  [{ if $oxcmp_shop->oxshops__oxtelefax->value}]
    [{ oxmultilang ident="CONTACT_FAX" }] [{ $oxcmp_shop->oxshops__oxtelefax->value }]<br>
  [{/if}]

  [{ if $oxcmp_shop->oxshops__oxinfoemail->value}]
    [{ oxmultilang ident="CONTACT_EMAIL" }] [{oxmailto address=$oxcmp_shop->oxshops__oxinfoemail->value encode="javascript"}]<br>
  [{/if}]
</div>
<div class="box info">
<strong id="test_contactHeader" class="boxhead">[{ oxmultilang ident="CONTACT_CONTACT" }]</strong>
</div>
  [{ if !$oView->getContactSendStatus() }]
    [{assign var="editval" value=$oView->getUserData() }]
      <form action="[{ $oViewConf->getSslSelfLink() }]" method="post">
        <div>
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="fnc" value="send"/>
            <input type="hidden" name="cl" value="contact"/>
            [{assign var="oCaptcha" value=$oView->getCaptcha() }]
            <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
        </div>
        <ul class="edit rounded userform">
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_TITLE" }]</label></div>
			        <div class="user-content">
                          [{include file="inc/salutation.tpl" name="editval[oxuser__oxsal]" value=$editval.oxuser__oxsal }]
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_FIRSTNAME" }]</label></div>
			        <div class="user-content">
                          <input type="text" name="editval[oxuser__oxfname]" value="[{$editval.oxuser__oxfname}]" class="defaultcontent"><span class="req">*</span>
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_LASTNAME" }]</label></div>
			        <div class="user-content">
                          <input type="text" name="editval[oxuser__oxlname]" value="[{$editval.oxuser__oxlname}]" class="defaultcontent"><span class="req">*</span>
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_EMAIL2" }]</label></div>
			        <div class="user-content">
                          <input id="test_contactEmail" type="text" name="editval[oxuser__oxusername]"   value="[{$editval.oxuser__oxusername}]" class="defaultcontent"><span class="req">*</span>
            </li>
             <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_SUBJECT" }]</label></div>
			        <div class="user-content">
                          <input type="text" name="c_subject" value="[{$oView->getContactSubject()}]" class="defaultcontent"><span class="req">*</span>
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_MESSAGE" }]</label></div>
			        <div class="user-content">
                          <textarea name="c_message">[{$oView->getContactMessage()}]</textarea>
            </li>
            <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="CONTACT_VERIFICATIONCODE" }]</label></div>
			        <div class="user-content">
                          [{assign var="oCaptcha" value=$oView->getCaptcha() }]
               [{if $oCaptcha->isImageVisible()}]
                 <div class="left"><img src="[{$oCaptcha->getImageUrl()}]" alt=""></div>
               [{else}]
                 <div id="test_verificationCode" class="verification_code">[{$oCaptcha->getText()}]</div>
               [{/if}]
              
            </li>
            <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
                          <input type="text" name="c_mac" value=""/><span class="req">*</span>
            </li>
            <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content">
                          <input id="test_contactSend" type="submit" class="btn-new" value="[{ oxmultilang ident="CONTACT_SEND" }]">
            </li>
        </ul>
        <br/>
      </form>
  [{else}]
    [{ oxmultilang ident="CONTACT_THANKYOU1" }] [{ $oxcmp_shop->oxshops__oxname->value }][{ oxmultilang ident="CONTACT_THANKYOU2" }]<br /><br />
  [{/if}]
</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=service"}]
