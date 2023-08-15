class UserBill
  attr_reader :name,
              :description,
              :status,
              :bill_id,
              :bill_number

  def initialize(data)
    @bill_number = data[:attributes][:bill_number]
    @name = data[:attributes][:title]
    @description = data[:attributes][:description]
    @status = data[:attributes][:last_action]
    @bill_id = data[:attributes][:bill_id]
  end
end