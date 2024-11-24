params ["_target", "_player", "_handler"];

private _passInspection = _target getVariable "PassInspection";
if (_passInspection) exitWith {["The vehicle has been verified to pass the inspection!"] remoteExec ["hint", _player]};

private _arrestData = _target getVariable "ArrestData";
private _allArrested =
{
    if !(_x) exitWith {false};
    true
} forEach _arrestData;
if (_allArrested) exitWith {["Everyone has been arrested!"] remoteExec ["hint", _player]};

private _passengers = _target getVariable "Passengers";
private _allDead = 
{
    if (alive _x) exitWith {false};
    true
} forEach _passengers;
if (_allDead) exitWith {["Everyone is not alive anymore!"] remoteExec ["hint", _player]};

{
    if ((objectParent _x) isEqualTo _target) then 
    {
        doGetOut _x;
    };
} forEach _passengers;