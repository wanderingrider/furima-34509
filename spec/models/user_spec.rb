require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    it 'nicknameが必須のこと' do
    end
    it 'emailが必須のこと' do
    end
    it 'メールアドレスが一意性であること' do
    end
    it 'メールアドレスは、@を含むこと' do
    end
    it 'passwordが必須のこと' do
    end
     it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    end
    it 'passwordは、半角英数字での入力が必須であること' do
    end
    it 'passwordは確認用を含めて２回入力すること' do
    end
    it 'paswordとpassword(確認用)は値の一致が必須あること' do 
    end
 end

 describe '新規登録/本人情報確認'
   it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
   end
   it  'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
   end
   it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること' do
   end
   it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
   end
   it '生年月日が必須であること' do
   end
 end

 describe 'トップページ'
   it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること' do
   end
   it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること' do
   end 
   it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること' do
   end
   it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること' do
   end
  end


end