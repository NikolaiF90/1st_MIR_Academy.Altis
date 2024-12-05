/*
    Author: PrinceF90

    Description:
        This function adds an action to a vehicle allowing it to deploy smoke shells and attach it to the vehicle.

    Parameter(s):
        _vehicle - The vehicle that will have the action to deploy smoke. [OBJECT]
        _smokeType - (Optional, default "SmokeShellBlue")The type of smoke shell to deploy. [STRING]

    Returns: 
        None
*/
params ["_vehicle", "_smokeType"];

if (isNil "_smokeType") then {_smokeType = "SmokeShellBlue"};

_vehicle addaction ["Deploy Smoke",
{
    params ["_target", "_caller", "_actionId", "_smokeType"];

    private _smoke = _smokeType createVehicle (position _target);
    _smoke attachTo [_target];
    
}, _smokeType, 4, true, true, "", "(objectParent _this) == _target"];