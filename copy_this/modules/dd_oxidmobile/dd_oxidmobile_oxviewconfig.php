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
        return oxSession::getVar( 'dd_mobile_ask' );
    }
}