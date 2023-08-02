class UserBill
  attr_reader :name,
              :description,
              :status,
              :bill_id

  def initialize(data)

    @name = data[:attributes][:title]
    @description = data[:attributes][:description]
    @status = data[:attributes][:last_action]
    @bill_id = data[:attributes][:bill_id]
  end
end