require_relative './constants.rb'
require_relative './assertor.rb'

module AutomationHelper::Core
    
    include AutomationHelper::Assertor
    
    def combinate_view_class_mark(view_class, view_mark_id)
        
        view = escape_quotes(view_class) unless view_class.nil?
        mark = escape_quotes(view_mark_id) unless view_mark_id.nil?
        
        query_array = Array.new
        
        view_query = view_class.nil? ? "view" : "view:'#{view}'"
        
        if view_mark_id.nil?
            
            query_array.push view_query
            
        else
            
            mark_query = "#{view_query} marked:'#{mark}'"
            query_array.push mark_query

            id_query = "#{view_query} id:'#{mark}'"
            query_array.push id_query 

            text_query = "#{view_query} text:'#{mark}'"
            query_array.push text_query
            
        end
        
        return query_array
        
    end
    
    def query_view_with_parent_descendant_parameters(parent_class, parent_mark_id, descendant_class, descendant_mark_id, is_descendant_keyword)
    
        
        parent_view_query_array = combinate_view_class_mark parent_class, parent_mark_id
        descendant_view_query_array = combinate_view_class_mark descendant_class, descendant_mark_id
        
        parent_view_query_array.each do |parent_view_query|
            
            
            if descendant_class.nil? and descendant_mark_id.nil?
                
                return parent_view_query if element_exists parent_view_query
            
            else
                
                descendant_view_query_array.each do |descendant_view_query|
            
                    view_query = nil
                    
                    if is_descendant_keyword
                        view_query = "#{parent_view_query} descendant #{descendant_view_query}"
                    else
                        view_query = "#{descendant_view_query} parent #{parent_view_query}"
                    end
                    
                    return view_query if element_exists view_query
            
                end
                
            end
                        
        end
        
        return nil
        
    end
    
    def query_view_with_classes(views)

  		views.each do |view_class|

            view_query = query_view_with_parent_descendant_parameters view_class, nil, nil, nil, true
            return view_query unless  view_query.nil?
            
  		end

  		return nil

  	end
    
  	def query_view_with_classes_mark(views, mark_id)
  		
        views.each do |view_class|

            view_query = query_view_with_parent_descendant_parameters view_class, mark_id, nil, nil, true
            return view_query unless  view_query.nil?
            
  		end

  		return nil

  	end
    
    def query_subviews_with_parent_classes_descendant_mark(parent_views, descendant_mark_id)

  		parent_views.each do |parent_view_class|
        	
            view_query = query_view_with_parent_descendant_parameters parent_view_class, nil, nil, descendant_mark_id, true
            return view_query unless  view_query.nil?
            
  		end

  		return nil

  	end
    
    def query_subviews_with_descendant_mark_parent_classes(descendant_mark_id, parent_views)

  		parent_views.each do |parent_view_class|
        	
            view_query = query_view_with_parent_descendant_parameters parent_view_class, nil, nil, descendant_mark_id, false
            return view_query unless  view_query.nil?
            
  		end

  		return nil

  	end
    
    def query_subviews_with_parent_classes_descendant_classes_mark(parent_views, descendant_views, descendant_mark_id)

        parent_views.each do |parent_view_class|

            descendant_views.each do |descendant_view_class|
            
             view_query = query_view_with_parent_descendant_parameters parent_view_class, nil, descendant_view_class, descendant_mark_id, true
            return view_query unless  view_query.nil?
                
            end
        	
            
  		end

  		return nil

  	end
    
    def query_subviews_with_descendant_classes_mark_parent_classes(descendant_views, descendant_mark_id, parent_views)

        parent_views.each do |parent_view_class|

            descendant_views.each do |descendant_view_class|
            
             view_query = query_view_with_parent_descendant_parameters parent_view_class, nil, descendant_view_class, descendant_mark_id, false
            return view_query unless  view_query.nil?
                
            end
        	
            
  		end

  		return nil

  	end
    
    def query_subviews_with_parent_classes_mark_descendant_classes_mark(parent_views, parent_mark_id,  descendant_views, descendant_mark_id)

        parent_views.each do |parent_view_class|

            descendant_views.each do |descendant_view_class|
            
               view_query = query_view_with_parent_descendant_parameters parent_view_class, parent_mark_id, descendant_view_class, descendant_mark_id, true
            return view_query unless  view_query.nil?
                
            end
        	
            
  		end

  		return nil

  	end
    
    def query_subviews_with_descendant_classes_mark_parent_classes_mark(descendant_views, descendant_mark_id, parent_views, parent_mark_id)

        parent_views.each do |parent_view_class|

            descendant_views.each do |descendant_view_class|
            
               view_query = query_view_with_parent_descendant_parameters parent_view_class, parent_mark_id, descendant_view_class, descendant_mark_id, false
            return view_query unless  view_query.nil?
                
            end
        	
            
  		end

  		return nil

  	end
    
end

