require_relative './core.rb'

module AutomationHelper::Keyboard

    include AutomationHelper::Core
  	
  	def keyboard_visible?

        is_keyboard_visible = super
        is_keyboard_dismiss_button = element_exists "view marked:'#{ELEMENT_KEYBOARD_ICON_LABEL}'"
    	is_keyboard_key_view = element_exists "view:'#{ELEMENT_UIKBKEYVIEW}'"
    	is_keyboard_key_plane_view = element_exists "view:'#{ELEMENT_UIKBKEYPLANEVIEW}'"

    	return (is_keyboard_visible or is_keyboard_dismiss_button or is_keyboard_key_view or is_keyboard_key_plane_view)

  	end


  	def should_see_keyboard

        assert_should_see_view_failure "keyboard", "", keyboard_visible?

  	end

  	
  	def should_not_see_keyboard

  		assert_should_not_see_view_failure "keyboard", "", keyboard_visible?

  	end

  	
  	def type_keyboard(text)

      await_keyboard_to_appear
      should_see_keyboard
      keyboard_enter_text(text) if (text != COMMON_SCREENS_TEXT_NOT_APPLICABLE) and !(text.nil?)

  	end


  	def return_keyboard

      should_see_keyboard
      tap_keyboard_action_key
      await_keyboard_to_disappear
      should_not_see_keyboard

  	end


  	def dismiss_keyboard
        
        wait_for_none_animating
      should_see_keyboard
      click_button ELEMENT_KEYBOARD_ICON_LABEL if iphone?
      click_image_view ELEMENT_IPAD_KEYBOARD_ICON_LABEL if ipad?
      await_keyboard_to_disappear
      should_not_see_keyboard

  	end


  	def wait_for_keyboard_to_present(should_present)

      $i=0
      while $i < TIMEOUT  do
        sleep 1
        if keyboard_visible? == should_present
            break
        end
        if $i == TIMEOUT
            error_keyboard_appear = "Waiting for keyboard to appear: Expired."
            error_keyboard_disappear = "Waiting for keyboard to disappear: Expired."

            error_message = should_present ? error_keyboard_appear : error_keyboard_disappear
            raise_error error_message if !keyboard_visible?
        end
        $i +=1
      end

  	end


  	def await_keyboard_to_appear

      wait_for_keyboard_to_present true

  	end


  	def await_keyboard_to_disappear

      wait_for_keyboard_to_present false

  	end

  	def check_keyboard_type_matches(keyboard_type)

      should_see_keyboard
      #TO_DO : Check the Keyboard type - NO SOLUTION AS OF NOW

  	end

end

