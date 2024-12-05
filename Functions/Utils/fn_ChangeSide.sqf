/*
    Author: PrinceF90

    Description:
        Function to change the side of the specified unit.

    Parameter(s):
        _unit - The unit to be added to the new group. [OBJECT]
        _side - The side on which the new group will be created. [STRING]

    Returns: 
        None - The function does not return a value.
*/

params ["_unit", "_side"];

private _group = createGroup _side;
[_unit] joinSilent _group;
_group deleteGroupWhenEmpty true;