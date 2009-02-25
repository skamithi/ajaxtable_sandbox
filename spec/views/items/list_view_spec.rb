require File.dirname(__FILE__) + '/../../spec_helper'

describe "list items page" do

  before(:each) do
    params.merge!(:page => 1)
    @item1 = mock_model(Item, :name => 'hoe', :quantity => 20, :price => 300)
    @item2 = mock_model(Item, :name => 'wheel', :quantity => 30, :price => 100)
    @items = [@item1, @item2]
    @total = @items.count
    assigns[:items] = @items.paginate :page => 1
    assigns[:total] = @items.count
    # have to specify rb file location. In this case I'm looking for /items/index.html.rb
    # to render..so call " render '/items/index' ", no html.erb necessary
    render "/items/index"
  end

  it "should have 1 form" do
    response.body.should have_tag('form', :count => 1)
  end

  describe "search form" do

    it "should have 1 text field and 1 submit button " do
      response.body.should have_tag('form') do
        with_tag("input[type='text']")
        with_tag("input[type='submit']")
      end
    end

  end

  it "should have 1 table" do
      response.body.should have_tag("table", :count => 1)
  end

  it "should have 2 items listed in the table" do
    assigns[:total].should == @items.count
  end

  describe "table" do

    it "should have 3 headers called 'name, qty, price' " do
        response.body.should have_tag('thead', :count => 1) do
          with_tag('th', :count => 3)
          with_tag('th.quantity', :text => 'Quantity')
          with_tag('th.price', :text => 'Price')
          with_tag('th.name', :text => 'Name')
        end
    end


    it "should have 2 rows of data" do
        response.body.should have_tag('table') do
            with_tag('tbody') do
                with_tag('tr', :count => @total)
            end
        end
    end

  end


end
