params ["_vehicle", "_handler"];

private _maxLifetime = _vehicle getVariable "MaxLifetime";
private _despawnPoint = _handler getVariable "DespawnPoint";
private _despawnPosition = getMarkerPos _despawnPoint;

private _fn_decreaseSpawnedVehicleCounts = 
{
    params ["_handler"];

    private _spawnedVehicleCounts = _handler getVariable "SpawnedVehicleCounts";
    _spawnedVehicleCounts = _spawnedVehicleCounts - 1;
    if (_spawnedVehicleCounts < 0) then {_spawnedVehicleCounts = 0};
    _handler setVariable ["SpawnedVehicleCounts", _spawnedVehicleCounts, true];
};

while {true} do 
{
    sleep 5;
    if (isNull _vehicle) exitWith 
    {
        [_handler] call _fn_decreaseSpawnedVehicleCounts;
    };

    if !(alive _vehicle) exitWith
    {
        [_handler] call _fn_decreaseSpawnedVehicleCounts;
    };

    private _lifetime = _vehicle getVariable "VehicleLifetime";
    private _vehiclePos = position _vehicle;

    // Increase lifetime if far from players or when not being stopped
    private _allPlayers = call BIS_fnc_listPlayers;
    if (_lifetime != -1 || _allPlayers inAreaArray [getPosWorld _vehicle, 100, 100] isEqualTo []) then 
    {
        _lifetime = _lifetime + 5;
        _vehicle setVariable ["VehicleLifetime", _lifetime, true];
    };

    // Despawn if lifetime reached
    if (_lifetime >= _maxLifetime) then 
    {
        [_vehicle] call F90_fnc_deleteRBVehicles;
    };

    // Despawn if reached destination
    if ((_vehiclePos distance _despawnPosition) <= 20) then 
    {
        [_vehicle] call F90_fnc_deleteRBVehicles;
    };

    // Remove any null entry
    private _spawnedVehicles = _handler getVariable "SpawnedVehicles";
    _spawnedVehicles = _spawnedVehicles - [objNull];
    _handler setVariable ["SpawnedVehicles", _spawnedVehicles, true];
};

