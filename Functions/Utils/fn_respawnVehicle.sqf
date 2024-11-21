/*
    Author: PrinceF90

    Description:
        This function handles the respawn of a given vehicle by deleting its current instance, moving out its crew, and then creating a new instance based on the provided respawn information.

    Parameter(s):
        _vehicle - The vehicle to be respawned.  [OBJECT]
        _respawnInformation - Information required to respawn the vehicle.  [ARRAY]

    Returns: 
        None
*/
params ["_vehicle", "_respawnInformation"];

MIR_RespawnableVehicles deleteAt (MIR_RespawnableVehicles find _vehicle);

// [crew _vehicle] call F90_fnc_moveOut;

[{
    true
}, {
    params ["_vehicle", "_respawnInformation"];

    _vehicle call CBA_fnc_deleteEntity;

    [{
        params ["_type", "_pos", "_dir", "_vector", "_respawnTime"];

        private _vehicle = _type createVehicle _pos;
        _vehicle setDir _dir;
        _vehicle setPosASL _pos;
        _vehicle setVectorDirAndUp _vector;

        [_vehicle, _respawnTime] call F90_fnc_makeRespawnable;
    }, _respawnInformation, 2] call CBA_fnc_waitAndExecute;
}, [_vehicle, _respawnInformation]] call CBA_fnc_waitUntilAndExecute;