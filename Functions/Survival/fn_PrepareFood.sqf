[] call F90_fnc_CloseDialog;

private _caller = player;
_caller setVariable ["IsPreparingFood", true, true];

private _dialogIDs = SurvivalHandler getVariable "DialogIDs";

private _listID = _dialogIDs get "ID_CookMenuList";
private _selectedItem = lbCurSel _listID;

private _currentPlayerAction = _caller getVariable "Survival_CurrentAction";

private _foodDrinkItems =
switch (_currentPlayerAction) do 
{
    case "CookingFood": 
    {
        SurvivalHandler getVariable "FoodItems"
    };
    case "MakingDrink": 
    {
        SurvivalHandler getVariable "DrinkItems"
    };
};

private _itemToPrepare = _foodDrinkItems select _selectedItem;

private _prepTime = _itemToPrepare select 1;
private _itemName = _itemToPrepare select 2;
hint format ["Preparing %1. Please wait %2 seconds!", _itemName, _prepTime];

private _arguments = [_caller, _itemToPrepare];
private _fn_loadFoodToContainer = 
{
    params ["_caller", "_itemToPrepare"];

    _caller setVariable ["IsPreparingFood", false, true];
    _caller setVariable ["Survival_CurrentAction", "", true];

    private _itemName = _itemToPrepare select 2;
    hint format ["%1 is ready!", _itemName];

    private _containerList = SurvivalHandler getVariable "ContainerList";
    private _container = _containerList get (format ["%1Container", _caller]);

    private _itemClass = _itemToPrepare select 0;
    _container addItemCargoGlobal [_itemClass, 1];
};

[_fn_loadFoodToContainer, _arguments, _prepTime] call CBA_fnc_waitAndExecute;