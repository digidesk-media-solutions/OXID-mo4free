<?php
/**
 * Digidesk media solutions
 *
 * @link        http://www.digidesk.de
 * @version     SVN: $Id$
 */

define( "COOKIE_NAME", 'dd_mobile' );
//include dirname( __FILE__ ).'/bootstrap.php';

/**
 * Checks for mobile device
 * @return int 0 = no mobile device found; 1 = mobile device found
 */
function ddIsMobileDevice()
{
    $aMobileDevices = array (
        'iPhone',
        'Android*',
        'Android.*Mobile',
        'BlackBerry',
        'Windows Phone',
        'opera mini',
        'pre\/',
        'palm os',
        'palm',
        'hiptop',
        'avantgo',
        'plucker',
        'xiino',
        'blazer',
        'elaine',
        'iris',
        '3g_t',
        'windows ce',
        'opera mobi',
        'windows ce; smartphone;',
        'windows ce; iemobile',
        'mini 9.5',
        'vx1000',
        'lge ',
        'm800',
        'e860',
        'u940',
        'ux840',
        'compal',
        'wireless',
        'ahong',
        'lg380',
        'lgku',
        'lgu900',
        'lg210',
        'lg47',
        'lg920',
        'lg840',
        'lg370',
        'sam-r',
        'mg50',
        's55',
        'g83',
        't66',
        'vx400',
        'mk99',
        'd615',
        'd763',
        'el370',
        'sl900',
        'mp500',
        'samu3',
        'samu4',
        'vx10',
        'xda_',
        'samu5',
        'samu6',
        'samu7',
        'samu9',
        'a615',
        'b832',
        'm881',
        's920',
        'n210',
        's700',
        'c-810',
        '_h797',
        'mob-x',
        'sk16d',
        '848b',
        'mowser',
        's580',
        'r800',
        '471x',
        'v120',
        'rim8',
        'c500foma:',
        '160x',
        'x160',
        '480x',
        'x640',
        't503',
        'w839',
        'i250',
        'sprint',
        'w398samr810',
        'm5252',
        'c7100',
        'mt126',
        'x225',
        's5330',
        's820',
        'htil-g1',
        'fly v71',
        's302',
        '-x113',
        'novarra',
        'k610i',
        '-three',
        '8325rc',
        '8352rc',
        'sanyo',
        'vx54',
        'c888',
        'nx250',
        'n120',
        'mtk ',
        'c5588',
        's710',
        't880',
        'c5005',
        'i;458x',
        'p404i',
        's210',
        'c5100',
        'teleca',
        's940',
        'c500',
        's590',
        'foma',
        'samsu',
        'vx8',
        'vx9',
        'a1000',
        '_mms',
        'myx',
        'a700',
        'gu1100',
        'bc831',
        'e300',
        'ems100',
        'me701',
        'me702m-three',
        'sd588',
        's800',
        '8325rc',
        'ac831',
        'mw200',
        'brew ',
        'd88',
        'htc\/',
        'htc_touch',
        'HTC_HD2_T8585',
        '355x',
        'm50',
        'km100',
        'd736',
        'p-9521',
        'telco',
        'sl74',
        'ktouch',
        'm4u\/',
        'me702',
        '8325rc',
        'kddi',
        'lg ',
        'sonyericsson',
        'samsung',
        '240x',
        'x320',
        'vx10',
        'nokia',
        'sony cmd',
        'motorola',
        'up.browser',
        'up.link',
        'mmp',
        'symbian',
        'smartphone',
        'midp',
        'wap',
        'vodafone',
        'o2',
        'pocket',
        'kindle',
        'psp',
        'treo',
        'ipod'
    );

    $useragent = $_SERVER[ 'HTTP_USER_AGENT' ];
    $pregmatch_string = "/(" . implode( '|', $aMobileDevices) .  ")/i";
	$bWriter=fopen("log_ua.txt","w");
	$sWrite=fwrite($bWriter,$useragent);
	
	
    return preg_match( $pregmatch_string, $useragent );
	
}
function ddIsMozillaDevice()
{
    /* T-G5DJ7UF6KI-49: Mobile eingefügt, damit Desktop-Browser nicht akzeptiert werden */
    $aMobileDevices = array (
        "Mozilla.*Mobile"
    );

    $useragent = $_SERVER[ 'HTTP_USER_AGENT' ];
    $pregmatch_string = "/(" . implode( '|', $aMobileDevices) .  ")/i";
	$bWriter=fopen("log_ua.txt","w");
	$sWrite=fwrite($bWriter,$useragent);
	
	
    return preg_match( $pregmatch_string, $useragent );
}

function ddSetCookie( $sVal )
{
    $sDomainName = oxConfig::getInstance()->getConfigParam('ddOxidmobileDomainName');
    setcookie( COOKIE_NAME, $sVal, time() + 60 * 60 * 24 * 365, '/', $sDomainName );
}

function ddDelCookie()
{
    setcookie( COOKIE_NAME, '', time() - 3600, '/' );
}

function ddGetCookie()
{
    if ( isset( $_COOKIE[ COOKIE_NAME ] ) )
    {
        return $_COOKIE[ COOKIE_NAME ];
    }
    return false;
}


/**
 * checks if mobile-view is wished from viewer
 * The Check depends from the actual device and cookie-value from viewer
 * @return bool
 */
function ddIsMobileWished()
{
    $myConfig = oxRegistry::getConfig();

    $dd_isMobileWished = $myConfig->getConfigParam( 'dd_isMobileWished' );
    if ( $dd_isMobileWished == null )
    {
        $blStdTheme = false;
        $blMobileTheme = true;

        $blReturn = $blStdTheme;

        if ( ddIsMobileDevice() ) // Mobile-Device
        {
            // Alte Cookie-Einstellung mit falschen Werten löschen
            $sOldCookie = ddGetCookie();
            if ( $sOldCookie != 'std' && $sOldCookie != 'mobile' )
            {
                ddDelCookie();
            }

            $sMode = oxRegistry::getConfig()->getParameter( 'viewmode' );
            if ( $sMode == 'std' )
            {
                // Cookie setzen und den Wert auf 0 für Std-Theme
                ddSetCookie( 'std' );
                $blReturn = $blStdTheme;
            }
            else
            {
                if ( $sMode == 'mobile' )
                {
                    // Cookie setzen und den Wert auf 'mobile' für Std-Theme
                    ddSetCookie( 'mobile' );
                    $blReturn = $blMobileTheme;
                }
                else // kein GET/POST-Parameter gesetzt
                {
                    $sCookie = ddGetCookie();
                    if ( !$sCookie )
                    {
                        $blReturn = $blMobileTheme;
                    }
                    else
                    {
                        if ( $sCookie == 'std' )
                        {
                            $blReturn = $blStdTheme;
                        }
                        else
                        {
                            $blReturn = $blMobileTheme;
                        }
                    }
                }
            }
        }

        if( oxRegistry::getConfig()->getParameter( 'force_mobile' ))
        {
            $dd_isMobileWished = $blMobileTheme;
        }
        else
        {
            $dd_isMobileWished = $blReturn;
        }
        $myConfig->setConfigParam( 'dd_isMobileWished', $blReturn );
    }

    return $dd_isMobileWished;
}
