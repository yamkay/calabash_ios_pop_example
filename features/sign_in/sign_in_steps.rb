def sign_out_user_via_account_options(confirmation = true)
    
    HomeTabBarScreen.select_tab_account
    AccountOptionsScreen.sign_out_user confirmation
    AUTOMATION_DRIVER.am_i_in_screen AccountOptionsScreen

end

def sign_out_user_normal_via_account_options(confirmation = true)

    set_scenario "sign_out_user" 
    sign_out_user_via_account_options confirmation
    
end

def navigate_to_sign_in_screen_via_account_options
    
    HomeTabBarScreen.select_tab_account
    AccountOptionsScreen.select_table_cell_sign_in
    AUTOMATION_DRIVER.assert_screen_navigation AccountOptionsScreen, SignInScreen
    
end

def sign_in_user_via_account_options(email, password, remember_my_mail = true, keep_me_signed_in = true)

    navigate_to_sign_in_screen_via_account_options
    sign_in_user email, password, remember_my_mail, keep_me_signed_in
    AUTOMATION_DRIVER.assert_screen_navigation SignInScreen, AccountOptionsScreen

end

def sign_in_user(email, password, remember_my_mail = true, keep_me_signed_in = true)

    AUTOMATION_DRIVER.am_i_in_screen SignInScreen
    SignInScreen.sign_in_user email, password, remember_my_mail, keep_me_signed_in

end

def sign_in_user_normal_via_account_options

    set_scenario "sign_in_user"
    sign_in_user_via_account_options "info@info.com", "info123"

end

Given(/^I sign-in afresh with valid credentials via App Settings options$/) do

    sign_out_user_normal_via_account_options
    AUTOMATION_DRIVER.wait_for_none_animating
    sign_in_user_normal_via_account_options

end

