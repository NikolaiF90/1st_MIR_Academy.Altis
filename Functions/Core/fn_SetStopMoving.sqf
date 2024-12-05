/*
    Author: PrinceF90

    Description:
        This function stops the movement of the specified target unit.

    Parameter(s):
        _target - The unit to be stopped.  [OBJECT]

    Returns: 
        None
*/
params [ "_target"];

private _group = group _target;
[_group] call cba_fnc_clearWaypoints;

private _targetVehicle = objectParent _target;

if !(isNull _targetVehicle) then 
{
    private _lifeTime = _targetVehicle getVariable ["VehicleLifetime", 0];
    if (_lifeTime != 0) then 
    {
        if (_lifeTime == -1) exitWith {};
        [true, "SetStopMoving", format ["_lifeTime: %1", _lifeTime], true] call F90_fnc_Debug;
        _targetVehicle setVariable ["VehicleLifetime", -1, true];
    };
};

doStop _target;