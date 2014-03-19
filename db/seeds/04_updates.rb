############################### Press Updates #################################
update = Update.create( 
    header: "San Francisco Giants Home Game",
    body:   "RoomsThatRock4Chemo will be honored along with Dignity Health "\
            "at AT&T Park by the San Francisco Giants at their home game on "\
            "May 24th. Please plan on attending and rock with us.")
date_time = DateTime.new(2014,02,17)
update.created_at = date_time
update.updated_at = date_time
update.save

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


###############################################################################