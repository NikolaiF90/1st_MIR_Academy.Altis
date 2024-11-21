params ["_unit", "_damage", "_bodyPart", "_source"];
// boypart can be: "Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"
// source can be: "bullet", "stab"
[_unit, _damage, _bodyPart, _source] call ace_medical_fnc_addDamageToUnit;