/*
	File: fn_optionsMenu_handleChange.sqf
	Author:  Savage Game Design
	Public: No
	
	Description:
		Handles a value change.
	
	Parameter(s):
		_control - Control [CONTROL]
		_varname - Variable name in the profileNamespace [STRING]
		_newValue - New value [NUMBER]
		_value - Old value [NUMBER]
	
	Returns: nothing
	
	Example(s): none
*/

params ["_control", "_varname", "_newValue", "_value"];
private _display = ctrlParent _control;
private _changes = _display getVariable ["#changes", []];
private _index = _changes findIf { _x#0 isEqualTo _varname };
if (_newValue isEqualTo _value) then {
	if !(_index isEqualTo -1) then {
		_changes deleteAt _index;
	};
} else {
	if (_index isEqualTo -1) then {
		_changes pushBack [_varname, _newValue];
	} else {
		_changes set [_index, [_varname, _newValue]];
	};
};
_display setVariable ["#changes", _changes];
