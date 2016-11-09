module dwinbar.widgets.widget;

import dwinbar.backend.panel;

import cairo.cairo;

enum barMargin = 4;
enum rhsPadding = 4;
enum rhsOffset = 16;
enum appMargin = 20;
enum appIconSize = 32;

enum trayIconSize = 24;
enum trayVerticalMargin = 8;
enum trayHorizontalMargin = 4;

interface Widget
{
	double length() @property;
	int priority() @property;
	bool hasHover() @property;
	void click(Panel panel, double len, int panelX, int panelY);
	void draw(Panel panel, Context context, double start);
	void updateLazy();
}
