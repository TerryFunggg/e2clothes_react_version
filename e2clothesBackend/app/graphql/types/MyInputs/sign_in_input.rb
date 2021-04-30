module Types
  module MyInputs
    class SignInInput < BaseInputObject
      description "Input attributes for user login, it will return token "
      argument :email, String, required: true
      argument :password, String, required: true
    end
  end
end
