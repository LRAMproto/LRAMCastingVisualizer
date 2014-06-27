function program_handles = connect_vis_display(ph)
% Connects the visualizer display to the main program.
   ph.PluginTests(2) = VisualizerPlugin('Control Panel',ph.core);
   set(ph.PluginTests(2),'debug_mode',0);
   set(ph.PluginTests(2),'gui_fcn',@vis_control);
   ph.PluginTests(2).AddToPlugins();    
   ph.PluginTests(2).LoadGui();   
   notify(ph.core,'UpdateEvent');
   program_handles = ph;
end
