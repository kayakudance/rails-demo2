FactoryBot.define do
  factory :user do
    name {"taro"}
    sequence(:email) {|i| "taro#{i}@gmail.com"}
    password {"123456"}
    password_confirmation {"123456"}

    factory :user_name_50_characters do
      name {"ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひ"}
    end

    factory :user_name_51_characters do
      name {"ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばぱひい"}
    end

    # factory :user_email_255_characters do
    #
    # end

    factory :user_password_unmatched_with_confirmation do
      password {123456}
      password_confirmation {654321}
    end

  end
end
