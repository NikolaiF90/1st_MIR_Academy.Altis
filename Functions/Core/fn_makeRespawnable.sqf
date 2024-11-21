/*
    Author: PrinceF90

    Description:
        This function sets up a vehicle for respawning by storing its respawn information and adding an event handler for when it is killed.

    Parameter(s):
        _vehicle - The vehicle to be set up for respawning.  [OBJECT]
        _respawnTime - The time in seconds before the vehicle respawns.  [NUMBER]

    Returns: 
        None
*/
params ["_vehicle", "_respawnTime"];

// Make default respawn time to 30 seconds
if (isNil "_respawnTime") then {_respawnTime = 30};

// Create an array to store respawnable vehicles if one doesn't exist
if (isNil "MIR_RespawnableVehicles") then 
{
    MIR_RespawnableVehicles = [];
};

// Safecheck to avoid duplicates
if ((MIR_RespawnableVehicles pushBackUnique _vehicle) == -1) exitWith {};

private _type = typeOf _vehicle;
private _pos = getPosASL _vehicle;
private _dir = getDir _vehicle;
private _vector = [vectorDir _vehicle, vectorUp _vehicle];

private _respawnInformation = [_type, _pos, _dir, _vector, _respawnTime];
_vehicle setVariable ["RespawnInformation", _respawnInformation];

_vehicle addMPEventHandler ["MPKilled", 
{
    if (isServer) then 
    {
        params ["_vehicle", "_killer", "_instigator"];

        private _respawnInformation = _vehicle getVariable "RespawnInformation";
        
        [F90_fnc_respawnVehicle, [_vehicle, _respawnInformation], _respawnInformation select 4] call CBA_fnc_waitAndExecute;
    };
}];