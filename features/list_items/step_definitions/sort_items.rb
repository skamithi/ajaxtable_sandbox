Given /^the "(.*)" table header contains "(.*)"$/ do |name, sort_order|
    response.body.should have_tag("th.#{name}.#{sort_order}")
end

When /^I select "(.+)" .*from the table header$/ do |link|
    click_link(link)
end

Then /^sort items by (.+) in (.+) order$/ do |name, sort_order|
    sort_type = (sort_order == 'descending')? 'DESC' : ''
    assigns(:sort).should == "#{name} #{sort_type}".strip
end
