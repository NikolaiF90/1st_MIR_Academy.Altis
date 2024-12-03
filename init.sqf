Mission_DebugOn = true;
enableSaving [false, false];
publicVariable "Mission_DebugOn";

if (isServer) then // Todo - isDedicated
{
    [] call F90_fnc_initServer;
};

if (hasInterface) then 
{
    [] call F90_fnc_initPlayer;
};

if (!isDedicated && !hasInterface) then 
{
    [] call F90_fnc_initHeadless;
}