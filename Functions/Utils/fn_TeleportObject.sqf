/*
    Author: PrinceF90

    Description:
        Teleports _object1 to a specified position relative to _object2, adjusting for terrain height and building obstacles.

    Parameter(s):
        _object1 - The object to be teleported [OBJECT]
        _object2 - The reference object for positioning [OBJECT]
        _rotDegree - (Optional, default 0) The rotation degree for positioning. [NUMBER]

    Returns:
        _teleportPos - The final position to which the object is teleported.
*/
params ["_object1", "_object2", "_rotDegree"];

private _object2Position = getPosASL _object2;
private _terrainHeight = getTerrainHeightASL _object2Position;
private _teleportPos = [];

if (isNil {_rotDegree}) then {_rotDegree = 0};

if (_object2Position select 2 > _terrainHeight) then
{
    // Adjust for buildings
    private _adjustedPos = _object2Position;
    _teleportPos = _adjustedPos getPos [1.25, getDir _object2 + _rotDegree];
    _object1 setPosASL (AGLToASL _teleportPos);
} else 
{
    // Teleport to exact position(if it's not inside a building)
    _teleportPos = _object2 getPos [1.25, getDir _object2 + _rotDegree];
    _object1 setPos _teleportPos;
};

// Change unit rotation 
_object1 setDir (_object1 getDir _object2);
_teleportPos