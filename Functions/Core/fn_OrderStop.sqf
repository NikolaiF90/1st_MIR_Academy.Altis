/*
    Author: PrinceF90

    Description:
        This function causes the player to play a freeze animation and stops nearby civilian units from moving within a specified radius.

    Parameter(s):
        None

    Returns: 
        None
*/
player playAction "gestureFreeze";

private _playerPosition = getPos player;
private _playerDirection = getDir player;
private _radius = 10;
private _nearbyUnits = (_playerPosition nearEntities [["Car", "Civilian_F"], _radius]) apply {driver _x};

if (_nearbyUnits isEqualTo []) exitWith {true};

private _civilianUnits = _nearbyUnits select {(side _x) isEqualTo civilian};
{
    [_x] remoteExec ["F90_fnc_SetStopMoving", _x];
} forEach _civilianUnits;