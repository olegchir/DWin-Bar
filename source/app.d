import dwinbar.backend.xbackend;
import dwinbar.backend.panel;

import dwinbar.widgets.clock;
import dwinbar.widgets.tray;
import dwinbar.widgets.workspace;

import dwinbar.panels;

import std.file;
import std.path;

void main(string[] args)
{
	chdir(thisExePath.dirName);

	XBackend backend = new XBackend();
	Panels panels = new Panels(backend);

	string fontPrimary = "Roboto Medium";
	string fontSecondary = "Roboto Light";

	auto commonInfo = PanelInfo(Screen.First, int.min, int.min, 0, 40, Side.Bottom);

	panels.addGlobalWidget(new WorkspaceWidget(backend, fontPrimary, fontSecondary, commonInfo));
	panels.addGlobalWidget(new ClockWidget(fontPrimary, fontSecondary, commonInfo));

	commonInfo.screen = Screen.First; // 0
	auto panel1 = panels.addPanel(commonInfo);
	panels.taskBar = panel1;
	panel1.addWidget(new TrayWidget(fontPrimary, fontSecondary, commonInfo));
	//commonInfo.screen = Screen.Second; // 1
	//panels.addPanel(commonInfo);

	panels.start();
}
