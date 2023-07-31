class Category
  attr_reader :name,
              :id

  def initialize(data)
    @name = data[:name]
    @id   = data[:id]
  end
end