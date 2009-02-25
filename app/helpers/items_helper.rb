
module ItemsHelper

    def sort_and_link_helper
      html_c = ''
      %w(name quantity price).each do |header|
        html_c << content_tag(:th , sort_link_helper(header), :class => sort_td_class_helper(header))
      end
      html_c
    end

    def sort_td_class_helper(sort_type)
      classname = [sort_type]
      sort_direction = (params[:sort] == sort_type)? "sortup" : "sortdown"
      classname << sort_direction
      classname.join(' ')
    end

    def sort_link_helper(param)
      key = (params[:sort] == param)? param + '_reverse' : param

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
