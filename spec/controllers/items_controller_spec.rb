require File.dirname(__FILE__) + '/../spec_helper'

describe ItemsController do
  fixtures :items

  before do
      @list_params = { :query => nil, :page => nil, :sort => nil }
  end

  describe "should list" do
      def do_list
        get :index,  @list_params
      end

      it "all items if there is no sort order" do
          do_list
         assigns(:items).count.should == 5
      end

      it "2 items if the name starts with 'w' " do
        @list_params[:query] = 'w'
        do_list
        assigns(:items).count.should == 2
      end

      it  "1 item if the  name starts with 'hoe' " do
        @list_params[:query] = 'hoe'
        do_list
        assigns(:items).count.should == 1
      end

      it "an ascending sorted list by name if the sort parameter is set to 'name' " do
        @list_params[:sort] = 'name'
        do_list
        assigns(:items).collect { |i| i.name }.should ==
                                          %w{cards cars hoe wheelbarrow wheels}
      end

      it "a descending sorted list by name if the sort parameter is " +
          "set to 'name_reverse' " do
        @list_params[:sort] = 'name_reverse'
        do_list
        assigns(:items).collect { |i| i.name }.should ==
                                          %w{wheels wheelbarrow hoe cars cards}
      end

      it "an ascending sorted list by quantity if the sort parameter is set to 'qty' " do
        @list_params[:sort] = 'quantity'
        do_list
        assigns(:items).collect {|i| i.quantity.to_s }.should ==
                %w{4 10 20 100 200}
      end

      it "a descending sorted list by quantity if the sort parameter " +
         "is set to 'qty_reverse' " do
        @list_params[:sort] = 'quantity_reverse'
        do_list
        assigns(:items).collect {|i| i.quantity.to_s }.should ==
                %w{200 100 20 10 4}
      end

      it "an ascending sorted list by price if the sort parameter is set to 'price' " do
        @list_params[:sort] = 'price'
        do_list
        assigns(:items).collect {|i| i.price.to_s }.should ==
            %w{10 20 100 300 400}
      end

      it "a descending sorted list by price if the sort parameter is " +
         "set to 'price_reverse' " do
        @list_params[:sort] = 'price_reverse'
        do_list
        assigns(:items).collect {|i| i.price.to_s }.should ==
            %w{400 300 100 20 10}
      end

      it "an ascending sorted list by price if the sort parameter is set to" +
          " 'price' and the name starts with 'c' " do
        @list_params[:sort] = 'price'
        @list_params[:query] = 'c'
        do_list
        assigns(:items).collect {|i| i.price.to_s}.should ==
            %w{100 400}
      end

  end

end
