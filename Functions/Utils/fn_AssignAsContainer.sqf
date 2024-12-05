/*
    Author: PrinceF90

    Description:
        This function transform an object into a container that can hold inventory items and adds an action to it.

    Parameter(s):
        _object - The object to which the action will be added. [OBJECT]
        _container - The container whose inventory will be accessed. [OBJECT]
        _actionTitle - The title of the action that will appear in the action menu. [STRING]

    Returns: 
        None - The function does not return a value.
*/
params ["_object", "_container", "_actionTitle"];

if (isNil "_actionTitle") then {_actionTitle = "Inventory"};

[_container, _object] call F90_fnc_TeleportObject;

_object addaction [_actionTitle,
{
    params ["_target", "_caller", "_actionId", "_container"];
    
    _caller action ["Gear", _container];
},_container, 6, true, true, "", "(_this distance _target) < 5"];