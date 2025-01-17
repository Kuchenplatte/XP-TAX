/**
 * ExileClient_system_trading_network_purchaseVehicleResponse
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 Modified by [TAG] dekela for XP Tax
 */
 
private["_responseCode", "_vehicleNetID", "_salesPrice", "_vehicleObject"];
_responseCode = _this select 0;
_vehicleNetID = _this select 1;
_salesPrice = _this select 2;
if (_responseCode isEqualTo 0) then
{
    _vehicleObject = objectFromNetId _vehicleNetID;
    player moveInDriver _vehicleObject;
    ["SuccessTitleAndText", ["Vehicle purchased!", format ["Vehicle Cost -%1<img image='\exile_assets\texture\ui\poptab_inline_ca.paa' size='28'/><br/>XP Tax -%2 respect", _salesPrice, respectModifierVehicle]]] call ExileClient_gui_toaster_addTemplateToast;
}
else 
{
    ["ErrorTitleAndText", ["Whoops!", format ["Something went really wrong. Please tell a server admin that you have tried to purchase a vehicle and tell them the code '%1'. Thank you!", _responseCode]]] call ExileClient_gui_toaster_addTemplateToast;
};