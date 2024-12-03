params ["_actionName", "_object", "_title", "_script", "_arguments", "_condition"];

private _action = [_actionName, _title, "", _script, _condition, {}, _arguments] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;