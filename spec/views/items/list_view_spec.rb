require File.dirname(__FILE__) + '/../../spec_helper'

describe "list items page" do

  before(:each) do
    render 'items/list'
  end

  it "should have 1 form" do
    response.body.should have_tag('form', :count => 1)
  end

  describe "search form" do

    it "should have 1 text field " do
      response.body.should have_tag('form') do |form|
        form.should  have_tag("//input[@type='text']")
      end
    end

    it "should have 1 submit button" do
      response.body.should have_tag('form') do |f|
        f.should have_tag("//input[@type='submit']", :count => 1)
      end
    end

  end

  it "should have 1 table" do
      response.body.should have_tag('table', :count => 1)
  end

  describe "table" do

    before(:each) do
        @items = Item.find(:all)
    end

    it "should have 3 headers called 'name, qty, price' " do
        response.body.should have_tag('thead', :count => 1) do |th|
          th.should have_tag('tr', :count => 3)
          th.inner_html.should == 'name' || 'qty' || 'price'
        end
    end

    it "should have 5 rows of data" do
        respond.body.should have_tag('table') do |t|
            t.should have_tag('td', :count => 5)
        end
    end

  end
=end

end
