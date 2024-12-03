params ["_listBoxID", "_items"];

lbClear _listBoxID;

{
    lbAdd [_listBoxID, _x];
} forEach _items;