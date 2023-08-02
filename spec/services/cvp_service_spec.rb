require 'rails_helper'

describe CvpService do
  describe 'class methods' do
    describe '#get_digest_bills' do
      it 'returns digest of bills based on users category selections', :vcr do
        
        digest = CvpService.get_digest_bills
        require 'pry'; binding.pry
      end
    end
  end
end