params ["_vehicle", "_handler"];

private _maxLifetime = _vehicle getVariable "MaxLifetime";
private _spawnPos = _vehicle getVariable "SpawnPos";
private _destinationPos = _vehicle getVariable "DestinationPos";
private _destination2 = getMarkerPos "rbWP_02";
private _passengers = _vehicle getVariable "Passengers";

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
    if (isNull _vehicle) exitWith 
    {
        [_handler] call _fn_decreaseSpawnedVehicleCounts;
    };

    if !(alive _vehicle) exitWith
    {
        [_handler] call _fn_decreaseSpawnedVehicleCounts;
    };

    private _lifetime = _vehicle getVariable "Lifetime";
    private _vehiclePosition = position _vehicle;

    // Destroy if not moving and lifetime reached
    if (_lifetime >= _maxLifetime && (_vehiclePosition distance _spawnPos <= 10)) exitWith 
    {
        [_vehicle] call F90_fnc_deleteRBVehicles;
    };
    sleep 5;

    // Increase lifetime if not moving or far from destination
    if (_vehiclePosition distance _spawnPos <= 10 || _vehiclePosition distance _destinationPos > 20) then 
    {
        _lifetime = _lifetime + 5;
        _vehicle setVariable ["Lifetime", _lifetime, true];
    };

    private _spawnedVehicles = _handler getVariable "SpawnedVehicles";
    _spawnedVehicles = _spawnedVehicles - [objNull];
    _handler setVariable ["SpawnedVehicles", _spawnedVehicles, true];
};

