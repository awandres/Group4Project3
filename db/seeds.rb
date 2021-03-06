# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'flickraw'

FlickRaw.api_key=ENV['API_KEY']
FlickRaw.shared_secret=ENV['SECRET_KEY']

Post.destroy_all
Image.destroy_all


list = flickr.photos.search(:tags => "oneletter", :per_page => '500')

list.each do |x|
   Image.create!(
   letter: x.title.split('').last,
   url: "http://farm#{x.farm}.static.flickr.com/#{x.server}/#{x.id}_#{x.secret}_m.jpg",
   title: x.title,
   idname: x.id,
   secret: x.secret,
   server: x.server,
   farm: x.farm
   )
end

space = Image.create(letter: 'space', url: 'http://i.imgur.com/jhs1Rs6.jpg', title: 'space', idname: 'space', secret: 'space', server: 'space', farm: 'space')


Post.create(content: 'get me out')
Post.create(content: 'i see dead people')
Post.create(content: 'all your base are belong to us')
Post.create(content: 'i know what you did last summer')
Post.create(content: 'burn them all')
Post.create(content: 'i have your api keys')
