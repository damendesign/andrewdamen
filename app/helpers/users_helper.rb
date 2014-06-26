module UsersHelper

  def avatar_for(user, options = { size: 50 })
    size = options[:size]
    return image_tag( 'DefaultUser.png', alt: user.username, width: size, height: size)
  end
end
