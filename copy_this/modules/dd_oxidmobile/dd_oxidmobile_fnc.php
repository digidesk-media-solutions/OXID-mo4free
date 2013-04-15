<?php
/**
 * Digidesk media solutions
 *
 * @link        http://www.digidesk.de
 * @version     SVN: $Id$
 */

define( "COOKIE_NAME", 'dd_mobile' );

/**
 * Checks for mobile device
 * @return int 0 = no mobile device found; 1 = mobile device found
 */
function ddIsMobileDevice()
{
    $aMobileDevices = array (
        "iPhone",
        "Android.*Mobile",
        "BlackBerry",
        "Windows Phone"
    );

    $useragent = $_SERVER[ 'HTTP_USER_AGENT' ];
    $pregmatch_string = "/(" . implode( '|', $aMobileDevices) .  ")/i";

    return preg_match( $pregmatch_string, $useragent );
}

function ddSetCookie( $sVal )
{
    setcookie( COOKIE_NAME, $sVal, time() + 60 * 60 * 24 * 365, '/' );
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
    $myConfig = oxConfig::getInstance();

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

            $sMode = oxConfig::getParameter( 'viewmode' );
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
                        oxSession::setVar( 'dd_mobile_ask', '1' );
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

        if( oxConfig::getParameter( 'force_mobile' ))
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
