[{!isNull player},
{
    // Dynamic Group - ToDo
    ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
    
    // EH 
    player addEventHandler ["Killed", { player setVariable ["DeadLoadout", getUnitLoadout player]; }];
    player addEventHandler ["Respawn", { private _loadout = player getVariable "DeadLoadout"; if (!isNil "_loadout") then { player setUnitLoadout _loadout; }; }];
}] call cba_fnc_waitUntilAndExecute;