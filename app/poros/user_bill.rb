class UserBill
  attr_reader :name,
              :description,
              :status

  def initialize(data)
    @name = data[:title]
    @description = data[:description]
    @status = data[:status]
  end
end