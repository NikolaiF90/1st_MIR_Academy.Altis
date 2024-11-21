params ["_units"];

if (count _units == 0) exitWith {};

private _unit = _units select 0;
moveOut _unit;
_units deleteAt 0;

[F90_fnc_moveOut, [_units]] call CBA_fnc_execNextFrame;