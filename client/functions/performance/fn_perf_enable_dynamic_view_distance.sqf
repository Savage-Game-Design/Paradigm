/*
    File: fn_perf_enable_dynamic_view_distance.sqf
    Author:  Savage Game Design
    Public: Yes
    
    Description:
		Enables dynamic view distance scaling, in order to achieve a minimum performance goal.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [parameter] call vn_fnc_myFunction
*/
params [["_minFps", 20], ["_upscaleFps", 26]];

para_s_perf_fps_min = _minFps;
para_s_perf_fps_min_to_scale_up_view = _upscaleFps;
para_s_perf_fps_record_freq = 2;
para_s_perf_fps_history_max_size = 5;
para_s_perf_fps_history = [];

para_s_perf_view_downscale_rate = 300;
para_s_perf_view_upscale_rate = 100;

para_s_perf_min_view_distance = 800 min viewDistance;
para_s_perf_min_object_view_distance = 600 min (getObjectViewDistance select 0);

private _script = {
	private _enableMFViewDist = ["para_enableDynamicViewDist"] call para_c_fnc_optionsMenu_getValue;
	if (_enableMFViewDist != 1) exitWith {};
	
	para_s_perf_fps_min = ["para_minFpsViewDist"] call para_c_fnc_optionsMenu_getValue;
	para_s_perf_fps_min_to_scale_up_view = para_s_perf_fps_min + 6;
	private _history = para_s_perf_fps_history;
	_history pushBack diag_fps;
	if (count _history > para_s_perf_fps_history_max_size) then {
		_history = _history select [1, para_s_perf_fps_history_max_size];
		para_s_perf_fps_history = _history;
	};

	private _total = _history select 0;
	{ _total = _total + _x; } forEach (_history select [1,9]);
	private _average = _total / count _history;

	if (_average < para_s_perf_fps_min) then {
		setObjectViewDistance (((getObjectViewDistance # 0) - para_s_perf_view_downscale_rate) max para_s_perf_min_object_view_distance);
		setViewDistance ((viewDistance - para_s_perf_view_downscale_rate) max para_s_perf_min_view_distance);
	};
	if (_average > para_s_perf_fps_min_to_scale_up_view) then {
		private _maxViewdist = ["para_maxViewdist"] call para_c_fnc_optionsMenu_getValue;
		private _maxObjectViewdist = ["para_maxObjectViewdist"] call para_c_fnc_optionsMenu_getValue;
		setObjectViewDistance (((getObjectViewDistance # 0) + para_s_perf_view_upscale_rate) min _maxObjectViewdist);
		setViewDistance ((viewDistance + para_s_perf_view_upscale_rate) min _maxViewdist);
	};
	
};

["perf_auto_view_distance", _script, [], para_s_perf_fps_record_freq] call para_g_fnc_scheduler_add_job;


