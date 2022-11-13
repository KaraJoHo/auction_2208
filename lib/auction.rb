class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item_object)
    @items << item_object
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    unpop = []
    @items.each do |item_obj|
#require 'pry' ;binding.pry
      if item_obj.bids == {}
        unpop << item_obj
      end
    end
      unpop
  end
end
