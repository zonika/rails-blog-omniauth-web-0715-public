class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.create_with_omniauth(auth)
    self.create(
      :provider => auth["provider"],
      :uid => auth["uid"],
      :name => auth["info"]["name"]
    )
  end
end
