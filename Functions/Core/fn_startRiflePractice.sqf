params ["_range"];

private _group = createGroup [east, true];
private _spawnPos = if (_range isEqualTo "200") then 
{
    RiflePractice_BotSpawnPos
} else 
{
    RiflePractice_BotSpawnPos_1
};
private _bot = _group createUnit ["O_Soldier_F", _spawnPos, [], 0, "NONE"];

_bot disableAI "AUTOTARGET";
_bot disableAI "TARGET";
_bot disableAI "AUTOCOMBAT";

[_group, _spawnPos, 20] call BIS_fnc_taskPatrol;