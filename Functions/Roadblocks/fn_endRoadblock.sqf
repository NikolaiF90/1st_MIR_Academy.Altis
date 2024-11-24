params ["_handler"];

private _hasStarted = _handler getVariable ["RoadblockStarted", false];

if (_hasStarted) then 
{
    _handler setVariable ["RoadblockEnded", true, true];
    _handler setVariable ["RoadblockStarted", false, true];
};

private _spawnedVehicles = _handler getVariable "SpawnedVehicles";

if (count _spawnedVehicles > 0) then 
{
    {
        [_x, true] call F90_fnc_deleteRBVehicles;
    } forEach _spawnedVehicles;
};