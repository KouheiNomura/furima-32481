require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      describe 'ユーザー情報' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'emailに@が含まれていなれば登録できない' do
          @user.email = "example.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが空では登録できない' do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = "abc12"
          @user.password_confirmation = "abc12"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'passwordに半角英字が含まれなければ登録できない' do
          @user.password = "123456"
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'passwordに半角数字が含まれなければ登録できない' do
          @user.password = "abcdef"
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
        it 'passwordが存在してもpass_confirmationが空では登録できない' do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordpassword_confirmationの値が一致しなければ登録できない' do
          @user.password = "abc123"
          @user.password_confirmation = "def456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
      describe '本人情報確認' do
        it 'last_nameが空では登録できない' do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
          @user.last_name = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end
        it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力でなければ登録できない' do
          @user.first_name = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'last_name_kanaは全角（カタカナ）での入力でなければ登録できない' do
          @user.last_name_kana = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end
        it 'first_name_kanaは全角（カタカナ）での入力でなければ登録できない' do
          @user.first_name_kana = "123456"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
        it 'birth_dateが空では登録できない' do
          @user.birth_date = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end
      end
    end
  end
end