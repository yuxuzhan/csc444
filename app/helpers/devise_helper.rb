module DeviseHelper
    def devise_error_messages!
        html = ""
        return html if resource.errors.empty?

        errors_number = 0

        html << "<ul class=\"#{resource_name}_errors_list\">"

        saved_key = ""
        resource.errors.each do |key, value|
            if key != saved_key
                html << "<li class=\"#{key} error\"> This #{key} #{value} </li>"
                errors_number += 1
            end
            saved_key = key
        end

        unsolved_errors = pluralize(errors_number, "unsolved errors")
        if unsolved_errors > 1
            html = "<h2 class=\"#{resource_name}_errors_title\"> You have #{unsolved_errors} </h2>" + html
            html << "</ul>"
            return html.html_safe
        else
            html = "<h2 class=\"#{resource_name}_errors_title\"> You have 1 unsolved error</h2>" + html
            html << "</ul>"
        end
    end
end
