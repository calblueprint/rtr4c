###################### Donors and associated donations ########################
donor = Donor.create(   email: "kindsir@kindness.com",
                        name: "William Robinson",
                        title: "CFO of GreatMoves",
                        profile: "http://www.linkedin.com/",
                        amount: 0.0)

Donation.create(amount: 888.88, 
                message: "Love what RTR4C does. I hope I can make it into"\
                         "the gold tier with this donation ;)",
                donor_id: donor.id)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
donor = Donor.create(   email: "kanye@kanyewest.edu",
                        name: "Kanye West",
                        title: "Monster",
                        profile: "http://www.kanyewest.com/",
                        amount: 0.0)

Donation.create(amount: 444.44, 
                message: "Because silver is the closest of the tiers to the "\
                         "real best color, PLATINUM.",
                donor_id: donor.id)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
donor = Donor.create(   email: "callmemc@gmail.com",
                        name: "Michelle Chow",
                        title: "Software Engineer",
                        amount: 0.0)

Donation.create(amount: 100.00, 
                message: "I wish people would actually call me mc...",
                donor_id: donor.id)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
donor = Donor.create(   email: "growingman@growth.com",
                        name: "John Grow",
                        title: "Aspiring All-Star",
                        amount: 0.0)

Donation.create(amount: 14.00, 
                message: "All I can afford to give now, but I hope I can do "\
                         "more in the future!",
                donor_id: donor.id)

###############################################################################