<?php
/**
 * digidesk - media solutions
 *
 * @link           http://www.digidesk.de
 * @version        SVN: $Id$
 */
/**
 * Module information
 */
$aModule = array(
    'id' => 'oxid-mo4free',
    'title' => 'oxid mobile templates',
    'thumbnail' => '',
    'version' => '1.0',
    'author' => 'digidesk - media solutions',
    'extend' => array(
        'oxcmp_user'=>'dd_oxidmobile/dd_oxidmobile_oxcmp_user',
        'oxviewconfig'=>'dd_oxidmobile/dd_oxidmobile_oxviewconfig',
        'oxoutput'=>'dd_oxidmobile/dd_oxidmobile_oxoutput'
    ),
    'files' => array(
        'dd_oxidmobile_fnc'        => 'dd_oxidmobile/dd_oxidmobile_fnc.php'
    )
);
