#define W_DISPLAY 10
#define H_DISPLAY 15
#define X_DISPLAY UIX_CL(0.5 * W_DISPLAY)
#define Y_DISPLAY UIY_CU(0.5 * H_DISPLAY)
class para_RscDisplayToggleZone
{
	idd = VN_MF_IDD_RSCDISPLAYTOGGLEZONE;
	PARA_INIT_DISPLAY(para_RscDisplayToggleZone)
	class ControlsBackground
	{
		class Title: para_RscText
		{
			text = "Toggle Zones"; // TODO: Localize
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
			x = X_DISPLAY - UIW(0.1);
			y = Y_DISPLAY - UIH(1.2);
			w = UIW(W_DISPLAY + 0.2);
			h = UIH(1);
		};
		class Background: para_RscText
		{
			colorBackground[] = {0,0,0,0.8};
			x = X_DISPLAY - UIW(0.1);
			y = Y_DISPLAY - UIH(0.1);
			w = UIW(W_DISPLAY + 0.2);
			h = UIH(H_DISPLAY + 0.2);
		};
	};
	class Controls
	{
		class Zones: para_RscListbox
		{
			idc = PARA_RSCDISPLAYTOGGLEZONE_ZONES_IDC;
			x = X_DISPLAY;
			y = Y_DISPLAY;
			w = UIW(W_DISPLAY);
			h = UIH(H_DISPLAY - 3.3);
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
		};
		class Toggle: para_RscButtonMenu
		{
			idc = PARA_RSCDISPLAYTOGGLEZONE_TOGGLE_IDC;
			text = "Activate Zone"; // TODO: Localize
			x = X_DISPLAY;
			y = Y_DISPLAY + UIH(H_DISPLAY - 3.2);
			w = UIW(W_DISPLAY);
			h = UIH(1);
		};
		class Complete: Toggle
		{
			idc = PARA_RSCDISPLAYTOGGLEZONE_COMPLETE_IDC;
			text = "Complete Zone"; // TODO: Localize
			y = Y_DISPLAY + UIH(H_DISPLAY - 2.1);
		};
		class Close: Toggle
		{
			text = "Close"; // TODO: Localize
			idc = 2;
			x = X_DISPLAY + UIW(W_DISPLAY - 10);
			y = Y_DISPLAY + UIH(H_DISPLAY - 1);
			w = UIW(10);
			h = UIH(1);
		};
	};
};
