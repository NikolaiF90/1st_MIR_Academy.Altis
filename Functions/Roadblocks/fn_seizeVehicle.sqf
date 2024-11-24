params ["_target", "_player"];

private _passengers = _target getVariable "Passengers";
private _allAlive = 
{
    if !(alive _x) exitWith {false};
    true
} forEach _passengers;

private _arrestData = _target getVariable "ArrestData";
private _allArrested = 
{
    if !(_x) exitWith {false};
    true
} forEach _arrestData;

if (!_allArrested && _allAlive) exitWith 
{
    ["You can't seize a vehicle without having the driver and all of the passengers arrested!"] remoteExec ["hint", _player];
};

[_target, false] call F90_fnc_deleteRBVehicles;