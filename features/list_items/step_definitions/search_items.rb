Then /^print all the items containing 'c'$/ do
    assigns(:items).collect { |i| i.name}.should ==
        %w{cards cars}
end

Then /^show a description of the search parameter$/ do
    response.body.should have_tag('div#search_for span', :text => session[:query])
end
