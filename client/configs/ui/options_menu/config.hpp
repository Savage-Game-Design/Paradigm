class para_Option {
    name = "Option Name"; // Display Name
    variable = "my_option_name"; // Variable name for saving in PFS
    tooltip = ""; // Tooltip
};

class para_OptionCheckbox: para_Option {
    type = "Checkbox";
    default = 0;
};

class para_OptionSlider: para_Option {
    type = "Slider";
    default = 50;
    range[] =  { 0, 100 };
    step = 10;
};

class para_OptionCombobox: para_Option {
    type = "Combobox";
    default = 0;
    values[] = {
        "Value Name",
        "Value Name 2"
    };
};

class para_CfgOptions {
    class para_enableWelcomeScreen {
        name = "Enable welcome screen";
        tooltip = "Enables the welcome screen on mission start";
        variable = "para_enableWelcomeScreen";
        type = "Checkbox";
        default = 0;
    };
    class para_enableTutorial {
        name = "Enable gamemode tutorials";
        tooltip = "Enables tutorial card popups with gameplay hints.";
        variable = "para_enableTutorial";
        type = "Checkbox";
        default = 1;
    };
    class para_enableDynamicViewDist {
        name = "Enable dynamic viewdistance settings";
        tooltip = "Enables all dynamic viewdistance settings, only disable it if you are using your own viewdistance mods";
        variable = "para_enableDynamicViewDist";
        type = "Checkbox";
        default = 1;
    };
    class para_maxViewDist {
		name = "Max Viewdistance"; // Display Name
		variable = "para_maxViewdist"; // Variable name for saving in PFS
		tooltip = "Max Viewdistance"; // Tooltip
		type = "Slider";
		default = 1000;
		range[] =  { 100, 12000 };
		step = 100;
	};
    class para_maxObjectViewDist {
		name = "Max Object Viewdistance";
		variable = "para_maxObjectViewdist";
		tooltip = "Max Object Viewdistance";
		type = "Slider";
		default = 800;
		range[] =  { 100, 12000 };
		step = 100;
	};
    class para_minFpsViewDist {
        name = "Min FPS viewdistance autoscaler";
		variable = "para_minFpsViewDist";
		tooltip = "Min FPS you must reach to keep your current viewdistance value";
		type = "Slider";
		default = 20;
		range[] =  { 0, 240 };
		step = 10;
	};
//     class Test: para_OptionCheckbox {
//         name = "Test option 1";
//         tooltip = "This is the test option 1";
//         variable = "para_test1";
//     };
//     class Test2: para_OptionSlider {
//         name = "Test option 2";
//         tooltip = "This is the test option 2";
//         variable = "para_test2";
//     };
//     class Test3: para_OptionCombobox {
//         name = "Test option 3";
//         tooltip = "This is the test option 3";
//         variable = "para_test3";
//     };
};