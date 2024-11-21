
/*
    Author: PrinceF90

    Description:
        This function adds a custom action to an object for all players.

    Parameter(s):
        _actionName - The unique name of the action. [STRING]
        _object - The object to which the action is added. [OBJECT]
        _title - The title displayed for the action. [STRING]
        _script - The script to execute when the action is triggered.  Parameters array passed to the script upon activation in _this variable is: ``"_target", "_caller", "_actionId", "_arguments"``;[STRING]
        _arguments - (Optional, default nil) arguments to pass to the script. Accessible with _this select 3 inside the script. If Array is used as an argument for example, its first element reference would be ``_this select 3 select 0`` [ANY]
        _priority -  (Optional, default 1.5) priority value of the action. Actions will be arranged in descending order according to this value. Every game action has a preset priority value. Value can be negative or decimal fraction. Actions with same values will be arranged in order which they were made, newest at the bottom. The bigger the number the higher the action will be positioned on the menu. Typical range is 0 to 6. [NUMBER]
        _showWindow - (Optional, default true) if set to true, players see "Titletext" at mid-lower screen, as they approach the object. Only the title text for the action with highest priority and showWindow set to true will be shown. [BOOLEAN]
        _hideOnUse - (Optional, default true) if set to true, it will hide the action menu after selecting it. If set to false, it will leave the action menu open and visible after selecting the action, leaving the same action highlighted, for the purpose of allowing you to re-select that same action quickly, or to select another action. [BOOLEAN]
        _shortCut - (Optional, default "") one of the key names defined in bin.pbo (e.g. "moveForward"). Adding available shortcut will bind corresponding keyboard key to this action. Shortcut availability can be tested with inputAction command. [STRING]
        _condition - (Optional, default "true") expression that must return true for the action to be shown. Special variables passed to the script code are ``_target: Object - The object to which action is attached or, if the object is a unit inside of vehicle, the vehicle; _this: Object - Caller person to whom the action is shown (or not shown if condition returns false); _originalTarget: Object - The original object to which the action is attached, regardless if the object/unit is in a vehicle or not; _actionId: Number - checked action's ID (same as addAction's return value)``. [STRING]
        _radius - (Optional, default 50) maximum 3D distance in meters between the activating unit's eyePos and object's memoryPoint, selection or position. -1 disables the radius; hardcoded limit is 50. [NUMBER]

    Returns: 
        None
*/
params ["_actionName", "_object", "_title", "_script", "_arguments", "_priority", "_showWindow", "_hideOnUse", "_shortCut", "_condition", "_radius"];

private _varName = format ["%1ActionAdded", _actionName];
private _actionCreated = player getVariable [_varName, false];

if !(_actionCreated) then 
{
    if (isNil "_arguments") then {_arguments = []};
    if (isNil "_priority") then {_priority = 1.5};
    if (isNil "_showWindow") then {_showWindow = true};
    if (isNil "_hideOnUse") then {_hideOnUse = true};
    if (isNil "_shortCut") then {_shortCut = ""};
    if (isNil "_condition") then {_condition = {true}};
    if (isNil "_radius") then {_radius = 50};

    [_actionName, _object, _title, _script, _arguments, _priority, _showWindow, _hideOnUse, _shortCut, _condition, _radius] remoteExec ["F90_fnc_addActionX", 0, true];
};