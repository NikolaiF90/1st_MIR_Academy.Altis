params ["_handler"];

private _initialized = _handler getVariable ["Initialized", false];

if (_initialized) exitWith {};

_handler setVariable ["VehicleMaxLifetime", 100, true];
_handler setVariable ["EnemySpawnChance", 30, true];

private _legalItems = 
[
    "ItemCompass",
    "ACE_Banana",
    "ACE_fieldDressing",
    "ACE_packingBandage",
    "Binocular",
    "Butane_Canister",
    "ChemicalDetector_01_watch_F",
    "ACE_epinephrine",
    "ItemGPS",
    "ACE_morphine",
    "ACE_painkillers",
    "ToolKit",
    "ItemWatch"
];
_handler setVariable ["RBLegalItems", _legalItems, true];

private _illegalItems = 
[
    "O_NVGoggles_urb_F",
    "O_NVGoggles_hex_F",
    "NVGogglesB_blk_F",
    "Laserdesignator_02",
    "NVGoggles_OPFOR",
    "O_UavTerminal",
    "TFAR_anprc152",
    "TFAR_fadak",
    "optic_Aco",
    "optic_Holosight_smg_blk_F",
    "optic_Holosight_blk_F",
    "optic_DMS",
    "optic_Arco_blk_F",
    "optic_Arco_AK_blk_F",
    "optic_KHS_hex",
    "muzzle_snds_M",
    "muzzle_snds_B"
];
_handler setVariable ["RBIllegalItems", _illegalItems, true];

private _allWeapons =  "getNumber (_x >> 'scope') >= 2 AND (count (getArray (_x >> 'magazines')) > 0)" configClasses (configFile >> "CfgWeapons");
_weapons = _allWeapons apply {configName _x};
_handler setVariable ["RBWeapons", _weapons, true];

private _magazineConfig = configfile >> "CfgMagazines";
private _allMagazines = "getNumber (_x >> 'scope') >= 2" configClasses (configfile >> "CfgMagazines");
private _magazines = _allMagazines apply {configName _x};
_handler setVariable ["RBMagazines", _magazines, true];

// Do not edit anything below
private _allCivilians = "getNumber (_x >> 'scope') >= 2 AND getText (_x >> 'faction') isEqualTo 'CIV_F'" configClasses (configfile >> "CfgVehicles");
private _civilianClasses = _allCivilians apply {configName _x};
_handler setVariable ["CivilianClasses", _civilianClasses, true];

private _allEnemy = "getNumber (_x >> 'scope') >= 2 AND getText (_x >> 'faction') isEqualTo 'OPF_G_F'" configClasses (configfile >> "CfgVehicles");
private _enemyClasses = _allEnemy apply {configName _x};
_handler setVariable ["EnemyClasses", _enemyClasses, true];

private _allVehicles = "getNumber (_x >> 'scope') >= 2 AND getText (_x >> 'faction') isEqualTo 'CIV_F' AND getText (_x >> 'vehicleClass') isEqualTo 'Car'" configClasses (configfile >> "CfgVehicles");
private _vehicleClasses = _allVehicles apply {configName _x};
_handler setVariable ["VehicleClasses", _vehicleClasses, true];

private _civilianTypes = ["Civilian", "Smuggler", "Seller", "Rebel"];
_handler setVariable ["CivilianTypes", _civilianTypes, true];

_handler setVariable ["SpawnedVehicles", [], true];

_handler setVariable ["Initialized", true, true];