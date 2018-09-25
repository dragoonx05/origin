class User < ApplicationRecord
  include Clearance::User
  mount_uploader :avatar, AvatarUploader 
  enum status: [:customer, :host, :moderator, :superadmin]
  # put your validation here
  has_many :authentications, dependent: :destroy
  has_many :listings
  
  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      email: auth_hash["info"]["email"],
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end 

  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end

end
