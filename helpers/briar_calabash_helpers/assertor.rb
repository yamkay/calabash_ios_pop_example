require 'calabash-cucumber/calabash_steps'
require 'calabash-cucumber/operations'
require 'calabash-cucumber/failure_helpers'
require 'calabash-cucumber/environment_helpers'
require 'calabash-cucumber/uia'

module AutomationHelper
  
    module Assertor
        
    include Calabash::Cucumber::Operations
    include Calabash::Cucumber::FailureHelpers
    include Calabash::Cucumber::EnvironmentHelpers
    include Calabash::Cucumber::UIA
    include Calabash::Cucumber::StatusBarHelpers  
      
        def embed(x,y=nil,z=nil)
            
            if @should_embed_screenshot_on_error
                super
            end
            
        end
        
        def raise_error(error_message)
          
          error = "ERROR: #{error_message}"
          
          if @should_embed_screenshot_on_error
              screenshot_and_raise error
          else
              raise error
          end
          
      end
        
      def raise_warning(warning_message)
          
          error = "WARNING: #{warning_message}"
          raise error
      
      end
            
      def assert_should_see_view_failure(view, mark, is_view_present)
         
          if !is_view_present
              
              error_message = "The #{view} '#{mark}' is not available"
              raise_error error_message
              
          end
          
          
      end
      
      def assert_should_not_see_view_failure(view, mark, is_view_present)
         
          if is_view_present
              
              error_message = "The #{view} '#{mark}' is available"
              raise_error error_message
              
          end 
          
      end
        
        def assert_should_view_be_selected_failure(view, mark, is_view_selected)
         
          if !is_view_selected
              
              error_message = "The #{view} '#{mark}' is not selected"
              raise_error error_message
              
          end
          
          
      end
      
      def assert_should_view_not_be_selected_failure(view, mark, is_view_selected)
         
          if is_view_selected
              
              error_message = "The #{view} '#{mark}' is selected"
              raise_error error_message
              
          end 
          
      end
        
        
        def assert_should_view_be_enabled_failure(view, mark, is_view_enabled)
         
          if !is_view_enabled
              
              error_message = "The #{view} '#{mark}' is disabled"
              raise_error error_message
              
          end
          
          
      end
      
        def assert_should_view_be_disabled_failure(view, mark, is_view_enabled)
         
          if is_view_enabled
              
              error_message = "The #{view} '#{mark}' is enabled"
              raise_error error_message
              
          end 
          
      end
      
      def assert_interaction_failure(failure_message)
    
          error_message = "INTERACTION FAILURE - #{failure_message}"
          raise_error error_message
    
      end
      
      def assert_functionality_failure(failure_message)
    
          error_message = "FUNCTIONALITY FAILURE - #{failure_message}"
          raise_error error_message
    
      end
        
      def assert_navigation_failure(failure_message)
    
          error_message = "NAVIGATION FAILURE - #{failure_message}"
          raise_error error_message
    
      end
        
      def assert_navigation_warning(failure_message)
    
          error_message = "NAVIGATION WARNING - #{failure_message}"
          raise_error error_message
    
      end
      
  end
    
end

