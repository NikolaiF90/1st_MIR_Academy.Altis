params ["_aoName", "_object", "_size", "_groupCount", "_faction", "_skillRange"];

if (isNil "_groupCount") then 
{
    _groupCount = [2, 5] call BIS_fnc_randomInt;
} else 
{
    if (_groupCount == -1) then { _groupCount = [2, 5] call BIS_fnc_randomInt};
};

if (isNil "_faction") then {_faction = "OPF_F"};
private _groupData = [_faction, "East"] call F90_fnc_GetGroupList;

if (isNil "_skillRange") then {_skillRange = [0.2, 0.5]};

private _patrolRadius = (_size select 0) / 2;

private _fn_SpawnGroup = 
{
    params ["_object", "_patrolRadius", "_groupData", "_faction", "_skillRange"];

    private _spawnPos = [_object, 0, _patrolRadius, 10] call BIS_fnc_findSafePos;

    private _selectedData = selectRandom _groupData;
    private _groupCategory = _selectedData select 0;
    private _allTypes = _selectedData select 1;
    private _selectedType = selectRandom _allTypes;

    private _cfg = (configfile >> "CfgGroups" >> "East" >> _faction >> _groupCategory >> _selectedType);

    private _group = [_spawnPos, east, _cfg, [], [], _skillRange] call BIS_fnc_spawnGroup;
    _group deleteGroupWhenEmpty true;
    
    [_group, _spawnPos, _patrolRadius] call BIS_fnc_taskPatrol;
};

for "_i" from 0 to _groupCount -1 do 
{
    [_object, _patrolRadius, _groupData, _faction, _skillRange] spawn _fn_SpawnGroup;
};

if (isNil "_aoName") then {_aoName = "Ops"};

private _aoID = [10000, 99999] call BIS_fnc_randomInt;
private _aoAreaName = format ["%1%2", _aoName, _aoID];

private _aoMarker = createMarker [_aoAreaName, _object];
_aoMarker setMarkerBrushLocal "Border";
_aoMarker setMarkerColorLocal "colorBLUFOR";
_aoMarker setMarkerShapeLocal "RECTANGLE";
_aoMarker setMarkerSize _size;

private _markerName = format ["%1marker", _aoAreaName];
private _nameMarker = createMarker [_markerName, _object];
_nameMarker setMarkerColorLocal "colorBLUFOR";
_nameMarker setMarkerTextLocal _aoName;
_nameMarker setMarkerType "loc_Rifle";

private _enemyDetector = createTrigger ["EmptyDetector", _object, true];
_enemyDetector setTriggerArea [((_size select 0) / 2), ((_size select 1) / 2), 0, true];
_enemyDetector setTriggerActivation ["EAST", "NOT PRESENT", false];
_enemyDetector setTriggerStatements ["this", "thisTrigger setVariable ['AOCleared', true, true];", ""];
_enemyDetector setVariable ["AOCleared", false, true];

private _fn_DeleteAO = 
{
    params ["_aoMarker", "_nameMarker", "_enemyDetector"];

    deleteMarker _aoMarker;
    deleteMarker _nameMarker;

    if !(isNull _enemyDetector) then 
    {
        deleteVehicle _enemyDetector;
    };
};

private _fn_AoHandler = 
{
    params ["_aoMarker", "_nameMarker", "_enemyDetector", "_fn_DeleteAO"];

    while {true} do 
    {
        if (isNull _enemyDetector) exitWith {[_aoMarker, _nameMarker, objNull] call _fn_DeleteAO};
        private _aoCleared = _enemyDetector getVariable "AOCleared";

        if (_aoCleared) exitWith {[_aoMarker, _nameMarker, _enemyDetector] call _fn_DeleteAO};
        sleep 10;
    };
};

[_aoMarker, _nameMarker, _enemyDetector, _fn_DeleteAO] spawn _fn_AoHandler;