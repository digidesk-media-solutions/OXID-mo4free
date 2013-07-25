[{assign var="template_title" value="ACCOUNT_NEWSLETTER_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location="ACCOUNT_NEWSLETTER_LOCATION"|oxmultilangassign|cat:$template_title}]
[{assign var="backlink" value=$oViewConf->getSelfLink()|cat:"cl=account"}]
[{include file="_titlesection.tpl" header="ACCOUNT_NEWSLETTER_SETTINGS"|oxmultilangassign back=$backlink }]
<div id="content">
<div class="box">
<strong id="test_newsletterSettingsHeader" class="boxhead">[{ oxmultilang ident="ACCOUNT_NEWSLETTER_MESSAGE" }]</strong>
</div>
[{if $oView->getSubscriptionStatus() != 0 }]
<div class="box info success">
    
        [{if $oView->getSubscriptionStatus() == 1 }]
          [{ oxmultilang ident="ACCOUNT_NEWSLETTER_SUBSCRIPTIONSUCCESS" }]
        [{else }]
          [{ oxmultilang ident="ACCOUNT_NEWSLETTER_SUBSCRIPTIONREJECT" }]
        [{/if }]
       
</div>
[{/if}]
    
        <form action="[{ $oViewConf->getSelfActionLink() }]" name="newsletter" method="post">
          
              [{ $oViewConf->getHiddenSid() }]
              [{ $oViewConf->getNavFormParams() }]
              <input type="hidden" name="fnc" value="subscribe">
              <input type="hidden" name="cl" value="account_newsletter">
              <ul class="edit rounded userform">
                 <li class="userli">
                    <div class="user-title"><label>[{ oxmultilang ident="ACCOUNT_NEWSLETTER_SUBSCRIPTION" }]</label></div>
			        <div class="user-content"><select name="status">
                <option value="1"   [{if $oView->isNewsletter() }]selected[{/if }] >[{ oxmultilang ident="ACCOUNT_NEWSLETTER_YES" }]</option>
                <option value="0"   [{if !$oView->isNewsletter() }]selected[{/if }] >[{ oxmultilang ident="ACCOUNT_NEWSLETTER_NO" }]</option>
              </select></div>
                 </li>
                 <li class="userli">
                    <div class="user-title"><label></label></div>
			        <div class="user-content"><input id="test_newsletterSettingsSave" type="submit" value="[{ oxmultilang ident="ACCOUNT_NEWSLETTER_SAVE" }]" class="btn-new"></div>
                 </li>
              </ul></form>
   <br>
</div>
</div>
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=account"}]
