params ["_vehicle", "_removePassengers"];

if (isNil "_removePassengers") then {_removePassengers = true};

if (_removePassengers) then 
{
    private _passengers = _vehicle getVariable "Passengers";
    {
        deleteVehicle _x;
    } forEach _passengers;
};

deleteVehicle _vehicle;