class UserBill
  attr_reader :name,
              :description,
              :status

  def initialize(data)

    @name = data[:attributes][:title]
    @description = data[:attributes][:description]
    @status = data[:attributes][:last_action]
  end
end