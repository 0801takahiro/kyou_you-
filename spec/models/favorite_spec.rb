require 'rails_helper'

RSpec.describe Favorite, type: :model do
  context 'お気に入りボタンを押した際' do
    let!(:favorite) do
      Favorite.new({ user_id: '1', impression_id: '1' })
    end
    it 'お気に入り登録がされる' do
      expect(favorite).to be_valid
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
