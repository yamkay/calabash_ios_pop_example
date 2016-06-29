require_relative './keyboard.rb'
require_relative './picker_view.rb'

module AutomationHelper::TextField 

    include AutomationHelper::Keyboard
    include AutomationHelper::PickerView
    
  	def query_textfield(textfield_name)

      textfield_classes ||= [ELEMENT_UITEXTFIELD, ELEMENT_UITEXTFIELD, ELEMENT_UITEXTVIEW, ELEMENT_UISEARCHBARTEXTFIELD, ELEMENT_UISEARCHBARTEXTFIELDLABEL,ELEMENT_UITEXTFIELDLABEL,ELEMENT_UICFTEXTFIELD]
      textfield_query = query_view_with_classes_mark textfield_classes, textfield_name
      return textfield_query

  	end


  	def textfield_exists?(textfield_name)

  		textfield_query = query_textfield textfield_name
  		return !textfield_query.nil?

  	end


  	def should_see_textfield(textfield_name)

  		is_textfield_present = textfield_exists? textfield_name
        assert_should_see_view_failure "textfield", textfield_name, is_textfield_present

  	end

  	
  	def should_not_see_textfield(textfield_name)

  		is_textfield_present = textfield_exists? textfield_name
        assert_should_not_see_view_failure "textfield", textfield_name, is_textfield_present

  	end

  	
  	def scroll_to_textfield(textfield_name)



  	end


  	def touch_textfield(textfield_name)

  		should_see_textfield textfield_name
  		textfield_query = query_textfield textfield_name
  		touch textfield_query

  	end


  	def type_textfield_text(text, textfield_name, should_dismiss_keypad = true, should_return = false, should_clear_textfield = true)

  		if text != COMMON_SCREENS_TEXT_NOT_APPLICABLE

        	touch_textfield textfield_name
        	clear_textfield textfield_name if should_clear_textfield
        	type_keyboard text

            if should_dismiss_keypad or should_return
        
                if should_dismiss_keypad
                    dismiss_keyboard
                elsif should_return
                    return_keyboard
                end

                populated_text = get_textfield_text textfield_name

                error_message = "Text '#{text}' is not populated in Textfield '#{textfield_name}'. Current Text: '#{populated_text}'."
                assert_interaction_failure error_message if populated_text != text

            end
        end

  	end
    
    # Focus the textfield with the input name and type the input text in the same textfield
    def pick_textfield_text (text, index, textfield_name, should_dismiss_picker = true, should_clear_textfield = true)

        if text != COMMON_SCREENS_TEXT_NOT_APPLICABLE

            touch_textfield textfield_name
            clear_textfield textfield_name if should_clear_textfield

            select_picker_view_cell text, index
            
            if should_dismiss_picker
        
                dismiss_picker_view
                populated_text = get_textfield_text textfield_name

                error_message = "The text '#{text}' is not picked in the field '#{textfield_name}'. Current text in the field:'#{populated_text}'"
                assert_interaction_failure error_message if populated_text != text
              

            end

        end

    end

  	def get_textfield_text(textfield_name)

      should_see_textfield textfield_name
      textfield_query = query_textfield textfield_name
      text_in_textfield = query(textfield_query, :text)[0]
      return text_in_textfield
    
  	end

  	def is_textfield_empty(textfield_name)

      textfield_text = get_textfield_text textfield_name
      return (textfield_text == "")

  	end

    # Customized erase of text from textfield where we can specify the number of backspaces
    def delete_textfield_desired_characters (number_of_backspaces, textfield_name)
    
    touch_textfield textfield_name
    number_of_backspaces = number_of_backspaces.to_i

      while number_of_backspaces > 0
          keyboard_enter_char "Delete"
          number_of_backspaces = number_of_backspaces-1;
      end
    
    end

  	def clear_textfield(textfield_name)

      if !is_textfield_empty(textfield_name)

        touch_textfield textfield_name
        if !is_textfield_empty(textfield_name)
            textfield_query = query_textfield textfield_name
            clear_text textfield_query
        end

      end


      # If not cleared till last, then raise error.
      #TODO:must_raise_error if !is_textfield_empty(textfield_name)
      error_message = "Textfield '#{textfield_name}' is not cleared."
      raise error_message if !is_textfield_empty(textfield_name) 

  	end    

end

