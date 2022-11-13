class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee_object, bid_num)
    @bids[attendee_object] = bid_num
  end
end
