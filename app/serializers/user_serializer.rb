class UserSerializer
  include FastJsonapi::ObjectSerializer
    set_type :user_details
    attribute :api_key do |user|
      user.auth_token
    end
end
