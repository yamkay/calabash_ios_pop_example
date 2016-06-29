require_relative './core.rb'
require_relative './text_field.rb'
require_relative './label.rb'
require_relative './CriticalElementsArray.rb'
require_relative './text_view.rb'

class AutomationDriver

	include AutomationHelper::Core
    
	include AutomationHelper::TextField
	include AutomationHelper::Label    
    include AutomationHelper::Action::Touch
    include AutomationHelper::Action::Scroll
    include AutomationHelper::Action::Swipe

    
    def initialize
        
        @current_screen = ""
        @should_embed_screenshot_on_error = true
        
    end
    
    def append_screen_scenario_details(error_message)
          
        error = "CURRENT SCREEN: '" + @current_screen + "' | #{error_message}"
        return error
      
    end
    
    
    def raise_error(error_message)
          
        error = append_screen_scenario_details error_message
        super error
      
    end
    
        
    def raise_warning(warning_message)
          
       error = append_screen_scenario_details warning_message
       super error
      
    end
    
    def validate_critical_elements(screen_class, should_see, should_raise_error)
        
        error_message = ""
        @should_embed_screenshot_on_error = false
        
        screen_critical_elements_array = screen_class.critical_elements
        
        screen_critical_elements_array.critical_elements_array.each do |critical_element|
            
            begin
                                
                if critical_element.is_label?
                
                    if should_see
                        should_see_label critical_element.view_name
                    else
                        should_not_see_label critical_element.view_name
                    end
            
                elsif critical_element.is_textfield?
                
                    if should_see
                        should_see_textfield critical_element.view_name
                    else
                        should_not_see_textfield critical_element.view_name
                    end
                
                elsif critical_element.is_switch?
                
                    if should_see
                        should_see_switch critical_element.view_name
                    else
                        should_not_see_switch critical_element.view_name
                    end
                
                elsif critical_element.is_button?
                
                    if should_see                        
                        scroll_to_button critical_element.view_name
                        should_see_button critical_element.view_name
                    else
                        should_not_see_button critical_element.view_name
                    end
            
                elsif critical_element.is_table_cell?
                
                    if should_see
                        should_see_table_cell critical_element.view_name
                    else
                        should_not_see_table_cell critical_element.view_name
                    end
                    
            
                elsif critical_element.is_segment?
                
                    if should_see
                        should_see_segment critical_element.view_name
                    else
                        should_not_see_segment critical_element.view_name
                    end
                    
                elsif critical_element.is_image?
                
                    if should_see
                        should_see_image_view critical_element.view_name
                    else
                        should_not_see_image_view critical_element.view_name
                    end
            
                end
                            
            rescue Exception => exception_object
                
                error_message = error_message + "\n" + exception_object.message
            
            end
        
        end
        
        @should_embed_screenshot_on_error = true
        
        if error_message.eql? ""
            
            @current_screen = should_see ? screen_class.name : ""
            return nil
            
        else
            
            if should_raise_error 
            
                screen_name = screen_class.name
                function_name = should_see ? "am_i_here" : "am_i_not_here"
                critical_elements_error = "The functionality '#{function_name}' failed in the screen '#{screen_name}'\n#{error_message}"
                assert_functionality_failure critical_elements_error
        
            else
            
                return error_message
            
            end            
        end        
    end
    
    
    def am_i_in_screen(screen_class, should_raise_error = true)
        
        return validate_critical_elements screen_class, true, should_raise_error
        
    end
    
    
    def am_i_not_in_screen(screen_class, should_raise_error = true)
        
        return nil
        #return validate_critical_elements screen_class, false, should_raise_error
        
    end
    
        
    def assert_screen_navigation(from_screen, to_screen, should_wait = true)
    
        wait_for_none_animating if should_wait
        
        @current_screen = ""
        
        from_screen_name = from_screen.name
        to_screen_name = to_screen.name
        
        failure_in_from_screen = am_i_not_in_screen from_screen, false
        failure_in_to_screen = am_i_in_screen to_screen, false
        
          
        if failure_in_from_screen.nil? && !failure_in_to_screen.nil?
              
              
          
        elsif !failure_in_from_screen.nil? && failure_in_to_screen.nil?
              
            failure_message = "The app has successfully navigated from '#{from_screen_name}' to '#{to_screen_name}', but the below critical elements of the previous screen '#{from_screen_name}' are still seen on the screen.\n#{failure_in_from_screen}"
            assert_navigation_warning failure_message
              
        elsif !failure_in_from_screen.nil? && !failure_in_to_screen.nil?
              
            failure_message = "The app has not navigated from '#{from_screen_name}' to '#{to_screen_name}'."
            assert_navigation_failure failure_message
              
        else
              
            @current_screen = to_screen_name
              
        end     
    
    end
    #BackGrounding and Fore Grounding event validation is handled by the Calabash API
    def background_app(seconds) 
        
        send_app_to_background seconds        
        
    end

end

AUTOMATION_DRIVER ||= AutomationDriver.new

