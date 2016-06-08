require 'rails_helper'
describe User, :type => :model  do
	it 'check if user is an admin' do
		shafi = User.create!(email: 'shafi.123213@gmail.com', password: '12345678')
		tokhi = User.create!(email: 'tokhi@gmail.com', password: '12345678', admin: true)

		expect(shafi.admin?).to eq(false)
		expect(tokhi.admin?).to eq(true)
	end
end
