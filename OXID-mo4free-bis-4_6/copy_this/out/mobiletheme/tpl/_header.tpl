<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html [{if $oView->getActiveLangAbbr()}]lang="[{ $oView->getActiveLangAbbr() }]"[{/if}]>
<head>
    [{assign var="_titlesuffix" value=$_titlesuffix|default:$oView->getTitleSuffix()}]
    [{assign var="title" value=$title|default:$oView->getTitle() }]
<title>[{ $oView->getTitlePrefix() }][{if $title}] | [{$title|strip_tags}][{/if}][{if $_titlesuffix}] | [{$_titlesuffix}][{/if}]</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=[{$oView->getCharSet()}]">
    [{if $oView->noIndex()}]
    <meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
    [{elseif $oView->noIndex() == 2 }]
    <meta name="ROBOTS" content="NOINDEX, FOLLOW">
    [{/if}]
    [{if $oView->getMetaDescription()}]<meta name="description" content="[{$oView->getMetaDescription()}]">[{/if}]
    [{if $oView->getMetaKeywords()}]<meta name="keywords" content="[{$oView->getMetaKeywords()}]">[{/if}]
	<meta name="viewport" content="width=device-width, user-scaleable=no, initial-scale=1.0, maximum-scale=1.0" />
    <link rel="shortcut icon" href="[{ $oViewConf->getBaseDir()}]favicon.ico">
    <link rel="stylesheet" type="text/css" href="[{ $oViewConf->getResourceUrl() }]css/style.css" />
    [{if $oViewConf->ddAskForMobileVersion()}]
        [{assign var="oConf" value=$oViewConf->getConfig() }]
        <script type="text/javascript">
            sURL = '[{ $oViewConf->getBaseDir()}]';

            function setCookie( sCookieName, sCookieVal )
            {
                var iExpDays = 365;
                var oExpDate = new Date();
                oExpDate.setDate( oExpDate.getDate() + iExpDays );

                sDomain =  '[{$oConf->getConfigParam('ddOxidmobileDomainName')}]';
                var c_value = encodeURI( sCookieVal ) + ((iExpDays == null) ? "" : "; expires=" + oExpDate.toUTCString() + "; domain=" + sDomain + "; path=/");
                document.cookie = sCookieName + "=" + c_value;
            }

            blMobileWished = confirm( '[{oxmultilang ident="DD_ASK_FOR_MOBILE"}]');
            if( blMobileWished)
            {
                setCookie( 'dd_mobile', 'mobile');
            }
            else
            {
                location.href = '[{ $oViewConf->getBaseDir()}]?viewmode=std';
            }
        </script>
    [{/if}]
</head>
<!-- Copyright 2012 digidesk - media solutions

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License. -->
<body>
<div class="center"> <!-- center starts -->
    <div id="header">
         [{assign var="slogoImg" value="logo.png"}]
         <span class="s-logo"><a id="logo" href="[{$oViewConf->getHomeLink()}]" title="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"><img src="[{$oViewConf->getImageUrl($slogoImg)}]" alt="[{$oxcmp_shop->oxshops__oxtitleprefix->value}]"></a>
         </span>
         [{include file="widget/header/search.tpl"}]	
    </div>
    

