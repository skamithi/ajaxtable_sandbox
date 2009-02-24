class ItemsController < ApplicationController
  def list
    items_per_page = 10

    sort = case params['sort']
        when 'name' then 'name'
        when 'qty' then 'quantity'
        when 'price' then 'price'
        when 'name_reverse' then 'name DESC'
        when 'qty_reverse' then 'quantity DESC'
        when 'price_reverse' then 'price DESC'
    end

    unless params[:query].nil?
      conditions = ["name LIKE ?", "%#{params[:query]}%"] unless params[:query].nil?
    end

    @total  = Item.count :conditions => conditions
    @items = Item.paginate  :order => sort,
                                          :conditions => conditions,
                                          :per_page => items_per_page,
                                          :page => params[:page]

    respond_to do |format|
      format.html
    end

  end
end
