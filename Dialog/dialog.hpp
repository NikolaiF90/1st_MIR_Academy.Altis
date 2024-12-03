class CookMenu 
{
    idd = 1100;

    class Controls 
    {
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT START (by Lt. Major Nikolai, v1.063, #Docewo)
        ////////////////////////////////////////////////////////

        class CookMenu_Background1: RscText
        {
            idc = 1101;
            x = 0.365938 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.268125 * safezoneW;
            h = 0.495 * safezoneH;
            colorBackground[] = {0.2,0.2,0.2,0.85};
        };
        class CookMenu_Title1: RscText
        {
            idc = 1102;
            text = "Title Goes Here"; //--- ToDo: Localize;
            x = 0.45875 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.044 * safezoneH;
            colorText[] = {1,1,1,1};
        };
        class CookMenu_List1: RscListbox
        {
            idc = 1103;
            x = 0.376249 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.396 * safezoneH;
            colorBackground[] = {0.8,0.8,0.8,0.3};
        };
        class CookMenu_Text1: RscText
        {
            idc = 1104;
            text = "Preparation Time: %1s"; //--- ToDo: Localize;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.0876563 * safezoneW;
            h = 0.033 * safezoneH;
            colorText[] = {1,1,1,1};
        };
        class CookMenu_ButtonPrepare: RscButton
        {
            idc = 1105;
            action = "[] call F90_fnc_PrepareFood";
            text = "Prepare Foods"; //--- ToDo: Localize;
            x = 0.546406 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.0773437 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.2,0.8,0.2,0.3};
        };
        class CookMenu_ButtonCancel: RscButton
        {
            idc = 1106;
            action = "[] call F90_fnc_CloseDialog";
            text = "Cancel"; //--- ToDo: Localize;
            x = 0.489687 * safezoneW + safezoneX;
            y = 0.698 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.033 * safezoneH;
            colorBackground[] = {0.8,0.1,0.1,0.3};
        };
        ////////////////////////////////////////////////////////
        // GUI EDITOR OUTPUT END
        ////////////////////////////////////////////////////////
    };
};