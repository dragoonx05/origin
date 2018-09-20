class User < ActiveRecord::Base
  include Clearance::User

  # put your validation here
end
