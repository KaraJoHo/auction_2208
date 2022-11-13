class Attendee
  attr_reader :name, :budget, :str

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].delete('$').to_i
  end
end
