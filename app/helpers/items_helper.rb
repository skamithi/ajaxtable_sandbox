
module ItemsHelper

    def sort_and_link_helper
      html_c = ''
      %w(name qty price).each do |header|
        html_c << content_tag(:td , sort_link_helper(header), :class => sort_td_class_helper(header))
      end
      html_c
    end

    def sort_td_class_helper(sort_type)
      classname = (params[:sort] == sort_type)? "sortup" : "sortdown"
    end

    def sort_link_helper(param)
      key = (params[:sort] == param)? param : param + '_reverse'
      options = {
          :url => {:action => 'list',
                        :params => params.merge({ :sort => key})},
          :update => 'table',
          :before => "Element.show('spinner')",
          :success => "Element.hide('spinner')"
      }
      html_options = {
        :title => 'Sort by this field',
        :class => key
      }
      link_to(param.capitalize, url_for(:controller => 'items', :action => 'list', :params => params.merge({:sort => key})), html_options )
    end

end
