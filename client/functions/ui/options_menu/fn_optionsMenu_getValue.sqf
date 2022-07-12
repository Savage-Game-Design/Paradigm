/*
	File: fn_optionsMenu_getValue.sqf
	Author:  Savage Game Design
	Public: Yes

	Description:
		Gets the current value, if the user hasn't modified the settings, returns the default.

	Parameter(s):
		_name - Name of the option [STRING]

	Returns:
		Value [NUMBER]

	Example(s):
		["Test"] call para_c_fnc_getValue; // 0
*/

params ["_name"];

private _config = missionConfigFile >> "para_CfgOptions" >> _name;
private _default = getNumber (_config >> "default");
private _varname = getText (_config >> "variable");

private _value = profileNamespace getVariable [_varname, _default];
_value;
