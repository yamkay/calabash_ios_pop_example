AUTOMATION_CRITICAL_ELEMENT_LABEL ||= "automation_element_label"
AUTOMATION_CRITICAL_ELEMENT_TEXTFIELD ||= "automation_element_textfield"
AUTOMATION_CRITICAL_ELEMENT_SWITCH ||= "automation_element_switch"
AUTOMATION_CRITICAL_ELEMENT_SEGMENT ||= "automation_element_segment"
AUTOMATION_CRITICAL_ELEMENT_BUTTON ||= "automation_element_button"
AUTOMATION_CRITICAL_ELEMENT_TABLE_CELL ||= "automation_element_table_cell"
AUTOMATION_CRITICAL_ELEMENT_IMAGE ||= "automation_element_image"

class CriticalElement
    
    attr_accessor :view_identifier
    attr_accessor :view_name
    
    def initialize(view_identifier, view_name)
        
        @view_identifier = view_identifier
        @view_name = view_name
        
    end
    
    def self.object_for_view(view_identifier, view_name)
        
        return CriticalElement.new(view_identifier, view_name)
    
    end
    
    #Label
    
    def self.object_for_label(label_name)
        
        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_LABEL, label_name)
    
    end
    
    def is_label?
        
        is_label_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_LABEL
        return is_label_element
    
    end
    
    #Textfield
    
    def self.object_for_textfield(textfield_name)
        
        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_TEXTFIELD, textfield_name)
    
    end
    
    def is_textfield?
        
        is_textfield_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_TEXTFIELD
        return is_textfield_element
    
    end

    #Switch
    
    def self.object_for_switch(switch_name)
        
        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_SWITCH, switch_name)
    
    end
    
    def is_switch?
        
        is_switch_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_SWITCH
        return is_switch_element
    
    end
    
    #Button
    
    def self.object_for_button(button_name)
        
        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_BUTTON, button_name)
    
    end
    
    def is_button?
        
        is_button_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_BUTTON
        return is_button_element
    
    end
    
    #Table Cell
    
    def self.object_for_table_cell(table_cell_name)
        
        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_TABLE_CELL, table_cell_name)
    
    end
    
    def is_table_cell?
        
        is_table_cell_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_TABLE_CELL
        return is_table_cell_element
    
    end
    
    #Segment
    
    def self.object_for_segment(segment_name)
        
        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_SEGMENT, segment_name)
    
    end
    
    def is_segment?
        
        is_segment_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_SEGMENT
        return is_segment_element
    
    end

    #Image

    def self.object_for_image(image_name)

        return object_for_view(AUTOMATION_CRITICAL_ELEMENT_IMAGE, image_name)

    end

    def is_image?
    
        is_image_element = @view_identifier.eql? AUTOMATION_CRITICAL_ELEMENT_IMAGE
        return is_image_element
    
    end

end