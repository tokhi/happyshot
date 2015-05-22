module PostsHelper
	def user_avatar user
		if user.avatar.nil?
			user.avatar = Random.rand(11)
			user.save!
		end
		user.avatar
	end

	def human_date_format(date)
		if date.to_s.include? Time.now.year.to_s
			date.to_time.strftime('%b %d')
		else
			date.to_time.strftime('%b %d %H:%M %Z %Y')
		end
	end
end
