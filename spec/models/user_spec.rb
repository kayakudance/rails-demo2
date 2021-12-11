require 'rails_helper'

RSpec.describe User, type: :model do

  # 有効なfactory_botが設定されている
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # 名前がなければ無効な状態であること
  it "is invalid without a name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  # 名前が51文字以上の場合は無効な状態であること
  it "is invalid with a name that has more than 51 characters" do
    user = FactoryBot.build(:user_name_51_characters)
    user.valid?
    expect(user.errors[:name]).to include("は50文字以内で入力してください")
  end

  # 名前が50文字の場合は有効な状態であること
  it "is valid with a name that has 50 characters" do
    user = FactoryBot.build(:user_name_50_characters)
    expect(user).to be_valid
  end

  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  # # メールアドレスが255文字以上の場合は無効な状態であること
  # it "is invalid with a email that has more than 255 characters" do
  #   user = FactoryBot.build(:user_name_51_characters)
  #   user.valid?
  #   expect(user.errors[:email]).to include("は255文字以内で入力してください")
  # end
  #
  # # メールアドレスが5文字以下の場合は無効な状態であること
  # it "is invalid with a email that has less than 5 characters" do
  #
  # end
  #
  # # メールアドレスが6文字の場合は有効な状態であること
  # it "is invalid with a email that has 6 characters" do
  #
  # end
  #
  # # メールアドレスが254文字の場合は有効な状態であること
  # it "is invalid with a email that has 254 characters" do
  #
  # end

  # パスワードがなければ無効な状態であること
  it "is invalid without an password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

  # パスワードと確認用パスワードが不一致の場合は無効な状態であること
  it "is invalid without matching an password with an password confirmation" do
    user = FactoryBot.build(:user_password_unmatched_with_confirmation)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
  end

end
