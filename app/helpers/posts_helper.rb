module PostsHelper
	def user_avatar user
		if user.avatar.nil?
			user.avatar = Random.rand(11)
			user.save!
		end
		user.avatar
	end
end
