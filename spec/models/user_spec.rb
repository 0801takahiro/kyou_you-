require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できないとき' do
        it 'nameが空では登録できない' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailは@が含まれていないと登録できない' do
          @user.email = 'aaaaa.aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordは6文字以上でないと登録できない' do
          @user.password = 'aaaaa'
          @user.password_confirmation = 'aaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordは確認も含めて2回入力しないと登録できない' do
          @user.password = ''
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordと確認用passwordが一致していないと登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'bbbbbb'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
