Headless_Client0Present = if (isNil "hc_0") then {false} else {true};
Headless_Client1Present = if (isNil "hc_1") then {false} else {true};

[[], "F90_fnc_initHeadlessVariables", 0] call F90_fnc_executeServer;

["Initialize", [true]] call BIS_fnc_dynamicGroups;

["startRoadblock", RbBoard_0, "Start Roadblock", 
{
    params ["_target", "_player", "_args"];
    [[_player, _args, "rbSpawnA_0", "rbSpawnA_1", "rbWpA_0", "rbDespawnA_0"], "F90_fnc_startRoadblock", 1] call F90_fnc_executeServer;
}, RoadblockHandler_0] call F90_fnc_addAction;

["endRoadblock", RbBoard_0, "Off Duty", 
{
    params ["_target", "_player", "_args"];
    [[_player, _args], "F90_fnc_endRoadblock", 1] call F90_fnc_executeServer;
}, RoadblockHandler_0] call F90_fnc_addAction;

["startRoadblock", RbBoard_1, "Start Roadblock", 
{
    params ["_target", "_player", "_args"];
    [[_player, _args, "rbSpawnB_0", "rbSpawnB_1", "rbWpB_0", "rbDespawnB_0"], "F90_fnc_startRoadblock", 1] call F90_fnc_executeServer;
}, RoadblockHandler_1] call F90_fnc_addAction;

["endRoadblock", RbBoard_1, "Off Duty", 
{
    params ["_target", "_player", "_args"];
    [[_player, _args], "F90_fnc_endRoadblock", 1] call F90_fnc_executeServer;
}, RoadblockHandler_1] call F90_fnc_addAction;

["startRpgPractice", aagPracticeSpawner, "Start RPG Practice", 
{
    [[], "F90_fnc_startRpgPractice", 0] call F90_fnc_executeServer;
}] call F90_fnc_addAction;

["startRiflePractice", firingRangeLaptop, "Spawn bot 200m", 
{
    [["200"], "F90_fnc_startRiflePractice", 0] call F90_fnc_executeServer;
}] call F90_fnc_addAction;

["startRiflePractice", firingRangeLaptop, "Spawn bot 400m", 
{
    [["400"], "F90_fnc_startRiflePractice", 0] call F90_fnc_executeServer;
}] call F90_fnc_addAction;

["PlaySong1", laptopPerhimpunan, "Play - Negaraku",
{
    [loudSpeaker_Office, "S_Negaraku_01", 100, 1] remoteExec ["say3D", 0];
}] call F90_fnc_addAction;

["PlaySong2", laptopPerhimpunan, "Play - Darah Satria",
{
    [loudSpeaker_Office, "S_DarahSatria_01", 100, 1] remoteExec ["say3D", 0];
}] call F90_fnc_addAction;

["PlaySong3", laptopPerhimpunan, "Play - Darah Satria Instrument",
{
    [loudSpeaker_Office, "S_DarahSatria_02", 100, 1] remoteExec ["say3D", 0];
}] call F90_fnc_addAction;

{
    [_x, 10] call F90_fnc_makeRespawnable;
} forEach ((getMissionLayerEntities "Vehicles_1stMIR") select 0);