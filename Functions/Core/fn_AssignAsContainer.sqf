params ["_object", "_container", "_actionTitle"];

if (isNil "_actionTitle") then {_actionTitle = "Inventory"};

[_container, _object] call F90_fnc_TeleportObject;

_object addaction [_actionTitle,
{
    params ["_target", "_caller", "_actionId", "_container"];
    
    _caller action ["Gear", _container];
},_container, 6, true, true, "", "(_this distance _target) < 5"];