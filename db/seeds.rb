Report.destroy_all

Report.create({title: "Pothole on Fulton",
            description: "Large pothole almost threw me off my bike. This one needs fixing STAT!",
            category: "Road Repair",
            major_road: "Fulton Ave",
            cross_street1: "10th Ave",
            cross_street2: "11th Ave",
            upvotes: 3,
            downvotes: 0,
            latitude: 37.773286,
            longitude: -122.468676})
Report.create({title: "Missing street sign at Bush and Larkin intersection",
            description: "There are no Bush street signs at this interection which makes it
                          impossible to tell where you are. I missed the turn on the way to
                          work because of it.",
            category: "Road Signage",
            major_road: "Bush",
            cross_street1: "Bush",
            cross_street2: "Larkin",
            upvotes: 1,
            downvotes: 0,
            latitude:37.788953,
            longitude: -122.418667})
Report.create({title: "Tree branch broke off and is blocking part of street",
            description: "The storm last night broke off a tree branch right off
                          the panhandle and is now blocking part of the leftmost
                          lane on Oak.",
            category: "Road Obstruction",
            major_road: "Oak",
            cross_street1: "Masonic",
            cross_street2: "Ashbury",
            upvotes: 7,
            downvotes: 0,
            latitude: 37.771932,
            longitude: -122.446827})
