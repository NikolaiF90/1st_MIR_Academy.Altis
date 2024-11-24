
/*
    Author: PrinceF90

    Description:
        This function adds a custom action to an object for all players.

    Parameter(s):
        _actionName - The unique name of the action. [STRING]
        _object - The object to which the action is added. [OBJECT]
        _title - The title displayed for the action. [STRING]
        _script - The script to execute when the action is triggered.  Parameters array passed to the script upon activation in _this variable is: ``"_target", "_caller", "_arguments"``;[STRING]
        _arguments - (Optional, default nil) arguments to pass to the script. Accessible with _this select 2 inside the script. If Array is used as an argument for example, its first element reference would be ``_this select 3 select 0`` [ANY]
        _condition - (Optional, default "true") expression that must return true for the action to be shown. Special variables passed to the script code are ``_target: Object - The object to which action is attached or, if the object is a unit inside of vehicle, the vehicle; _this: Object - Caller person to whom the action is shown (or not shown if condition returns false); _originalTarget: Object - The original object to which the action is attached, regardless if the object/unit is in a vehicle or not; _actionId: Number - checked action's ID (same as addAction's return value)``. [STRING]

    Returns: 
        None
*/
params ["_actionName", "_object", "_title", "_script", "_arguments", "_condition"];

private _varName = format ["%1ActionAdded", _actionName];
private _actionCreated = player getVariable [_varName, false];

if !(_actionCreated) then 
{
    if (isNil "_arguments") then {_arguments = []};
    if (isNil "_condition") then {_condition = {true}};

    [_actionName, _object, _title, _script, _arguments, _condition] remoteExec ["F90_fnc_addActionX", 0, true];
};