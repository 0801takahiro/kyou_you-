require 'rails_helper'

RSpec.describe PostImpression, type: :model do
  context "内容が入力されている場合" do
    let!(:post_impression) do
      Impression.new({body: "Rspecのテスト",user_id: "1"})
    end
    it '感想を保存できる' do
      expect(impression).to be_valid
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
