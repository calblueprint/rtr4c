t = TeamMember.new(
  name: 'Nancy Linebarger Ballard',
  title: 'FOUNDER / DIRECTOR',
  blurb: 'A botanical watercolor artist and published author of several books including her new romance novel, Invited Guests. She is committed and excited to be involved with RoomsThatRock4Chemo. Much of the gratitude goes to the designers and volunteers who give so much. “It is overwhelming to be a part of the grace and generosity of our volunteers."',
  role: 0,
)

t.images.new().photo_from_url("http://www.roomsthatrock4chemo.us/images/nancy-linebarger-ballard.jpg")
t.save