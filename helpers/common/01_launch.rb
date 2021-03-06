########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   the  methods invoked by            #
#   CalabashLauncher are overriden.    #
#   It will automatically ensure       #
#   running on device, installing apps #
#   etc.                               #
#                                      #
########################################

require 'calabash-cucumber/launcher'

DEVICE_IP = ENV['device_ip']
SCENARIO_SERVER_IP = ENV['scenario_server_ip']

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new

  if scenario.source_tag_names.include?('@reset')
      @calabash_launcher.reset_app_jail
  end
  
  unless @calabash_launcher.calabash_no_launch?
    launch_options = {:uia_strategy => :preferences }
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end
  
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  if launcher.simulator_target?
    launcher.simulator_launcher.stop unless launcher.calabash_no_stop?
  end
end
