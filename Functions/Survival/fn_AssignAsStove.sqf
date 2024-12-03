params ["_stove", "_containerBox", "_cookActionTitle", "_inventoryItemTitle"];

private _initialized = SurvivalHandler getVariable ["Initialized", false];

if !(_initialized) then {[] call F90_fnc_InitSurvival;};

if (isNil "_cookActionTitle") then {_cookActionTitle = "Cook Food"};
if (isNil "_inventoryItemTitle") then {_inventoryItemTitle = "Open Stove"};

[_containerBox, _stove] call F90_fnc_TeleportObject;

private _inventoryScript = 
{
    params ["_target", "_caller", "_containerBox"];

    _caller action ["Gear", _containerBox];
};

private _arguments = [_containerBox, _inventoryScript];
_stove addaction [_inventoryItemTitle, 
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    
    private _fn_OpenInventory = _arguments select 1;
    [_target, _caller, _arguments select 0] call _fn_OpenInventory;
}, _arguments, 6, true, true, "", "true", 5];

private _uniqueID = [1000000, 9999999] call BIS_fnc_randomInt;
private _actionName = format ["%1%2", _inventoryItemTitle, _uniqueID];
private _action = [_actionName, _inventoryItemTitle, "", 
{
    params ["_target", "_caller", "_arguments"];
    
    private _fn_OpenInventory = _arguments select 1;
    [_target, _caller, _arguments select 0] call _fn_OpenInventory;
}, {true}, {}, _arguments, [0,0,0], 5] call ace_interact_menu_fnc_createAction;
[_stove, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

private _cookScript = 
{
    params ["_target", "_caller", "_container"];

    private _isPrepping = _caller getVariable ["IsPreparingFood", false];
    if (_isPrepping) exitWith {hint "You can only prepare one food or drink at a time!"};
    
    private _containerList = SurvivalHandler getVariable "ContainerList";
    _containerList set [format["%1Container", _caller], _container];
    SurvivalHandler setVariable ["ContainerList", _containerList, true];

    // Reset
    SurvivalHandler setVariable ["CookMenuTempArguments", nil];

    _caller setVariable ["Survival_CurrentAction", "CookingFood", true];

    createDialog "CookMenu";

    private _foodItems = SurvivalHandler getVariable "FoodItems";
    private _foodList = [];
    {
        private _name = _x select 2;
        _foodList pushBack _name;
    } forEach _foodItems;

    private _dialogIDs = SurvivalHandler getVariable "DialogIDs";
    private _titleID = _dialogIDs get "ID_CookMenuTitle";
    ctrlSetText [_titleID, "Food Menu"];

    private _listID = _dialogIDs get "ID_CookMenuList";
    [_listID, _foodList] call F90_fnc_PopulateListBox;

    lbSetCurSel [_listID, 0];
    private _selectedItem = _foodItems select 0;
    private _prepTime = _selectedItem select 1;

    private _timeTextID = _dialogIDs get "ID_CookMenuPreparationTimeText";
    ctrlSetText [_timeTextID, format ["Preparation Time: %1s", _prepTime]];
    SurvivalHandler setVariable ["CookMenuTempArguments", [_foodItems, _timeTextID]];

    private _menuID = _dialogIDs get "ID_CookMenu";
    (findDisplay _menuID) displayCtrl _listID ctrlAddEventHandler ["LBSelChanged",  
    {
        params ["_control", "_lbCurSel", "_lbSelection"];

        private _arguments = SurvivalHandler getVariable "CookMenuTempArguments";
        private _foodItems = _arguments select 0;
        private _selectedItem = _foodItems select _lbCurSel;
        private _prepTime = _selectedItem select 1;

        private _timeTextID = _arguments select 1;
        ctrlSetText [_timeTextID, format ["Preparation Time: %1s", _prepTime]];
    }];
};

private _cookActionArguments = [_cookScript, _containerBox];
_stove addaction [_cookActionTitle, 
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    
    private _fn_CookFood = _arguments select 0;
    [_target, _caller, _arguments select 1] call _fn_CookFood;    
}, _cookActionArguments, 6, true, true, "", "true", 5];

private _uniqueID = [1000000, 9999999] call BIS_fnc_randomInt;
private _actionName = format ["%1%2", _cookActionTitle, _uniqueID];
private _action = [_actionName, _cookActionTitle, "", 
{
    params ["_target", "_caller", "_arguments"];
    
    private _fn_CookFood = _arguments select 0;
    [_target, _caller, _arguments select 1] call _fn_CookFood;
}, {true}, {}, _cookActionArguments, [0,0,0], 5] call ace_interact_menu_fnc_createAction;
[_stove, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;