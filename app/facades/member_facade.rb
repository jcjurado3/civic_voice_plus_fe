class MemberFacade
  def member_result(bill_id)
    MemberDetails.new(service.member_url(bill_id))
  end

  def service
    CvpService.new
  end
end
