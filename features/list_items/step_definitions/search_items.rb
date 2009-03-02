Then /^print all the items containing 'c'$/ do
    assigns(:items).collect { |i| i.name}.should ==
        %w{cards cars}
end

Then /^show a description of the search parameter$/ do
    response.body.should have_tag('p.search_for span', :text => session[:query])
end

# Print a message like so
# <div id=no_results> No results found </div>
# <div id=search_for> Search parameter was <span>dfdfdf</span></div>
Then /^print a message notifying the user that there is no result$/ do
    response.body.should have_tag('p.no_results')
    response.body.should have_tag('p.search_for span', :text => session[:query])
end

Then /^print all items$/ do
    assigns(:items).count.should == Item.find(:all).count
end
