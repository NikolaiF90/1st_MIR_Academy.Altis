// Format for item x 0: STRING _className 1: INT _preparationTime
private _foodItems = 
[
    ["mir_food_mushrooms", 10],
    ["mir_soup_chicken", 30],
    ["mir_soup_vegetable", 30],
    ["mir_food_PhillySteak", 25],
    ["mir_food_ChickenGrill", 25],
    ["mir_food_SmashBurger", 25],
    ["mir_food_ChickenChop", 25],
    ["mir_food_LambGrill", 25],
    ["mir_food_NasiLemak", 25],
    ["mir_food_PastaAglioOlio", 25]
];

// Format for item x 0: STRING _className 1: INT _preparationTime
private _drinkItems = 
[
    ["mir_drink_water_big", 10],
    ["mir_drink_water_small", 5],
    ["mir_drink_HotLatte", 20],
    ["mir_drink_IcedLatte", 20],
    ["mir_drink_IcedChocolate", 20],
    ["mir_drink_IcedMatcha", 20]
];

/////// DO NOT EDIT ANYTHING BELOW ////////////

// Generate name
private _config = configFile >> "CfgWeapons";
{
    private _class = _x select 0;
    private _foodName = getText (_config >> _class >> "displayName");
    private _newValue = [_class, _x select 1, _foodName];
    _foodItems set [_forEachIndex, _newValue];
} forEach _foodItems;
{
    private _class = _x select 0;
    private _drinkName = getText (_config >> _class >> "displayName");
    private _newValue = [_class, _x select 1, _drinkName];
    _drinkItems set [_forEachIndex, _newValue];
} forEach _drinkItems;

// Saving all above 
SurvivalHandler setVariable ["FoodItems", _foodItems, true];
SurvivalHandler setVariable ["DrinkItems", _drinkItems, true];

// Dialog ID 
private _dialogIDs = createHashMap;
_dialogIDs set ["ID_CookMenu", 1100];
_dialogIDs set ["ID_CookMenuTitle", 1102];
_dialogIDs set ["ID_CookMenuList", 1103];
_dialogIDs set ["ID_CookMenuPreparationTimeText", 1104];

SurvivalHandler setVariable ["DialogIDs", _dialogIDs, true];

SurvivalHandler setVariable ["ContainerList", createHashMap, true];

SurvivalHandler setVariable ["Initialized", true, true];