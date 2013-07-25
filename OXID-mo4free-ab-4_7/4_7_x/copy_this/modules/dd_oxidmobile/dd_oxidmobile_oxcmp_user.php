<?php
class dd_oxidmobile_oxcmp_user extends dd_oxidmobile_oxcmp_user_parent
{
	public function init()
	{
		$myConfig = oxRegistry::getConfig();
		if ( function_exists( 'ddIsMobileWished' ) && ddIsMobileWished())
		{
			$myConfig->setConfigParam( 'sTheme', 'mobiletheme' );
            $myConfig->setConfigParam( 'sCustomTheme', 'mobiletheme' );
            $sCompileDir = $myConfig->getConfigParam( 'sCompileDir' );
            $sCompileDir = str_replace( '/tmp', '/mobile_tmp', $sCompileDir);
            $myConfig->setConfigParam( 'sCompileDir', $sCompileDir );
            $this->_setThemeConfVars();
		}
		
		return parent::init();
	}

    protected function _setThemeConfVars()
    {
        $myConfig = oxRegistry::getConfig();
        $oDb = oxDb::getDb();

        $sShopID = $myConfig->getShopId();
        $sModule = 'theme:mobiletheme';


        $sQ = "select oxvarname, oxvartype, DECODE( oxvarvalue, '" . $myConfig->getConfigParam( 'sConfigKey' ) . "') as oxvarvalue from oxconfig where oxshopid = '$sShopID' and oxmodule=" . $oDb->quote( $sModule );
        $oRs = $oDb->execute( $sQ );
        if ( $oRs != false && $oRs->recordCount() > 0 )
        {
            while ( !$oRs->EOF )
            {
                $sVarName = $oRs->fields[ 0 ];
                $sVarType = $oRs->fields[ 1 ];
                $sVarVal = $oRs->fields[ 2 ];

                //in sShopURL and sSSLShopURL cases we skip (for admin or when URL values are not set)
                if ( ( $sVarName == 'sShopURL' || $sVarName == 'sSSLShopURL' ) &&
                    ( !$sVarVal || $this->isAdmin() === true )
                )
                {
                    $oRs->moveNext();
                    continue;
                }

                switch ( $sVarType )
                {
                    case 'arr':
                    case 'aarr':
                        $myConfig->setConfigParam( $sVarName, unserialize( $sVarVal ) );
                        break;
                    case 'bool':
                        $myConfig->setConfigParam( $sVarName, ( $sVarVal == 'true' || $sVarVal == '1' ) );
                        break;
                    default:
                        $myConfig->setConfigParam( $sVarName, $sVarVal );
                        break;
                }

                $oRs->moveNext();
            }
        }
    }
	
}
