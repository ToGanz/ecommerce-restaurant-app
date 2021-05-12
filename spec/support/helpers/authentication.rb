module Helpers
  module Authentication
    def sign_up_as_admin
      user = FactoryBot.build(:user)
      user.admin = true
      user.save
      sign_in(user)
    end
  end
end