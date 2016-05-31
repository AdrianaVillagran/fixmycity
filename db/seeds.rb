Report.destroy_all
ConfirmedIssue.destroy_all

Report.create({title: "Pothole on Fulton",
            description: "Large pothole almost threw me off my bike. This one needs fixing STAT!",
            category: "pothole", #change to enum
            major_road: "Fulton Ave",
            cross_street1: "10th Ave",
            cross_street2: "11th Ave",
            danger_level: 1,
            status: 1,
            upvotes: 3,
            downvotes: 0,
            latitude: 37.773286,
            longitude: -122.468676})
            #add danger_level
Report.create({title: "Missing street sign at Bush and Larkin intersection",
            description: "There are no Bush street signs at this interection which makes it
                          impossible to tell where you are. I missed the turn on the way to
                          work because of it.",
            category: "signage",
            major_road: "Bush",
            cross_street1: "Bush",
            cross_street2: "Larkin",
            status: 0,
            danger_level: 0,
            upvotes: 1,
            downvotes: 0,
            latitude:37.788953,
            longitude: -122.418667})
Report.create({title: "Tree branch broke off and is blocking part of street",
            description: "The storm last night broke off a tree branch right off
                          the panhandle and is now blocking part of the leftmost
                          lane on Oak.",
            category: "other",
            major_road: "Oak",
            status: 0,
            danger_level: 2,
            cross_street1: "Masonic",
            cross_street2: "Ashbury",
            upvotes: 7,
            downvotes: 0,
            latitude: 37.771932,
            longitude: -122.446827})
Report.create({title: "Ha I'm a troll",
            description: "Troll troll troll troll troll troll troll troll troll
                          troll!",
            category: "other",
            major_road: "Troll Street",
            status: 2,
            danger_level: 2,
            cross_street1: "Troll Ave",
            cross_street2: "Troll St",
            upvotes: 0,
            downvotes: -5,
            latitude: 37.771932,
            longitude: -122.446827})
ConfirmedIssue.create({title: "Pothole on Fulton",
            notes: "Sent notification to assess damage",
            category: 0,
            danger_level: 1,
            status: 0,
            major_road: "Fulton Ave",
            cross_street1: "10th Ave",
            cross_street2: "11th Ave",
            latitude: 37.773286,
            longitude: -122.468676})
