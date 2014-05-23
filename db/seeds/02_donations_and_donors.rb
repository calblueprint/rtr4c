###################### Donors and associated donations ########################

amt = 888.88
donor = Donor.create(   email: "kindsir@kindness.com",
                        address: "test",
                        name: "William Robinson",
                        amount: amt)

Donation.create(amount: amt, 
                message: "Love what RTR4C does. I hope I can make it into"\
                         "the gold tier with this donation ;)",
                donor_id: donor.id)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
amt = 444.44
donor = Donor.create(   email: "kanye@kanyewest.edu",
                        name: "Kanye West",
                        address: "test",
                        amount: amt)

Donation.create(amount: amt, 
                message: "Because silver is the closest of the tiers to the "\
                         "real best color, PLATINUM.",
                donor_id: donor.id)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
amt = 100.00
donor = Donor.create(   email: "callmemc@gmail.com",
                        name: "Michelle Chow",
                        address: "test",
                        amount: amt)

Donation.create(amount: amt, 
                message: "I wish people would actually call me mc...",
                donor_id: donor.id)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
amt = 14.00
donor = Donor.create(   email: "growingman@growth.com",
                        name: "John Grow",
                        address: "test",
                        amount: amt)

Donation.create(amount: amt, 
                message: "All I can afford to give now, but I hope I can do "\
                         "more in the future!",
                donor_id: donor.id)

###############################################################################