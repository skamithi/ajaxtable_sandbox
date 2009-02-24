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
    render 'items/list'
  end

  it "should have 1 form" do
    response.body.should have_tag('form', :count => 1)
  end

  describe "search form" do

    it "should have 1 text field and 1 submit button " do
      response.body.should have_tag('form') do
        have_tag("//input[@type='text']")
        have_tag("//input[@type='submit']")
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

=begin
    it "should have 3 headers called 'name, qty, price' " do
        response.body.should have_tag('thead', :count => 1) do |th|
          th.should have_tag('tr', :count => 3)
        end
    end
=end

=begin
    it "should have 5 rows of data" do
        response.body.should have_tag('table') do |t|
            t.should have_tag('td', :count => 5)
        end
    end
=end
  end


end
