params ["_object", "_container", "_actionTitle"];

if (isNil "_actionTitle") then {_actionTitle = "Inventory"};

private _createContainer = false;
if (isNil "_container") then {_createContainer = true};
if (typeName _container isEqualTo "STRING" && _container isEqualTo "") then 
{
    _createContainer = true;
} else 
{
    _createContainer = false;
};

private _containerBox = objNull;
if (_createContainer) then 
{
    _containerBox = "VirtualReammoBox_small_F" createVehicle [0,0,0];
    _containerBox enableSimulation false;
    _containerBox allowDamage false;
    _containerBox hideObjectGlobal true;
    _containerBox setpos (position _object);
} else 
{
    _containerBox = _container;
};

_object addaction [_actionTitle,
{
    params ["_target", "_caller", "_actionId", "_containerBox"];
    
    _caller action ["Gear", _containerBox];
},_containerBox, 6, true, true, "", "(_this distance _target) < 5"];