class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  def self.find_by_provider_and_uid(provider,uid)
    find_by(uid: uid, provider: provider)
  end

  def self.create_with_omniauth(auth)
    self.create(name: auth[:info][:name],uid:auth[:uid],provider:auth[:provider])
  end

end
