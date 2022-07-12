/*
	File: fn_optionsMenu_onCheckedChanged.sqf
	Author:  Savage Game Design
	Public: No
	
	Description:
		Handles a Checkbox change.

	Parameter(s):
		_control - Control [CONTROL]
		_newValue - New value [NUMBER]

	Returns: nothing
	
	Example(s): none
*/

params ["_control", "_newValue"];

private _data = _control getVariable "#data";
_data params ["_name", "_varname", "_type", "_default", "_value", "_ctrlName", "_ctrlBackground", "_ctrlGroup"];

[_control, _varname, _newValue, _value] call para_c_fnc_optionsMenu_handleChange;

#define PARSE_BOOL(N) ([false,true] select N)
_control ctrlSetTooltip format ["Default: %1\nCurrent: %2\nNew: %3", PARSE_BOOL(_default), PARSE_BOOL(_value), PARSE_BOOL(_newValue)];
#undef PARSE_BOOL
