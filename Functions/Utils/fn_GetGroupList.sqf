params ["_faction", "_sideName"];

private _config = (configfile >> "CfgGroups" >> _sideName >> _faction);
private _allCategory = _config call BIS_fnc_getCfgSubClasses;
private _blackList = ["motorized", "mechanized", "armored", "sdv", "uav", "ugv", "boat", "tankplatoon", "tanksection", "spgplatoon", "spgsection"];

private _returnData = [];
{
    private _isBlacklisted = false;
    private _nameArray = _x splitString "_";
    {
        if ((toLower _x) in _blackList) exitWith {_isBlacklisted = true};
    } forEach _nameArray;

    if (_isBlacklisted) then {continue};

    private _allTypes = [];
    private _types = (_config >> _x) call BIS_fnc_getCfgSubClasses;
    {
        private _typeNameArray = _x splitString "_";
        {
            if ((toLower _x) in _blackList) exitWith {_isBlacklisted = true};
        } forEach _typeNameArray;
        if (_isBlacklisted) then {continue};

        _allTypes pushBack _x;
    } forEach _types;
    private _data = [_x, _allTypes];
    _returnData pushBack _data;

} forEach _allCategory;

_returnData