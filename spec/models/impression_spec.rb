require 'rails_helper'

RSpec.describe Impression, type: :model do
  context "内容が入力されている場合" do
    let!(:impression) do
      Impression.new({body: "Rspecのテスト"})
    end
    it '感想を保存できる' do
      expect(impression).to be_valid
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
