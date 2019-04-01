require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    @answer = build(:answer)
  end

  describe "バリデーション" do
    it "name, contentがあればvalid" do
      expect(@answer).to be_valid
    end
  end
end
