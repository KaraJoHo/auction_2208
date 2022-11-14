class Item
  attr_reader :name, :bids, :bidding_open

  def initialize(name)
    @name = name
    @bids = {}
    @bidding_open = true
  end

  def add_bid(attendee_object, bid_num)
    if bidding_open == true
      @bids[attendee_object] = bid_num
      bids
    end
  end

  def current_high_bid
    find_high = @bids.max_by do |attendee, bid|
      bid
    end
    find_high.last
  end

  def close_bidding
    @bidding_open = false
  end

end
