require 'rails_helper'

RSpec.describe Question, type: :model do
  before do
    @question = build(:question)
  end

  describe "バリデーション" do
    it "name, title, contentがあればvalid" do
      expect(@question).to be_valid
    end
  end
end
