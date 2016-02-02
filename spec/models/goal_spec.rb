# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  body       :string           not null
#  user_id    :integer          not null
#  shared     :boolean          default("f"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe 'validations' do

    it { should validate_presence_of(:title) }

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:user_id) }

  end

  describe 'associations' do

    it { should belong_to(:user) }

  end

end
