class Auction
  attr_reader :items
  def initialize
    @items = []
    @attendees =[]
  end

  def add_item(item_object)
    @items << item_object
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def add_attendees(attendee_obj)
    @attendees << attendee_obj
  end

  def unpopular_items
    unpop = []
    @items.each do |item_obj|
      if item_obj.bids == {}
        unpop << item_obj
      end
    end
      unpop
  end

  def popular_items
    popular = []
    @items.each do |item_obj|
      if item_obj.bids.empty? == false
        popular << item_obj
      end
    end
    popular
  end

  def bidders
    names = []
    @items.each do |item_obj|
      if item_obj.bids.empty? == false
        item_obj.bids.map do |attendee, val|
          #require 'pry' ;binding.pry
          names <<  attendee.name
        end
      end
    end
    names.uniq
  end

  def find_attendee_items(attendee_obj)
    @items.select do |item|
      item.bids.include?(attendee_obj)
    end
    # require 'pry' ;binding.pry
  end

  def bidder_info
    #I want to format the bidder info into a hash
    info_hash = {}
    @items.each do |item_obj|
        item_obj.bids.map do |attendee_obj, amount_bid|
          #require 'pry' ;binding.pry
          info_hash[attendee_obj] = {budget: attendee_obj.budget, items: find_attendee_items(attendee_obj)}
        end
      end
      info_hash
  end
end
