[{assign var="template_title" value="ACCOUNT_MAIN_TITLE"|oxmultilangassign }]
[{include file="_header.tpl" title=$template_title location=$template_title}]
<div id="content">
[{include file="_titlesection.tpl" header="INC_ACCOUNT_HEADER_MYACCOUNT"|oxmultilangassign|cat:$oxcmp_user->oxuser__oxusername->value back=$oViewConf->getHomeLink()}]
[{include file="inc/account_header.tpl" }]
    [{*<div class="bar prevnext">
            <form action="[{ $oViewConf->getSelfActionLink() }]" name="order" method="post">
              <div>
                  [{ $oViewConf->getHiddenSid() }]
                  <input type="hidden" name="cl" value="start">
                  <div class="right">
                      <input id="test_BackToShop" type="submit" value="[{ oxmultilang ident="ACCOUNT_LOGIN_BACKTOSHOP" }]">
                  </div>
              </div>
            </form>
        </div>*}]
    </div>
[{insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl" backurl=$oViewConf->getSelfLink()|cat:"cl=service"}]
