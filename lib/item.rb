class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee_object, bid_num)
    @bids[attendee_object] = bid_num
  end

  def current_high_bid
    find_high = @bids.max_by do |attendee, bid|
      bid
    end
    find_high.last
  end
end
