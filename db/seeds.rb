# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'securerandom'

75.times do
  Post.create(
    :note => "My Post #{SecureRandom.hex(2)}",
    :user_id => 1
  )
end

links = {
	"http://i452.photobucket.com/albums/qq247/damien137/gif/8z2mwn.gif"=> "Goerge bush and dancing moves",
	"http://i589.photobucket.com/albums/ss337/LadyCroix_album/Gif/117ve4g.gif"=>"Drunk man looking",
	"http://i1215.photobucket.com/albums/cc506/diraselly/Gif/tumblr_le3nu9QUKW1qct8mq.gif" => "girly laugh",
	"http://i991.photobucket.com/albums/af35/Perfektionisti/Funny/skills6.gif"=>"Awesome flip",
	"http://i991.photobucket.com/albums/af35/Perfektionisti/Funny/clothes_wearing_skill.gif"=> "cloth wearing",
	"http://i991.photobucket.com/albums/af35/Perfektionisti/Funny/bullet.gif"=> "Bullet hit",
	"http://img.photobucket.com/albums/v357/rus33/trippy10.gif"=> "Head comes out of mouth",
	"http://i44.photobucket.com/albums/f39/Themaster828/Funny/Disgusted-Grandma.gif"=>"Grandma says oh my God!",
	"http://i755.photobucket.com/albums/xx195/skez520mia/FUNNY%20CRAZY%20AND%20AWESOME%20GIFS/Birthday_candles_hair.gif" => "Hair on fire - birthday gift",
	"http://i755.photobucket.com/albums/xx195/skez520mia/FUNNY%20CRAZY%20AND%20AWESOME%20GIFS/beanbag.gif" => "bean bag explosion",
	"http://i114.photobucket.com/albums/n258/devilshero/2-47.gif" => "Poor guy...",
	"http://i736.photobucket.com/albums/xx5/aryosp/penguins.gif" => "Penguin slaps another penguin",
	"http://i991.photobucket.com/albums/af35/Perfektionisti/Funny/funnyprank.gif" => "He should have not sleep at work!",
	"http://i991.photobucket.com/albums/af35/Perfektionisti/Funny/Funnygif.gif" => "Laser point dog..."



}

links.each do |key, value|
	Post.create(
    :note => value,
    :image => key,
    :publish => true,
    :user_id => 1
  )
end