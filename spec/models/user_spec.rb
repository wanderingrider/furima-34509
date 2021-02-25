require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameが必須のこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    it 'emailが必須のこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'メールアドレスは、@を含むこと' do
      @user.email = 'acom'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが必須のこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @user.password = '00000a'
      @user.password_confirmation = '00000a'
      expect(@user).to be_valid
      end
     it 'passwordは確認用を含めて２回入力すること' do
      @user.password = '00000a'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
     end
    it 'paswordとpassword(確認用)は値の一致が必須あること' do 
      @user.password = '00000a'
      @user.password_confirmation = '00000b'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordは、半角英数字での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
 end

 describe '新規登録/本人情報確認' do
   it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
    @user.surname = ''
    @user.first_name
    @user.valid?
    expect(@user.errors.full_messages).to include("Surname can't be blank", "Surname is invalid")
   end
   it  'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
    @user.surname = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("Surname is invalid")
   end

   it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
      @user.read_surname = ''
      @user.read_first_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Read surname can't be blank", "Read surname is invalid")
   end
   it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
    @user.read_surname = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include("Read surname is invalid")
   end
   it '生年月日が必須であること' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include( "Birthday can't be blank")
   end
 end
end