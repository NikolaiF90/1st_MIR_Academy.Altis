params ["_handler"];

private _hasStarted = _handler getVariable ["RoadblockStarted", false];
if (_hasStarted) exitWith {};

[_handler] call F90_fnc_initRoadblock;

_handler setVariable ["RoadblockStarted", true, true];
_handler setVariable ["SpawnedVehicleCounts", 0, true];

[_handler] spawn 
{
    params ["_handler"];

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

        sleep ([5, 10] call BIS_fnc_randomInt);
    };

    _handler setVariable ["RoadblockEnded", nil, true];
};