params ["_vehicle", "_handler"];

private _civilianTypes = _handler getVariable "CivilianTypes";
private _type = selectRandom _civilianTypes;

private _legalItems = _handler getVariable "RBLegalItems";
private _illegalItems = _handler getVariable "RBIllegalItems";
private _weapons = _handler getVariable "RBWeapons";
private _magazines = _handler getVariable "RBMagazines";

private _legalCargo = [];
private _illegalCargo = [];
private _weaponCargo = [];
private _magazineCargo = [];

switch (_type) do 
{
    case "Civilian": 
    {
        private _cargoTypeCount = [1, 5] call BIS_fnc_randomInt;

        for "_i" from 0 to _cargoTypeCount - 1 do 
        {
            private _item = selectRandom _legalItems;
            private _counts = [1, 3] call BIS_fnc_randomInt;
            private _data = [_item, _counts];
            _legalCargo pushBack _data;
        };
    };
    case "Smuggler": 
    {
        private _cargoTypeCount = [5, 10] call BIS_fnc_randomInt;

        for "_i" from 0 to _cargoTypeCount - 1 do 
        {
            private _cargoType = nil;
            private _dynamicCargo = nil;

            private _cargoTypeString = selectRandom ["illegalItems", "weapons", "magazines"];
            switch (_cargoTypeString) do 
            {
                case "illegalItems": 
                {
                    _cargoType = +_illegalItems;
                    _dynamicCargo = _illegalCargo;
                };
                case "weapons":
                {
                    _cargoType = +_weapons;
                    _dynamicCargo = _weaponCargo;
                };
                case "magazines": 
                {
                    _cargoType = +_magazines;
                    _dynamicCargo = _magazineCargo;
                };
            };

            private _item = selectRandom _cargoType;
            private _counts = [10, 20] call BIS_fnc_randomInt;
            private _data = [_item, _counts];
            _dynamicCargo pushBack _data;
        };
    };
    case "Seller":
    {
        private _cargoTypeCount = [5, 10] call BIS_fnc_randomInt;

        for "_i" from 0 to _cargoTypeCount - 1 do 
        {
            private _item = selectRandom _legalItems;
            private _counts = [10, 20] call BIS_fnc_randomInt;
            private _data = [_item, _counts];
            _legalCargo pushBack _data;
        };
    };
    case "Rebel":
    {
        private _cargoTypeCount = [1, 5] call BIS_fnc_randomInt;

        for "_i" from 0 to _cargoTypeCount - 1 do 
        {
            private _cargoType = nil;
            private _dynamicCargo = nil;

            private _cargoTypeString = selectRandom ["illegalItems", "weapons", "magazines"];
            switch (_cargoTypeString) do 
            {
                case "illegalItems": 
                {
                    _cargoType = +_illegalItems;
                    _dynamicCargo = _illegalCargo;
                };
                case "weapons":
                {
                    _cargoType = +_weapons;
                    _dynamicCargo = _weaponCargo;
                };
                case "magazines": 
                {
                    _cargoType = +_magazines;
                    _dynamicCargo = _magazineCargo;
                };
            };

            private _item = selectRandom _cargoType;
            private _counts = [1, 5] call BIS_fnc_randomInt;
            private _data = [_item, _counts];
            _dynamicCargo pushBack _data;
        };
    };
};

{
    private _data = _x;
    _vehicle addItemCargoGlobal [_x select 0, _x select 1];
} forEach _legalCargo;

{
    private _data = _x;
    _vehicle addItemCargoGlobal [_x select 0, _x select 1];
} forEach _illegalCargo;

{
    private _data = _x;
    _vehicle addWeaponCargoGlobal [_x select 0, _x select 1];
} forEach _weaponCargo;

{
    private _data = _x;
    _vehicle addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach _magazineCargo;