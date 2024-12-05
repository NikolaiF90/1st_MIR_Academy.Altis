params ["_player", "_handler", "_spawn1", "_spawn2", "_despawnPoint"];

private _hasStarted = _handler getVariable ["RoadblockStarted", false];
if (_hasStarted) exitWith {["The roadblock has already started!"] remoteExec ["hint", _player]};

["Roadblock has started!"] remoteExec ["hint", _player];

[_handler] call F90_fnc_initRoadblock;

_handler setVariable ["Spawn1", _spawn1, true];
_handler setVariable ["Spawn2", _spawn2, true];
_handler setVariable ["DespawnPoint", _despawnPoint, true];

_handler setVariable ["RoadblockStarted", true, true];
_handler setVariable ["SpawnedVehicleCounts", 0, true];

private _spawnInterval = _handler getVariable "SpawnInterval";

[_handler, _spawnInterval] spawn 
{
    params ["_handler", "_spawnInterval"];

    while {true} do 
    {
        private _ended = _handler getVariable ["RoadblockEnded", false];

        if (_ended) exitWith {};

        private _spawnedVehicleCounts = _handler getVariable "SpawnedVehicleCounts";
        // Spawn not more than 1 vehicles
        if (_spawnedVehicleCounts == 0) then 
        {
            [_handler] call F90_fnc_spawnRBVehicle;
        };

        sleep (_spawnInterval call BIS_fnc_randomInt);
    };

    _handler setVariable ["RoadblockEnded", nil, true];
};