class Bill
  attr_reader :id,
              :state,
              :bill_number,
              :name,
              :description,
              :status,
              :bill_id,
              :sponsors,
              :texts,
              :type

  def initialize(data)
    @id = data[:id]
    @type = data[:type]
    @state = data[:attributes][:state]
    @bill_number = data[:attributes][:bill_number]
    @name = data[:attributes][:title]
    @description = data[:attributes][:description]
    @status = data[:attributes][:last_action]
    @bill_id = data[:attributes][:bill_id]
    @sponsors = data[:attributes][:sponsors]
    @texts = data[:attributes][:texts]
  end
end