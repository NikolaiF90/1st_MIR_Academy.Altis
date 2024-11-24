Headless_Client0Present = if (isNil "hc_0") then {false} else {true};
Headless_Client1Present = if (isNil "hc_1") then {false} else {true};

[[], "F90_fnc_initHeadlessVariables", 0] call F90_fnc_executeServer;

["startRoadblock", rbBoard, "Start Roadblock", 
{
    [[RoadblockHandler], "F90_fnc_startRoadblock", 1] call F90_fnc_executeServer;
}] call F90_fnc_addAction;

["endRoadblock", rbBoard, "Off Duty", 
{
    [[RoadblockHandler], "F90_fnc_endRoadblock", 1] call F90_fnc_executeServer;
}] call F90_fnc_addAction;

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

private _flag01 = "Flag_AAF_F" createVehicle [2175.1,5740.76,5.589];
private _flag02 = "Flag_AAF_F" createVehicle [2176.04,5740.58,5.587];

_flag01 setFlagTexture "\media\Flag_Malaysia.paa";
_flag02 setFlagTexture "\media\Flag_MIR.paa";