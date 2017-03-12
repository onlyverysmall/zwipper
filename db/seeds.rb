# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sally, bobby, susie, jimmy, katie = User.create([
  { username: 'sally', email: 'sally@test.com', password: 'testing' },
  { username: 'bobby', email: 'bobby@test.com', password: 'testing' },
  { username: 'susie', email: 'susie@test.com', password: 'testing' },
  { username: 'jimmy', email: 'jimmy@test.com', password: 'testing' },
  { username: 'katie', email: 'katie@test.com', password: 'testing' },
])

sally.zwipps.create([
  { text: 'Actually swag kinfolk in mustache sed, pug lumbersexual cornhole kitsch.' },
  { text: 'Semiotics post-ironic roof party meditation.' },
  { text: 'Meh eu mlkshk, fanny pack microdosing nesciunt adipisicing tumeric food truck pour-over crucifix.' },
])

bobby.zwipps.create([
  { text: 'Pinterest salvia plaid, tumblr brunch distillery aute yuccie yr vaporware culpa.' },
  { text: 'Actually nostrud mustache copper mug.' },
  { text: 'Kitsch aliqua disrupt gochujang irony.' }
])

susie.zwipps.create([
  { text: 'Mixtape chambray brooklyn, mustache lyft id craft beer letterpress kickstarter iceland cred fashion axe.' },
  { text: 'Odio activated charcoal flannel man braid, distillery banjo veniam sartorial irony listicle.' },
  { text: 'Exercitation pop-up 3 wolf moon paleo jean shorts wolf.' }
])

jimmy.zwipps.create([
  { text: 'Nihil mumblecore austin commodo, dolor gochujang offal neutra eiusmod lumbersexual migas minim drinking vinegar.' },
  { text: 'Thundercats VHS green juice truffaut poke raclette, incididunt poutine ullamco meditation mumblecore in hexagon.' },
  { text: 'Ex truffaut tempor, knausgaard blue bottle thundercats cronut mixtape twee sartorial meggings.' }
])

Follow.create([
  { follower: sally, followee: bobby }, { follower: sally, followee: susie },
  { follower: bobby, followee: sally }, { follower: bobby, followee: jimmy },
  { follower: susie, followee: bobby }, { follower: susie, followee: jimmy },
  { follower: jimmy, followee: katie }, { follower: jimmy, followee: bobby },
  { follower: katie, followee: sally }, { follower: katie, followee: bobby },
  { follower: katie, followee: susie }, { follower: katie, followee: jimmy }
])

Fave.create([
  { user: sally, zwipp: bobby.zwipps.first },
  { user: sally, zwipp: susie.zwipps.first },
  { user: sally, zwipp: jimmy.zwipps.first },
  { user: katie, zwipp: sally.zwipps.first },
  { user: katie, zwipp: jimmy.zwipps.first },
  { user: katie, zwipp: sally.zwipps.last }
])
