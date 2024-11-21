/*
	Author: PrinceF90 
 
	Description: 
		This function logs debug information, displays it in-game, and optionally saves it to the player's recent notifications.
	Parameters: 
		_debugOn - Indicates whether debugging is enabled or not. [BOOL]
		_fileName - The name of the file for logging purposes. [STRING]
		_text - The debug text to be logged. [STRING]
		_visibleInGame - (Optional, default false). Determines if the debug text should be displayed in-game as systemChat. [BOOL]
		_saveToPlayer - (Optional, default false). Specifies whether the debug text should be saved to the player's recent notifications. Only raw messages will be stored. [BOOL]

	Returns: 
		_returnText - The formatted debug text that was logged, or an empty string if debugging is disabled.
*/

params ["_debugOn", "_fileName", "_text", "_visibleInGame", "_saveToPlayer"];

if (typeName _debugOn != "BOOL") exitWith { diag_log "F90Debug: (ERROR) F90_fnc_debug only accept boolean as the first parameters." };
if (isNil {_fileName}) then {_fileName = "DEBUG";} else { if (_fileName isEqualTo "" || _fileName isEqualTo " ") then {_fileName = "DEBUG"};};
if (isNil {_text}) then {_text = "Debug Marker"};
if (isNil {_visibleInGame}) then { _visibleInGame = false };
if (isNil {_saveToPlayer}) then { _saveToPlayer = false };

private _returnText = "";

if (_debugOn) then
{
	_returnText = format ["[F90 %1] %2", _fileName, _text];
	diag_log _returnText;
	if (_visibleInGame) then 
	{
		systemChat _returnText;
	};

	if (_saveToPlayer) then 
	{
		private _unit = player;
		if !(isNull _unit) then 
		{
			//[_text, _unit] call F90_fnc_addToRecentNotification;
		};
	};
};

_returnText