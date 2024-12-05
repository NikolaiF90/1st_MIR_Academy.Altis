[{!isNull player},
{
    // Dynamic Group - ToDo
    ["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
    
    // EH 
    player addEventHandler ["Killed", { player setVariable ["DeadLoadout", getUnitLoadout player]; }];
    player addEventHandler ["Respawn", { private _loadout = player getVariable "DeadLoadout"; if (!isNil "_loadout") then { player setUnitLoadout _loadout; }; }];

    // Actions
    private _action = ["Speak_Action", "MIR Speak", "\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa", {}, {true}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
    
    _action = ["OrderStop", "Shout: STOP!", "\A3\ui_f\data\igui\cfg\simpleTasks\types\talk3_ca.paa", {[] call F90_fnc_OrderStop;}, {isNull objectParent player}] call ace_interact_menu_fnc_createAction;
    [player, 1, ["ACE_SelfActions", "Speak_Action"], _action] call ace_interact_menu_fnc_addActionToObject;

}] call cba_fnc_waitUntilAndExecute;