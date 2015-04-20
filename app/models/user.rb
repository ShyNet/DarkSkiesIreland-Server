class User < ActiveRecord::Base
  def self.authenticate(username, user_id)
    @verified = false
    if User.exists?(name: username, userid: user_id)
      @verified = true
    end
    return @verified
  end

  def self.register(username, user_id)
    new_user = User.new
    new_user.name = username
    new_user.userid = user_id
    puts new_user
    # User.create(:userid => user_id, :name => username)
  end
end
