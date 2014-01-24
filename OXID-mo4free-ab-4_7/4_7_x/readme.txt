==Title==
Mobile theme by digidesk - media solutions

==Author==
digidesk

==Prefix==
dd_oxidmobile

==Version==
1.0.5

==Link==
http://www.digidesk.de

==Mail==
info@digidesk.de

==Description==
mobile theme for oxid eShops from version 4.5.1

==Extend==
*oxcmp_user::init
-- for switching to mobile theme on a mobile device
*oxoutput::process
-- inserting a link in a standard theme for switching to mobile version
*oxviewconfig::ddAskForMobileVersion
-- for displaying a confirmation message, if the user wants the mobile version

==Modules Metadata==
oxcmp_user   => dd_oxidmobile/dd_oxidmobile_oxcmp_user
oxviewconfig => dd_oxidmobile/dd_oxidmobile_oxviewconfig
oxoutput     => dd_oxidmobile/dd_oxidmobile_oxoutput

==Libraries==

==Resources==
