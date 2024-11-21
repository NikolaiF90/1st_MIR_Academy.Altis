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

if (isNil "_targetClient") then {_targetClient = 0};
[_args, _functionName, _targetClient] remoteExec ["F90_fnc_executeServerX", 0]; 