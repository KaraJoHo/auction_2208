require './lib/auction'
require './lib/item'

RSpec.describe Auction do
  it 'exists and has attributes' do
    auction = Auction.new

    expect(auction).to be_a(Auction)
    expect(auction.items).to eq([])
  end

  describe '#add_item' do
    it 'can add items to the auction array' do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.items).to eq([item1, item2])
    end
  end

  describe '#item_names' do
    it 'can list the names of each item' do
      auction = Auction.new
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')

      auction.add_item(item1)
      auction.add_item(item2)

      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end

  describe '#unpopular_items' do
    it 'returns a list of unpopular items from an auction' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      auction = Auction.new

      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)

      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)

      item4.add_bid(attendee3, 50)
      expect(auction.unpopular_items).to eq([item2, item3, item5])

      item3.add_bid(attendee2, 15)

      expect(auction.unpopular_items).to eq([item2, item5])
    end
  end

  describe '#bidders' do
    it 'returns a list of bidder names from the auction' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      auction = Auction.new

      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)


      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expect(auction.bidders).to match_array(['Megan', 'Bob', 'Mike'])
    end
  end

  describe '#bidder_info' do
    it 'returns a hash with keys as attendees and values that are hashes with budges and array of items they bid on' do
      item1 = Item.new('Chalkware Piggy Bank')
      item2 = Item.new('Bamboo Picture Frame')
      item3 = Item.new('Homemade Chocolate Chip Cookies')
      item4 = Item.new('2 Days Dogsitting')
      item5 = Item.new('Forever Stamps')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      auction = Auction.new

      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      auction.add_attendees(attendee1)
      auction.add_attendees(attendee2)
      auction.add_attendees(attendee3)


      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)

      expected = {
                    attendee1 => {
                                  :budget => 50,
                                  :items => [item1]
                                },


                    attendee2 => {
                                  :budget => 75,
                                  :items => [item1, item3]


                  },
                    attendee3 => {
                                    :budget => 100,
                                    :items => [item4]
                    }

                }
      expect(auction.bidder_info).to eq(expected)
    end
  end
end
