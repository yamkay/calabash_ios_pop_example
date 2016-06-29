require_relative "../../base_screen/base_screen.rb"

USER_SIGN_IN_SCREEN_FIELD_EMAIL              ||= "Email"
USER_SIGN_IN_SCREEN_FIELD_PASSWORD           ||= "Password"
USER_SIGN_IN_SCREEN_LINK_NEW_USER            ||= "New User?"
USER_SIGN_IN_SCREEN_LINK_FORGOT_PASSWORD     ||= "Forgot password?"
USER_SIGN_IN_SCREEN_BUTTON_SIGN_IN           ||= "Sign In"
USER_SIGN_IN_SCREEN_BUTTON_CANCEL            ||= "Cancel"
USER_SIGN_IN_SCREEN_LABEL_NAVGATION_BAR_LOGO ||= "logo"

class SignInScreen < HomeTabBarScreen


     def self.critical_elements
        
        critical_elelements_array = super
        critical_elelements_array.add_button USER_SIGN_IN_SCREEN_BUTTON_SIGN_IN
        critical_elelements_array.add_label USER_SIGN_IN_SCREEN_LINK_NEW_USER
        critical_elelements_array.add_label USER_SIGN_IN_SCREEN_LINK_FORGOT_PASSWORD
        critical_elelements_array.add_image USER_SIGN_IN_SCREEN_LABEL_NAVGATION_BAR_LOGO
        critical_elelements_array.add_button USER_SIGN_IN_SCREEN_BUTTON_CANCEL
        return critical_elelements_array

    end
    
    def self.click_link_sign_up_for_new_users
        
        AUTOMATION_DRIVER.click_label USER_SIGN_IN_SCREEN_LINK_NEW_USER

    end
    
    def self.click_link_forgot_password

        AUTOMATION_DRIVER.click_label USER_SIGN_IN_SCREEN_LINK_FORGOT_PASSWORD
        
    end
    
    def self.click_link_your_privacy_rights

        AUTOMATION_DRIVER.click_label COMMON_SCREENS_LABEL_YOUR_PRIVACY_RIGHTS
        
    end
    
    def self.click_link_terms_and_conditions
    
        AUTOMATION_DRIVER.click_label COMMON_SCREENS_LABEL_TERMS_AND_CONDITIONS

    end
    
    def self.click_link_return_policy

        AUTOMATION_DRIVER.click_label COMMON_SCREENS_LABEL_RETURN_POLICY
        
    end
    
    def self.enter_textfield_email (email, should_dismiss_keypad = true, should_return = false)

        AUTOMATION_DRIVER.should_see_label USER_SIGN_IN_SCREEN_LINK_NEW_USER
        AUTOMATION_DRIVER.should_see_textfield USER_SIGN_IN_SCREEN_FIELD_EMAIL
        AUTOMATION_DRIVER.type_textfield_text email, USER_SIGN_IN_SCREEN_FIELD_EMAIL, should_dismiss_keypad, should_return

    end
    
    def self.enter_textfield_password (password, should_dismiss_keypad = true, should_return = false)
 
        AUTOMATION_DRIVER.should_see_textfield USER_SIGN_IN_SCREEN_FIELD_PASSWORD
        AUTOMATION_DRIVER.type_textfield_text password, USER_SIGN_IN_SCREEN_FIELD_PASSWORD, should_dismiss_keypad, should_return, false

    end
    
    def self.click_button_sign_in
        
        AUTOMATION_DRIVER.click_button USER_SIGN_IN_SCREEN_BUTTON_SIGN_IN
        AUTOMATION_DRIVER.wait_for_none_animating

    end
    
    def self.click_button_cancel
        
        AUTOMATION_DRIVER.click_button USER_SIGN_IN_SCREEN_BUTTON_CANCEL

    end

    # Functionality Helpers

    def self.sign_in_user (email, password, remember_me = true, touchid = false)

        enter_textfield_email email
        enter_textfield_password password
        click_button_sign_in

    end

end