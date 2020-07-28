require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it 'is valid with a nickname, email, password, password_confirmation' do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it 'is invalid without a nickname' do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it 'is invalid without a email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. 重複したemailが存在する場合登録できないこと
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    # 5. emailは@を含む必要があること
    it 'is invalid without a email must contain @ ' do
      user = build(:user, email: 'testgmail.com')
      user.valid?
      expect(user.errors[:email]).to include('is invalid') # ("dosen't contain @")
    end

    # 6. passwordが空では登録できないこと
    it 'is invalid without a password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 7. passwordが6文字以上であれば登録できること
    it 'is valid with a password that has more than 6 characters ' do
      user = build(:user, password: '00000a', password_confirmation: '00000a')
      expect(user).to be_valid
    end

    # 8. passwordが5文字以下であれば登録できないこと
    it 'is invalid with a password that has less than 5 characters ' do
      user = build(:user, password: '00000', password_confirmation: '0000a')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    # 9. passwordhはh半角英数混合でないと登録できない
    it 'is invalid without a password half-width alphanumeric mixture ' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors[:password]).to include('is invalid') # ("Please enter in the full_width alphanumeric mixture ")
    end

    # 10. passwordが存在してもpassword_confirmationが空では登録できないこと
    it 'is invalid without a password_confirmation although with a password' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 11. first_nameが空では登録できないこと
    it 'is invalid without a first_name' do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    # 12. last_nameが空では登録できないこと
    it 'is invalid without a last_name' do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    # 13. first_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと
    it 'is invalid without a first_name full-width ' do
      user = build(:user, first_name: 'yamada')
      user.valid?
      expect(user.errors[:first_name]).to include('is invalid') # ("Please enter in the full_width")
    end

    # 14. last_nameは全角（漢字・ひらがな・カタカナ）でないと登録できないこと
    it 'is invalid without a last_name full-width ' do
      user = build(:user, last_name: 'taro')
      user.valid?
      expect(user.errors[:last_name]).to include('is invalid') # ("Please enter in the full_width")
    end

    # 15. first_kanaが空では登録できないこと
    it 'is invalid without a first_kana' do
      user = build(:user, first_kana: nil)
      user.valid?
      expect(user.errors[:first_kana]).to include("can't be blank")
    end

    # 16. last_kanaが空では登録できないこと
    it 'is invalid without a last_kana' do
      user = build(:user, last_kana: nil)
      user.valid?
      expect(user.errors[:last_kana]).to include("can't be blank")
    end

    # 17. first_kanaは全角（カタカナ）でないと登録できないこと
    it 'is invalid without a first_kana full-width katakana ' do
      user = build(:user, first_kana: 'yamada')
      user.valid?
      expect(user.errors[:first_kana]).to include('is invalid') # ("Please enter in the full_width katakana")
    end

    # 18. last_kanaは全角（カタカナ）でないと登録できないこと
    it 'is invalid without a last_kana full-width katakana ' do
      user = build(:user, last_kana: 'taro')
      user.valid?
      expect(user.errors[:last_kana]).to include('is invalid') # ("Please enter in the full_width katakana")
    end

    # 19. birth_dateが空では登録できないこと
    it 'is invalid without a birth_date' do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end
  end
end
