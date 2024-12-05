params ["_target", "_player", "_vehicle"];

private _isDriver = _target getVariable "IsDriver";

private _passInspection = if (isNull _vehicle) then 
{
    false
} else 
{
    _vehicle getVariable "PassInspection"
};

if (_passInspection) exitWith 
{
    if (_isDriver) then
    {
        ["The driver has been verified to pass the inspection!"] remoteExec ["hint", _player];
    } else 
    {
        ["The passenger has been verified to pass the inspection!"] remoteExec ["hint", _player];
    };
};

private _passengerID = _target getVariable "PassengerID";

if !(alive _target) exitWith 
{
    if (_isDriver) then 
    {
        ["The driver is not alive anymore!"] remoteExec ["hint", _player];
    } else 
    {
        ["The passenger is not alive anymore!"] remoteExec ["hint", _player];
    };
};

deleteVehicle _target;

if (_isDriver) then
{
    ["The driver has been arrested!"] remoteExec ["hint", _player];
} else 
{
    ["The passenger has been arrested!"] remoteExec ["hint", _player];
};

private _arrestData = _vehicle getVariable "ArrestData";
_arrestData set [_passengerID, true];

if ((_vehicle getVariable "VehicleLifetime") > 0) then 
{
    _vehicle setVariable ["VehicleLifetime", 0, true];
};