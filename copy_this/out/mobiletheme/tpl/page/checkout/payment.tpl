[{assign var="template_title" value="PAYMENT_TITLE"|oxmultilangassign}]
[{include file="_header.tpl" title=$template_title location=$template_title}]

<!-- ordering steps -->
[{*include file="inc/steps_item.tpl" highlight=3*}]
[{assign var="currency" value=$oView->getActCurrency() }]
<div id="content">
[{ if $oView->getAllSetsCnt() > 1 }][{assign var="header" value="PAYMENT_SELECTSHIPPING"|oxmultilangassign }][{else}][{assign var="header" value="PAYMENT_SELECTEDSHIPPING"|oxmultilangassign }][{/if}]
[{if $smarty.post.continue || $smarty.get.continue}]
    [{assign var="continue" value=true}]
[{/if}]

[{if $oxcmp_user->oxuser__oxactive->value && !$continue}]
         [{assign var="newurl" value=$oViewConf->getSslSelfLink()|cat:"cl=user"}]
 [{else}]
       [{assign var="newurl" value=$oViewConf->getSslSelfLink()|cat:"cl=payment"}]
       [{assign var="header" value="PAYMENT_PAYMENT"|oxmultilangassign }]
  [{/if}]
[{include file="_titlesection.tpl" header=$header back=$newurl }]
<div class="contMain"><!-- contMain starts--> 
  
  <div [{if $continue}]style="display:none;"[{/if}]><!-- shipping div starts-->  
      [{ if $oView->getAllSets() }]
       
       <ul class="ul-navi">
            [{foreach key=sShipID from=$oView->getAllSets() item=oShippingSet name=ShipSetSelect}]
            <li [{if $oShippingSet->blSelected}]class="active"[{/if}]>
            <form action="[{ $oViewConf->getSslSelfLink() }]" name="shipping" id="shipping" method="post">
                   [{ $oViewConf->getHiddenSid() }]
                  [{ $oViewConf->getNavFormParams() }]
                  <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                  <input type="hidden" name="fnc" value="changeshipping">
                  <input type="hidden" name="sShipSet" value="[{$sShipID}]"/> 
                  <input type="submit" value="[{ $oShippingSet->oxdeliveryset__oxtitle->value }]" class="sub-link"/>
            </form>
            </li>
            [{/foreach}]
            
        </ul>

      [{/if}]
  
  
  
      [{ if $oxcmp_basket->getDeliveryCosts() }]
      <div class="blocktitle block"><strong>[{ oxmultilang ident="PAYMENT_CHARGE" }]&nbsp;<span class="ship-price">[{ $oxcmp_basket->getFDeliveryCosts() }] [{ $currency->sign}]</span></strong></div>
      [{ /if}]
      
      <div class="footer_basket block clearfix">
                    
	                    <div class="prev_step_on">
	                            <a href="[{$newurl}]" class="three-line btn-new">[{ oxmultilang ident="CHECKOUT_USER" }]</a>
                        </div>
                        <div class="next_step_on">
                             <form action="[{ $oViewConf->getSslSelfLink() }]" name="zsshipping" id="zsshipping" method="post">
                                [{ $oViewConf->getHiddenSid() }]
                                [{ $oViewConf->getNavFormParams() }]
                                 <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
                                <input id="test_UserNextStepBottom" name="continue" class="btn-new" type="submit" value="[{oxmultilang ident="CONTINUE"}]">
                             </form>
                        </div>
                    
       </div>
      
     
      
   </div><!-- shipping div ends-->  
 
<div [{if !$continue}]style="display:none;"[{/if}]><!-- payment div starts-->  
  [{assign var="iPayError" value=$oView->getPaymentError() }]

  [{ if $iPayError == 1}]
    <div class="box err">[{ oxmultilang ident="PAYMENT_COMLETEALLFIELDS" }]</div>
  [{ elseif $iPayError == 2}]
    <div class="box err">[{ oxmultilang ident="PAYMENT_AUTHORIZATIONFAILED" }]</div>
  [{ elseif $iPayError == 4 }]
    <div class="box err">[{ oxmultilang ident="PAYMENT_UNAVAILABLESHIPPING" }]</div>
  [{ elseif $iPayError == 5 }]
    <div class="box err">[{ oxmultilang ident="PAYMENT_UNAVAILABLEPAYMENT" }]</div>
  [{ elseif $iPayError == 6 }]
    <div class="box err">[{ oxmultilang ident="PAYMENT_UNAVAILABLETSPROTECTION" }]</div>
  [{ elseif $iPayError > 6 }]
    <!--Add custom error message here-->
    <div class="box err">[{ oxmultilang ident="PAYMENT_UNAVAILABLEPAYMENT" }]</div>
  [{ elseif $iPayError == -1}]
    <div class="box err">[{ oxmultilang ident="PAYMENT_ERRUNAVAILABLEPAYMENT" }] "[{ $oView->getPaymentErrorText() }]").</div>
  [{ elseif $iPayError == -2}]
    <div class="box err">[{ oxmultilang ident="PAYMENT_NOSHIPPINGFOUND" }]</div>
  [{ elseif $iPayError == -3}]
    <div class="box err">[{ oxmultilang ident="PAYMENT_SELECTANOTHERPAYMENT" }]</div>
  [{/if}]



        <form action="[{ $oViewConf->getSslSelfLink() }]" name="order" method="post">
          <div>
              [{ $oViewConf->getHiddenSid() }]
              [{ $oViewConf->getNavFormParams() }]
              <input type="hidden" name="cl" value="[{ $oViewConf->getActiveClassName() }]">
              <input type="hidden" name="fnc" value="validatepayment">
          </div>
          
         

            [{if $oView->getPaymentList()}]
            [{*<div class="titleSec"><span class="titlelbl"><strong>[{ oxmultilang ident="PAYMENT_PAYMENT" }]</strong></span></div>*}]
            
              
             
             
                 [{ assign var="inptcounter" value="-1"}]
                 [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                  [{ assign var="inptcounter" value="`$inptcounter+1`"}]
                  
                 
                    [{if $sPaymentID == "oxidcashondel"}]
                    
                        <ul class="edit rounded userform">
						<li class="userli">
							<div class="user-title"><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]/><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}]</b></label></div>
					    </li>
						<li class="userli">
							<div class="user-title">[{ oxmultilang ident="PAYMENT_PLUSCODCHARGE1" }] [{ $paymentmethod->fAddPaymentSum }] [{ $currency->sign}] [{ oxmultilang ident="PAYMENT_PLUSCODCHARGE2" }]</div>
</li>
						</ul>
                                               
                    [{elseif $sPaymentID == "oxidcreditcard"}]
                    
                    [{ assign var="dynvalue" value=$oView->getDynValue()}]
                   <div class="box info"> 
                    <div class="userli">
							        <div class="user-title"><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]/><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}]</b></label></div>
				     </div>
                       <ul class="edit rounded userform">
                           
				            <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_CREDITCARD" }]</label></div>
							        <div class="user-content"><select name="dynvalue[kktype]">
                                    <option value="mcd" [{ if ($dynvalue.kktype == "mcd" || !$dynvalue.kktype)}]selected[{/if}]>[{ oxmultilang ident="PAYMENT_MASTERCARD" }]</option>
                                        <option value="vis" [{ if $dynvalue.kktype == "vis"}]selected[{/if}]>[{ oxmultilang ident="PAYMENT_VISA" }]</option>
                                      <!--
                                      <option value="amx" [{ if $dynvalue.kktype == "amx"}]selected[{/if}]>American Express</option>
                                      <option value="dsc" [{ if $dynvalue.kktype == "dsc"}]selected[{/if}]>Discover</option>
                                      <option value="dnc" [{ if $dynvalue.kktype == "dnc"}]selected[{/if}]>Diners Club</option>
                                      <option value="jcb" [{ if $dynvalue.kktype == "jcb"}]selected[{/if}]>JCB</option>
                                      <option value="swi" [{ if $dynvalue.kktype == "swi"}]selected[{/if}]>Switch</option>
                                      <option value="dlt" [{ if $dynvalue.kktype == "dlt"}]selected[{/if}]>Delta</option>
                                      <option value="enr" [{ if $dynvalue.kktype == "enr"}]selected[{/if}]>EnRoute</option>
                                      -->
                                        </select>
                                    </div>
                            </li>
                            <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_NUMBER" }]</label></div>
							        <div class="user-content"><input type="text" class="payment_text" size="20" maxlength="64" name="dynvalue[kknumber]" value="[{ $dynvalue.kknumber }]"/></div>
                            </li>
                            <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_ACCOUNTHOLDER" }]</label></div>
							        <div class="user-content"><input type="text" size="20" maxlength="64" name="dynvalue[kkname]" value="[{ if $dynvalue.kkname }][{ $dynvalue.kkname }][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]"/><br>
                        <div class="fs10 def_color_1">[{ oxmultilang ident="PAYMENT_DIFFERENTBILLINGADDRESS" }]</div></div>
                            </li>
                            <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_VALIDUNTIL" }]</label></div>
							        <div class="user-content"><span><select name="dynvalue[kkmonth]">
                          <option [{ if $dynvalue.kkmonth == "01"}]selected[{/if}]>01</option>
                          <option [{ if $dynvalue.kkmonth == "02"}]selected[{/if}]>02</option>
                          <option [{ if $dynvalue.kkmonth == "03"}]selected[{/if}]>03</option>
                          <option [{ if $dynvalue.kkmonth == "04"}]selected[{/if}]>04</option>
                          <option [{ if $dynvalue.kkmonth == "05"}]selected[{/if}]>05</option>
                          <option [{ if $dynvalue.kkmonth == "06"}]selected[{/if}]>06</option>
                          <option [{ if $dynvalue.kkmonth == "07"}]selected[{/if}]>07</option>
                          <option [{ if $dynvalue.kkmonth == "08"}]selected[{/if}]>08</option>
                          <option [{ if $dynvalue.kkmonth == "09"}]selected[{/if}]>09</option>
                          <option [{ if $dynvalue.kkmonth == "10"}]selected[{/if}]>10</option>
                          <option [{ if $dynvalue.kkmonth == "11"}]selected[{/if}]>11</option>
                          <option [{ if $dynvalue.kkmonth == "12"}]selected[{/if}]>12</option>
                        </select></span><span>

                        <select name="dynvalue[kkyear]">
                        [{foreach from=$oView->getCreditYears() item=year}]
                            <option [{ if $dynvalue.kkyear == $year}]selected[{/if}]>[{$year}]</option>
                        [{/foreach}]
                        </select></span></div>
                            </li>
                            <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_SECURITYCODE" }]</label></div>
							        <div class="user-content"><input type="text" class="payment_text" size="20" maxlength="64" name="dynvalue[kkpruef]" value="[{ $dynvalue.kkpruef }]"/><br>
                        <div class="fs10 def_color_1">[{ oxmultilang ident="PAYMENT_SECURITYCODEDESCRIPTION" }]</div></div>
                            </li>
					    </ul>
                   </div>
                    
                                           
                       
                      [{elseif $sPaymentID == "oxiddebitnote"}]
                    [{ assign var="dynvalue" value=$oView->getDynValue()}]
                    <div class="box info">
                    <div class="userli">
							            <div class="user-title"><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]/><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}]</b></label></div>
				                </div>
                        <ul class="edit rounded userform">
                                
				                <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_BANK" }]</label></div>
							        <div class="user-content"><input id="test_Payment_[{$sPaymentID}]_1" type="text" size="20" maxlength="64" name="dynvalue[lsbankname]" value="[{ $dynvalue.lsbankname }]"/></div>
                                </li>
                                <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_ROUTINGNUMBER" }]</label></div>
							        <div class="user-content"><input type="text" size="20" maxlength="64" name="dynvalue[lsblz]" value="[{ $dynvalue.lsblz }]"/></div>
                                </li>
                                <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_ACCOUNTNUMBER" }]</label></div>
							        <div class="user-content"><input type="text" size="20" maxlength="64" name="dynvalue[lsktonr]" value="[{ $dynvalue.lsktonr }]"/></div>
                                </li>
                                <li class="userli">
							        <div class="user-title"><label>[{ oxmultilang ident="PAYMENT_ACCOUNTHOLDER2" }]</label></div>
							        <div class="user-content"><input type="text" name="dynvalue[lsktoinhaber]" value="[{ if $dynvalue.lsktoinhaber }][{ $dynvalue.lsktoinhaber }][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]"/></div></li>
				         </ul>
                     </div>
                                
                       
                       [{else}] 
                       
                       <div class="box info">
                       <div class="userli">
							            <div class="user-title"><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]/><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}] [{ if $paymentmethod->fAddPaymentSum }]([{ $paymentmethod->fAddPaymentSum }] [{ $currency->sign}])[{/if}]</b></label></div>
				       </div>
				       [{if $paymentmethod->getDynValues()}]
				       <ul class="edit rounded userform">
				       [{foreach from=$paymentmethod->getDynValues() item=value name=PaymentDynValues}]
				            <li class="userli">
				                 <div class="user-title"><label>[{ $value->name}]</label></div>
							        <div class="user-content"><input id="test_Payment_[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]" type="text" class="payment_text" size="20" maxlength="64" name="dynvalue[[{$value->name}]]" value="[{ $value->value}]"/></div>
				            </li>
				        [{/foreach}]
				        [{if $paymentmethod->oxpayments__oxlongdesc->value}]
				        <li class="userli">
				                 <div class="user-title">[{$paymentmethod->oxpayments__oxlongdesc->value}]</div>
				        </li>
				        [{/if}]
				        </ul> 
				        [{/if}]   
				        [{if $inptcounter > -1 && $inptcounter < ($oView->getPaymentCnt()-1) }]
                            <div class="dot_sep 3colspan"></div>
                        [{/if}]   </div>
                      
                    [{/if}]
                 [{/foreach}]
             
              
              [{*
              <div class="box info">

              <table class="form" style="width:92%">
                [{ assign var="inptcounter" value="-1"}]
                [{foreach key=sPaymentID from=$oView->getPaymentList() item=paymentmethod name=PaymentSelect}]
                  [{ assign var="inptcounter" value="`$inptcounter+1`"}]
                  [{if $sPaymentID == "oxidcashondel"}]
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]></td>
                      <td id="test_PaymentDesc_[{$smarty.foreach.PaymentSelect.iteration}]" colspan="2"><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}]</b></label></td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td colspan="2">[{ oxmultilang ident="PAYMENT_PLUSCODCHARGE1" }] [{ $paymentmethod->fAddPaymentSum }] [{ $currency->sign}] [{ oxmultilang ident="PAYMENT_PLUSCODCHARGE2" }]</td>
                    </tr>
                  [{elseif $sPaymentID == "oxidcreditcard"}]
                    [{ assign var="dynvalue" value=$oView->getDynValue()}]
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]></td>
                      <td id="test_PaymentDesc_[{$smarty.foreach.PaymentSelect.iteration}]" colspan="2"><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}]</b></label></td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td valign="top"><label>[{ oxmultilang ident="PAYMENT_CREDITCARD" }]</label></td>
                      <td>
                        <select name="dynvalue[kktype]">
                          <option value="mcd" [{ if ($dynvalue.kktype == "mcd" || !$dynvalue.kktype)}]selected[{/if}]>[{ oxmultilang ident="PAYMENT_MASTERCARD" }]</option>
                          <option value="vis" [{ if $dynvalue.kktype == "vis"}]selected[{/if}]>[{ oxmultilang ident="PAYMENT_VISA" }]</option>
                          <!--
                          <option value="amx" [{ if $dynvalue.kktype == "amx"}]selected[{/if}]>American Express</option>
                          <option value="dsc" [{ if $dynvalue.kktype == "dsc"}]selected[{/if}]>Discover</option>
                          <option value="dnc" [{ if $dynvalue.kktype == "dnc"}]selected[{/if}]>Diners Club</option>
                          <option value="jcb" [{ if $dynvalue.kktype == "jcb"}]selected[{/if}]>JCB</option>
                          <option value="swi" [{ if $dynvalue.kktype == "swi"}]selected[{/if}]>Switch</option>
                          <option value="dlt" [{ if $dynvalue.kktype == "dlt"}]selected[{/if}]>Delta</option>
                          <option value="enr" [{ if $dynvalue.kktype == "enr"}]selected[{/if}]>EnRoute</option>
                          -->
                        </select>
                      </td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td><label>[{ oxmultilang ident="PAYMENT_NUMBER" }]</label></td>
                      <td>
                        <input type="text" class="payment_text" size="20" maxlength="64" name="dynvalue[kknumber]" value="[{ $dynvalue.kknumber }]">
                      </td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td valign="top"><label>[{ oxmultilang ident="PAYMENT_ACCOUNTHOLDER" }]</label></td>
                      <td>
                        <input type="text" size="20" maxlength="64" name="dynvalue[kkname]" value="[{ if $dynvalue.kkname }][{ $dynvalue.kkname }][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]"><br>
                        <div class="fs10 def_color_1">[{ oxmultilang ident="PAYMENT_DIFFERENTBILLINGADDRESS" }]</div>
                      </td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td><label>[{ oxmultilang ident="PAYMENT_VALIDUNTIL" }]</label></td>
                      <td>
                        <select name="dynvalue[kkmonth]">
                          <option [{ if $dynvalue.kkmonth == "01"}]selected[{/if}]>01</option>
                          <option [{ if $dynvalue.kkmonth == "02"}]selected[{/if}]>02</option>
                          <option [{ if $dynvalue.kkmonth == "03"}]selected[{/if}]>03</option>
                          <option [{ if $dynvalue.kkmonth == "04"}]selected[{/if}]>04</option>
                          <option [{ if $dynvalue.kkmonth == "05"}]selected[{/if}]>05</option>
                          <option [{ if $dynvalue.kkmonth == "06"}]selected[{/if}]>06</option>
                          <option [{ if $dynvalue.kkmonth == "07"}]selected[{/if}]>07</option>
                          <option [{ if $dynvalue.kkmonth == "08"}]selected[{/if}]>08</option>
                          <option [{ if $dynvalue.kkmonth == "09"}]selected[{/if}]>09</option>
                          <option [{ if $dynvalue.kkmonth == "10"}]selected[{/if}]>10</option>
                          <option [{ if $dynvalue.kkmonth == "11"}]selected[{/if}]>11</option>
                          <option [{ if $dynvalue.kkmonth == "12"}]selected[{/if}]>12</option>
                        </select>&nbsp;/&nbsp;

                        <select name="dynvalue[kkyear]">
                        [{foreach from=$oView->getCreditYears() item=year}]
                            <option [{ if $dynvalue.kkyear == $year}]selected[{/if}]>[{$year}]</option>
                        [{/foreach}]
                        </select>
                      </td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td valign="top"><label>[{ oxmultilang ident="PAYMENT_SECURITYCODE" }]</label></td>
                      <td>
                        <input type="text" class="payment_text" size="20" maxlength="64" name="dynvalue[kkpruef]" value="[{ $dynvalue.kkpruef }]"><br>
                        <div class="fs10 def_color_1">[{ oxmultilang ident="PAYMENT_SECURITYCODEDESCRIPTION" }]</div>
                      </td>
                    </tr>
                  [{elseif $sPaymentID == "oxiddebitnote"}]
                    [{ assign var="dynvalue" value=$oView->getDynValue()}]
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]></td>
                      <td id="test_PaymentDesc_[{$smarty.foreach.PaymentSelect.iteration}]" colspan="2"><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}]</b></label></td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td><label>[{ oxmultilang ident="PAYMENT_BANK" }]</label></td>
                      <td><input id="test_Payment_[{$sPaymentID}]_1" type="text" size="20" maxlength="64" name="dynvalue[lsbankname]" value="[{ $dynvalue.lsbankname }]"></td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td><label>[{ oxmultilang ident="PAYMENT_ROUTINGNUMBER" }]</label></td>
                      <td><input type="text" size="20" maxlength="64" name="dynvalue[lsblz]" value="[{ $dynvalue.lsblz }]"></td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td><label>[{ oxmultilang ident="PAYMENT_ACCOUNTNUMBER" }]</label></td>
                      <td><input type="text" size="20" maxlength="64" name="dynvalue[lsktonr]" value="[{ $dynvalue.lsktonr }]"></td>
                    </tr>
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td></td>
                      <td><label>[{ oxmultilang ident="PAYMENT_ACCOUNTHOLDER2" }]</label></td>
                      <td><input type="text" size="20" maxlength="64" name="dynvalue[lsktoinhaber]" value="[{ if $dynvalue.lsktoinhaber }][{ $dynvalue.lsktoinhaber }][{else}][{$oxcmp_user->oxuser__oxfname->value}] [{$oxcmp_user->oxuser__oxlname->value}][{/if}]"></td>
                    </tr>
                  [{else}]
                    <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                      <td><input id="test_Payment_[{$sPaymentID}]" type="radio" name="paymentid" value="[{$sPaymentID}]" [{if $oView->getCheckedPaymentId() == $paymentmethod->oxpayments__oxid->value}]checked[{/if}]></td><td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                      <td id="test_PaymentDesc_[{$smarty.foreach.PaymentSelect.iteration}]" colspan="2"><label><b>[{ $paymentmethod->oxpayments__oxdesc->value}] [{ if $paymentmethod->fAddPaymentSum }]([{ $paymentmethod->fAddPaymentSum }] [{ $currency->sign}])[{/if}]</b></label></td>
                    </tr>
                    [{foreach from=$paymentmethod->getDynValues() item=value name=PaymentDynValues}]
                      <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                        <td></td>
                        <td><label>[{ $value->name}]</label></td>
                        <td>
                          <input id="test_Payment_[{$sPaymentID}]_[{$smarty.foreach.PaymentDynValues.iteration}]" type="text" class="payment_text" size="20" maxlength="64" name="dynvalue[[{$value->name}]]" value="[{ $value->value}]">
                        </td>
                      </tr>
                    [{/foreach}]
                  [{/if}]
                  <tr onclick="oxid.form.select('paymentid',[{$inptcounter}]);">
                    <td></td>
                    <td id="test_PaymentLongDesc_[{$sPaymentID}]" colspan="2">[{ $paymentmethod->oxpayments__oxlongdesc->value}]</td>
                  </tr>
                    [{if $inptcounter > -1 && $inptcounter < ($oView->getPaymentCnt()-1) }]
                    <tr class="tr_sep">
                      <td colspan="3"><div class="dot_sep"></div></td>
                    </tr>
                    [{/if}]
                [{/foreach}]
                </table>

            </div>
            
            *}]
            [{if $oView->getTSExcellenceId()}]
            <strong id="test_TsProtectionHeader" class="boxhead paymentboxhead">[{ oxmultilang ident="PAYMENT_TSPROTECTION" }]</strong>
            <div class="box info">
              <div class="etrustlogocol">
                <a href="https://www.trustedshops.com/shop/certificate.php?shop_id=[{$oView->getTSExcellenceId()}]" target="_blank">
                  <img style="border:0px none;" src="[{$oViewConf->getImageUrl()}]/trustedshops_m.gif" title="[{ oxmultilang ident="INC_TRUSTEDSHOPS_ITEM_IMGTITLE" }]">
                </a>
              </div>
              <div class="etrustdescocol">
                <input type="checkbox" name="bltsprotection" value="1" [{if $oView->getCheckedTsProductId()}]checked[{/if}]>
                [{assign var="aTsProtections" value=$oView->getTsProtections() }]
                [{if count($aTsProtections) > 1 }]
                <select name="stsprotection">
                  [{foreach from=$aTsProtections item=oTsProduct}]
                    <option value="[{$oTsProduct->getTsId()}]" [{if $oView->getCheckedTsProductId() == $oTsProduct->getTsId()}]SELECTED[{/if}]>[{ oxmultilang ident="PAYMENT_TSPROTECTIONFOR" }] [{ $oTsProduct->getAmount() }] [{ $currency->sign}] ([{ $oTsProduct->getFPrice() }] [{ $currency->sign}] [{ oxmultilang ident="PAYMENT_INCLUDEVAT" }]) </option>
                  [{/foreach}]
                </select>
                [{else}]
                    [{assign var="oTsProduct" value=$aTsProtections[0] }]
                    <input type="hidden" name="stsprotection" value="[{$oTsProduct->getTsId()}]">
                    [{ oxmultilang ident="PAYMENT_TSPROTECTIONFOR" }] [{ $oTsProduct->getAmount() }] [{ $currency->sign}] ([{ $oTsProduct->getFPrice() }] [{ $currency->sign}] [{ oxmultilang ident="PAYMENT_INCLUDEVAT" }])
                [{/if}]
              <br>
              <br>
                [{ oxmultilang ident="PAYMENT_TSPROTECTIONTEXT" }] <a href="http://www.trustedshops.com/shop/data_privacy.php?shop_id=[{$oView->getTSExcellenceId()}]" target="_blank">[{ oxmultilang ident="PAYMENT_TSPROTECTIONTEXT2" }]</a>
                [{ oxmultilang ident="PAYMENT_TSPROTECTIONTEXT3" }] <a href="http://www.trustedshops.com/shop/protection_conditions.php?shop_id=[{$oView->getTSExcellenceId()}]" target="_blank">[{ oxmultilang ident="PAYMENT_TSPROTECTIONTEXT4" }]</a> [{ oxmultilang ident="PAYMENT_TSPROTECTIONTEXT5" }]
              </div>
            </div>
            [{/if}]
                [{if $oView->isLowOrderPrice()}]
                  <div class="bar prevnext order">
                    <div class="minorderprice">[{ oxmultilang ident="BASKET_MINORDERPRICE" }] [{ $oView->getMinOrderPrice() }] [{ $currency->sign }]</div>
                  </div>
                [{else}]
                     [{*if $oxcmp_user->oxuser__oxactive->value}]
	                        [{assign var="newurl" value=$oViewConf->getSslSelfLink()|cat:"cl=user"}]
                [{else}]
	                    [{assign var="newurl" value=$oViewConf->getSslSelfLink()|cat:"cl=userview"}]
                [{/if*}]
                <div class="footer_basket block clearfix">
                    <div class="btns">
	                    <div class="prev_step_on">
	                            <a href="[{$newurl}]" class="three-line btn-new">[{ oxmultilang ident="CHECKOUT_SHIPPING" }]</a>
                        </div>
                        <div class="next_step_on">
            <input id="test_UserNextStepBottom" name="continue" class="btn-new" type="submit" value="[{ oxmultilang ident="CONTINUE" }]">
           
        </div>
          		
                    </div>
                </div>
                [{*
                  <div class="bar prevnext">
                    <div class="right arrowright">
                        <input id="test_PaymentNextStepBottom" name="userform" type="submit" value="[{ oxmultilang ident="PAYMENT_NEXTSTEP" }]">
                    </div>
                  </div>
                  *}]
                [{/if}]


              [{elseif $oView->getEmptyPayment()}]
                <strong id="test_PaymentHeader" class="boxhead">[{ oxmultilang ident="PAYMENT_INFO" }]</strong>
                <div class="box info">

                    [{ oxmultilang ident="PAYMENT_EMPTY_TEXT" }]
                </div>
                

                <div class="bar prevnext">
                  <div class="right arrowright">
                      <input type="hidden" name="paymentid" value="oxempty">
                      <input id="test_PaymentNextStepBottom" name="continue" type="submit" value="[{ oxmultilang ident="PAYMENT_NEXTSTEP" }]">
                  </div>
                </div>
              [{/if}]

        </form>

        &nbsp;
</div><!-- payment div ends -->
</div><!--contMain ends-->
</div>
[{ insert name="oxid_tracker" title=$template_title }]
[{include file="_footer.tpl"}]
