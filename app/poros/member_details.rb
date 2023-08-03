class MemberDetails
  attr_reader :member_deets
  def initialize(data)
    @member_deets = data[:data]
  end
end