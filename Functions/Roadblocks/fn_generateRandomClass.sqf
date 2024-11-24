params ["_handler", "_side"];

private _classList = if (_side == civilian) then 
{
    _handler getVariable "CivilianClasses"
} else 
{
    _handler getVariable "EnemyClasses"
};

private _type = selectRandom _classList;
if (_type == "") exitWith {[_handler, _side] call F90_fnc_generateRandomClass};

private _isMan = _type isKindOf "CAManBase";
if !(_isMan) exitWith {[_handler, _side] call F90_fnc_generateRandomClass};

_type