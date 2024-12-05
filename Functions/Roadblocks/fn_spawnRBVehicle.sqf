params ["_handler"];

private _uniqueID01 = [10000, 99999] call BIS_fnc_randomInt;
private _uniqueID02 = [10000, 99999] call BIS_fnc_randomInt;

private _vehicleClasses = _handler getVariable "VehicleClasses";
private _vehClass = selectRandom _vehicleClasses;
private _spawnPos = [_handler getVariable "Spawn1", _handler getVariable "Spawn2"];
private _spawnMarker = selectRandom _spawnPos;
private _spawnPos = getMarkerPos _spawnMarker;
private _car = _vehClass createVehicle _spawnPos;
[_car, _handler] call F90_fnc_setVehicleCargo;

private _spawnedVehicleCounts = _handler getVariable "SpawnedVehicleCounts";
_spawnedVehicleCounts = _spawnedVehicleCounts + 1;
_handler setVariable ["SpawnedVehicleCounts", _spawnedVehicleCounts, true];

_car setVariable ["VehicleLifetime", 0, true];
_car setVariable ["MaxLifetime", _handler getVariable "VehicleMaxLifetime", true];
_car setVariable ["SpawnPos", _spawnPos, true];

_car setDir (markerDir _spawnMarker);

private _passengers = [];
private _arrestData = [];

private _emptySeatCounts = _car emptyPositions "";
private _passengerCounts = if (_emptySeatCounts <= 1) then 
{
    _emptySeatCounts
} else 
{
    [1, _emptySeatCounts] call BIS_fnc_randomInt
};

private _side = if (([0, 100] call BIS_fnc_randomInt) < (_handler getVariable "EnemySpawnChance")) then 
{
    east
} else 
{
    civilian
};

private _group = createGroup [_side, true];
for "_i" from 0 to _passengerCounts -1 do 
{
    private _class = [_handler, _side, _i] call F90_fnc_generateRandomClass;
    private _civ = _group createUnit [_class, _spawnPos, [], 0, "FORM"];
    private _actionName = "";
    if (_i == 0) then 
    {
        _civ setVariable ["IsDriver", true, true];
        _civ moveInDriver _car;
        _actionName = "Arrest Driver";
    } else 
    {
        _civ setVariable ["IsDriver", false, true];
        _civ moveInAny _car;
        _actionName = "Arrest Passenger";
    };

    [format ["arrest%1%2%3", _civ, _uniqueID01, _uniqueID02], _civ, _actionName, 
    {
        params ["_target", "_player", "_vehicle"];

        [[_target, _player, _vehicle], "F90_fnc_arrest", 1] call F90_fnc_executeServer;
    }, _car] call F90_fnc_addAction;
    
    _civ setVariable ["PassengerID", _i, true];
    _arrestData set [_i, false];
    _passengers pushBack _civ;

    sleep 1;
};

_car setVariable ["Passengers", _passengers, true];
_car setVariable ["ArrestData", _arrestData, true];
_car setVariable ["PassInspection", false, true];

private _spawnedVehicles = _handler getVariable "SpawnedVehicles";
_spawnedVehicles pushBack _car;
_handler setVariable ["SpawnedVehicles", _spawnedVehicles, true];

[format ["seizeVehicle%1%2%3", _car, _uniqueID01, _uniqueID02], _car, "Seize Vehicle", 
{
    [[_target, _player], "F90_fnc_seizeVehicle", 1] call F90_fnc_executeServer;
}] call F90_fnc_addAction;

[format ["orderProceed%1%2%3", _car, _uniqueID01, _uniqueID02], _car, "Order Driver To Proceed", 
{
    params ["_target", "_player", "_handler"];

    [[_target, _player, _handler], "F90_fnc_orderToProceed", 1] call F90_fnc_executeServer;
}, _handler] call F90_fnc_addAction;

[format ["orderGetOut%1%2%3", _car, _uniqueID01, _uniqueID02], _car, "Order Everyone To Get Out", 
{
    params ["_target", "_player", "_handler"];

    [[_target, _player, _handler], "F90_fnc_OrderGetOut", 1] call F90_fnc_executeServer;
}, _handler] call F90_fnc_addAction;

private _despawnPoint = _handler getVariable "DespawnPoint";
private _des1 = getMarkerPos _despawnPoint;

_car doMove _des1;

[_car, _handler] spawn F90_fnc_vehicleHandler;