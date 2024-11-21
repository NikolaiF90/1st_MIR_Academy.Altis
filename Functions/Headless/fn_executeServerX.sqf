/*
    Author: PrinceF90

    Description:
        This function executes a specified remote function on a designated headless client in a multiplayer environment or on all clients if no headless client is present.

    Parameter(s):
        _args - The arguments to be passed to the remote function. [ARRAY]
        _functionName - The name of the function to be executed remotely. [STRING]
        _targetClient - The index of the target headless client (0, 1, or 2). [NUMBER]

    Returns: 
        None - No return value is provided.
*/
params ["_args", "_functionName", "_targetClient"];

private _fn_code = 
{
    if (Headless_Client0Present && isMultiplayer) then 
    {
        private _hc = switch (_targetClient) do 
        {
            case 0: {hc_0};
            case 1: {hc_1};
            case 2: {hc_2};
        };

        _args remoteExec [_functionName, _hc];
    } else 
    {
        _args remoteExec [_functionName, 2];
    };
};

if (Mission_DebugOn) then 
{
    if (isServer) then 
    {
        [] call _fn_code;
    };
} else 
{
    if (!hasInterface) then 
    {
        [] call _fn_code;
    };
};
