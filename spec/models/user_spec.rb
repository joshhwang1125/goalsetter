    # == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "is valid when required required attributes are present" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  context 'is invalid' do
    specify 'when name is blank' do
      expect(FactoryGirl.build(:user, username:'')).not_to be_valid
    end
  end
end
