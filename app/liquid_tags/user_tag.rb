class UserTag < LiquidTagBase
  def initialize(_tag_name, user, _tokens)
    @user = parse_username_to_user(user.delete(" "))
    @follow_button = follow_button(@user)
    @user_colors = user_colors(@user)
  end

  def parse_username_to_user(user)
    user = User.find_by(username: user)
    raise StandardError, "Invalid username" if user.nil?

    user
  end
end

Liquid::Template.register_tag("user", UserTag)
