<?php
/**
 * digidesk - media solutions
 *
 * @link           http://www.digidesk.de
 * @version        SVN: $Id$
 */
/**
 * module class
 *
 * @package modules
 */
class dd_oxidmobile_oxviewconfig extends dd_oxidmobile_oxviewconfig_parent
{
    public function ddAskForMobileVersion()
    {
        if ( !$_COOKIE[ 'dd_mobile_ask'] && !$_COOKIE[ 'dd_mobile'])
        {
            setcookie( 'dd_mobile_ask', 1, 0, '/');
            return true;
        }

        return false;
    }
}