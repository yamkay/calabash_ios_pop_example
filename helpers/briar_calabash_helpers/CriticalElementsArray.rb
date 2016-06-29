class CriticalElementsArray
    
    attr_accessor :critical_elements_array
    
    def initialize
        
        @critical_elements_array = Array.new
        
    end
    
    def add_label(label_name)
    
        label_object = CriticalElement.object_for_label label_name
        @critical_elements_array.push label_object
    
    end
    
    def add_button(button_name)
    
        button_object = CriticalElement.object_for_button button_name
        @critical_elements_array.push button_object
    
    end
    
    
    def add_switch(switch_name)
    
        switch_object = CriticalElement.object_for_switch switch_name
        @critical_elements_array.push switch_object
    
    end
    
    def add_table_cell(table_cell_name)
    
        table_cell_object = CriticalElement.object_for_table_cell table_cell_name
        @critical_elements_array.push table_cell_object
    
    end
    
    def add_textfield(textfield_name)
    
        textfield_object = CriticalElement.object_for_textfield textfield_name
        @critical_elements_array.push textfield_object
    
    end
    
    def add_segment(segment_name)
    
        segment_object = CriticalElement.object_for_segment segment_name
        @critical_elements_array.push segment_object
    
    end
    
    def add_image(image_name)
        
        image_object = CriticalElement.object_for_image image_name
        @critical_elements_array.push image_object
        
    end
    
end

