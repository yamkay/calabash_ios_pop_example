
Before ('@sign_in_feature') do
    
    $scenario_set_before_feature_hooks = SERVER_SCENARIO_APP_LAUNCH_DEFAULT

end

Before do
    
    set_scenario $scenario_set_before_feature_hooks    
end

After do |scenario|
    
    set_scenario $scenario_set_before_feature_hooks
    #Setting to default scenario
    $scenario_set_before_feature_hooks = SERVER_SCENARIO_APP_LAUNCH_DEFAULT
    
end