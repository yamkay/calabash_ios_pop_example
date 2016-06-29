require_relative './core.rb'

LABEL_CLASSES ||= [ELEMENT_UILABEL, ELEMENT_UILABEL, ELEMENT_UINAVIGATIONBAR, ELEMENT_UIBORDEREDLABEL, ELEMENT_UISWATCH_LABEL, ELEMENT_UISEARCHBARTEXTFIELDLABEL,ELEMENT_UITEXTFIELDLABEL,ELEMENT_UIACTIVITYGROUPACTIVITYTITLELABEL, ELEMENT_UITABLEVIEWLABEL, ELEMENT_UITHEMABALELABEL,ELEMENT_UITABLEVIEWHEADERFOOTERVIEWLABEL]

module AutomationHelper::Label

    include AutomationHelper::Core

    def query_label(label_name)

      return query_view_with_classes_mark LABEL_CLASSES, label_name

    end


    def label_exists?(label_name)

        label_query = query_label label_name
        return !label_query.nil?

    end


    def should_see_label(label_name)

        is_label_present = label_exists? label_name
        assert_should_see_view_failure "label", label_name, is_label_present

    end

    
    def should_not_see_label(label_name)

        is_label_present = label_exists? label_name
        assert_should_not_see_view_failure "label", label_name, is_label_present

    end

    def scroll_to_label(label_name)
        scroll_to_mark label_name
    end
    
    def click_label(label_name)

     should_see_label label_name
     label_query = query_label label_name
     touch label_query

    end

    def click_label_if_exists(label_name)

      if label_exists? label_name
         label_query = query_label label_name
        touch label_query
      end
      
    end
    
    def label_enabled?(label_name)
        should_see_label label_name
        label_query = query_label label_name
        
        if (query(label_query,:isEnabled)[0] == 1)
            return true
        end
        
        return false
    end
    
    
    def should_label_be_enabled(label_name)
        
        is_label_enabled = label_enabled? label_name
        assert_should_view_be_enabled_failure "label", label_name, is_label_enabled
        
    end
    
    def should_label_be_disabled(label_name)
        
        is_label_enabled = label_enabled? label_name
        assert_should_view_be_disabled_failure "label", label_name, is_label_enabled
        
    end
    


end

