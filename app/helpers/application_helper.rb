module ApplicationHelper
	# make devise available to other controllers
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def get_username(user)
    if user.name.nil?
      user.email.split("@").first
    else
      user.name
    end
  end

end
