Report.destroy_all
ConfirmedIssue.destroy_all

Report.create({title: "Pothole on Fulton",
            description: "Large pothole almost threw me off my bike. This one needs fixing STAT!",
            category: "Pothole",
            major_road: "Fulton Ave",
            cross_street1: "10th Ave",
            cross_street2: "11th Ave",
            danger_level: 1,
            status: 0,
            upvotes: 3,
            downvotes: 0,
            address: "3428 Fulton St, San Francisco, CA"})

Report.create({title: "Missing street sign at Bush and Larkin intersection",
            description: "There are no Bush street signs at this interection which makes it
                          impossible to tell where you are. I missed the turn on the way to
                          work because of it.",
            category: "Signage",
            major_road: "Bush",
            cross_street1: "Bush",
            cross_street2: "Larkin",
            status: 0,
            danger_level: 0,
            upvotes: 1,
            downvotes: 0,
            address: "1200 Larkin St, San Francisco, CA"
            })
Report.create({title: "Not Enough Street signs",
            description: "There are no Bush street signs at this interection which makes it
                          impossible to tell where you are. I missed the turn on the way to
                          work because of it.",
            category: "Signage",
            major_road: "Bush",
            cross_street1: "Bush",
            cross_street2: "Larkin",
            status: 0,
            danger_level: 0,
            upvotes: 1,
            downvotes: 0,
            address: "1205 Larkin St, San Francisco, CA"
            })
Report.create({title: "Missing street sign",
            description: "There are no Bush street signs at this interection which makes it
                          impossible to tell where you are. I missed the turn on the way to
                          work because of it.",
            category: "Signage",
            major_road: "Bush",
            cross_street1: "Bush",
            cross_street2: "Larkin",
            status: 0,
            danger_level: 0,
            upvotes: 1,
            downvotes: 0,
            address: "1210 Larkin St, San Francisco, CA"
            })
Report.create({title: "Tree branch broke off and is blocking part of street",
            description: "The storm last night broke off a tree branch right off
                          the panhandle and is now blocking part of the leftmost
                          lane on Oak.",
            category: "Other",
            major_road: "Oak",
            status: 0,
            danger_level: 2,
            cross_street1: "Masonic",
            cross_street2: "Ashbury",
            upvotes: 7,
            downvotes: 0,
            address: "1598 Oak St, San Francisco, CA"
            })
Report.create({title: "Ha I'm a troll",
            description: "Troll troll troll troll troll troll troll troll troll
                          troll!",
            category: "Road Obstruction",
            major_road: "Troll Street",
            status: 2,
            danger_level: 2,
            cross_street1: "Troll Ave",
            cross_street2: "Troll St",
            upvotes: 0,
            downvotes: -5,
            address: "6101 Geary Blvd, San Francisco, CA"})
