/*
	File: fn_para_RscDisplayToggleZone.sqf
	Author: Savage Game Design
	Date: 2022-07-23
	Last Update: 2022-07-24
	Public: No

	Description:
		Initializes the UI to toggle zones with.
	
	Parameter(s):
		_mode - "onLoad" or "onUnload" [STRING]
		_params - Parameters passed down from para_c_fnc_initMissionDisplay [ARRAY]
	
	Returns:
		Nothing [nil]
	
	Example(s):
		["onLoad", _this] call para_fnc_para_RscDisplayToggleZone;
*/
#include "..\..\..\configs\ui\ui_def_base.inc"
params ["_mode", "_params"];
switch _mode do {
	case "onLoad":{
		_params params ["_display"];
		_ctrlZones = _display displayCtrl PARA_RSCDISPLAYTOGGLEZONE_ZONES_IDC;
		// private _zones = [] call para_c_fnc_getZones; // TODO: Implement
		_zones = ["Zone 1", "Zone 2", "Zone 3"]; // TODO: Remove
		_zones apply {
			private _ind = _ctrlZones lbAdd _x;
			_ctrlZones lbSetData [_ind, _x];
			// if (_x call para_c_fnc_isZoneActive) then { // TODO: Implement function
			if (true) then { // TODO: Remove
				_ctrlZones lbSetTextRight [_ind, "A"];
			};
		};
		_ctrlZones ctrlAddEventHandler ["LBSelChanged", {
			["zoneSelected", _this] call para_c_fnc_para_RscDisplayToggleZone;
		}];
		_ctrlZones lbSetCurSel 0; // Select a default entry

		private _ctrlToggle = _display displayCtrl PARA_RSCDISPLAYTOGGLEZONE_TOGGLE_IDC;
		_ctrlToggle ctrlAddEventHandler ["ButtonClick", {
			["toggleZone", _this] call para_c_fnc_para_RscDisplayToggleZone;
		}];

		private _ctrlComplete = _display displayCtrl PARA_RSCDISPLAYTOGGLEZONE_COMPLETE_IDC;
		_ctrlComplete ctrlAddEventHandler ["ButtonClick", {
			// Complete the zone
		}];
	};
	
	// TOOD: Move to own function
	case "zoneSelected": {
		_params params ["_ctrlZones", "_ind"];
		private _zone = _ctrlZones lbData _ind;
		private _display = ctrlParent _ctrlZones;
		private _ctrlToggle = _display displayCtrl PARA_RSCDISPLAYTOGGLEZONE_TOGGLE_IDC;
		private _buttonText = ["Activate Zone", "Deactivate Zone"] select ( // TODO: Localize
			_zone call para_c_fnc_isZoneActive
		);
		_ctrlToggle ctrlSetText _buttonText;
	};
	
	// TODO: Move to own function
	case "toggleZone": {
		_params params ["_ctrlToggle"];
		private _display = ctrlParent _ctrlToggle;
		private _ctrlZones = _display displayCtrl PARA_RSCDISPLAYTOGGLEZONE_ZONES_IDC;
		private _ind = lbCurSel _ctrlZones;
		private _selectedZone = _ctrlZones lbData _ind;
		diag_log _selectedZone;
		// TODO: Implement:
		if (_selectedZone call para_c_fnc_isZoneActive) then {
			// Deactivate zone
			_selectedZone call para_c_fnc_completeZone;
			_ctrlZones lbSetTextRight [_ind, ""]; // Remove active indicator from UI
		} else {
			// Make active
			_selectedZone call para_c_fnc_startZone;
			_ctrlZones lbSetTextRight [_ind, "A"];
		};
		["zoneSelected", [_ctrlZones, _ind]] call para_c_fnc_para_RscDisplayToggleZone; // Update text on the toggle button
	};

	case "onUnload":{
		_params params ["_display", "_exitCode"];
	};
};
nil
