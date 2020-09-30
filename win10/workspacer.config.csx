#r "C:\Program Files\workspacer\workspacer.Shared.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.Bar\workspacer.Bar.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.ActionMenu\workspacer.ActionMenu.dll"
#r "C:\Program Files\workspacer\plugins\workspacer.FocusIndicator\workspacer.FocusIndicator.dll"

using System;
using workspacer;
using workspacer.Bar;
using workspacer.ActionMenu;
using workspacer.FocusIndicator;

Action<IConfigContext> doConfig = (context) =>
{
    context.AddBar(new BarPluginConfig(){
    BarTitle = "workspacer.Bar",
    BarHeight = 16,
    FontSize = 8,
    FontName = "Consolas",
    // DefaultWidgetForeground = Color.Blue,
    // DefaultWidgetBackground = Color.White,
    Background = Color.Black,
});

    context.AddFocusIndicator(new FocusIndicatorPluginConfig(){
        // BorderColor = Color.Lime,
        BorderSize = 2,
        TimeToShow = 99999999,
    });

    var actionMenu = context.AddActionMenu();
     
    context.Keybinds.Subscribe(
        KeyModifiers.Alt | KeyModifiers.Shift,
        Keys.Enter,
        () => System.Diagnostics.Process.Start(@"Cmder.exe")
    );

    context.WorkspaceContainer.CreateWorkspaces("1", "2", "3", "4", "5");
};
return doConfig;