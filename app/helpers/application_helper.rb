# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    # add controller_specific_javascript_tag
    def add_javascript_helper
        html_c = ''
        %w{items}.each do |c|
            if controller.controller_name == c
                html_c << javascript_include_tag("controllers/#{c}", :cache => true)
            end
        end
        html_c
    end
end
