params ["_target", "_player", "_handler"];

private _arrestData = _target getVariable "ArrestData";
private _driverOrPassengerArrested =
{
    if (_x) exitWith {true};
    false
} forEach _arrestData;
if (_driverOrPassengerArrested) exitWith {["The driver or one of the passengers has been arrested. Can't proceed!"] remoteExec ["hint", _player]};

private _passengers = _target getVariable "Passengers";
private _driverOrPassengerDead = 
{
    if !(alive _x) exitWith {true};
    false
} forEach _passengers;
if (_driverOrPassengerDead) exitWith {["The driver or one of the passengers is not alive anymore. Can't proceed!"] remoteExec ["hint", _player]};

_target setVariable ["PassInspection", true, true];
_target setVariable ["VehicleLifetime", 0, true];

private _despawnPoint =  _handler getVariable "DespawnPoint";
private _despawnPos = getMarkerPos _despawnPoint;
_target doMove _despawnPos;

private _passInspection = _target getVariable "PassInspection";
if (_passInspection) exitWith {["The vehicle has been verified to pass the inspection!"] remoteExec ["hint", _player]};
[
    {
        params ["_car"];
        [_car] call F90_fnc_deleteRBVehicles;
    },
    [_target], 20
] call cba_fnc_waitAndExecute;