sidesantis = User.create(
    username: 'sidesantis', 
    email: 'sidesantis@work.com', 
    password_digest: 'password',

    level: '2',
    discipline: "Electrical"
    )

mwgood = User.create(
    username: 'mwgood', 
    email: 'mwgood@work.com', 
    password_digest: 'password',

    level: '1',
    discipline: "Electrical"
    )

mkscott = User.create(
    username: 'mkscott', 
    email: 'mkscott@work.com', 
    password_digest: 'password',

    level: '3',
    discipline: "Mechanical"
    )

aramadan = User.create(
    username: 'aramadan', 
    email: 'aramadan@work.com', 
    password_digest: 'password',

    level: '2',
    discipline: "Mechanical"
    )

Project.create(
    client: 'Xcel Energy',
    summary: 'Valve Automation',
    user: sidesantis
)

Project.create(
    client: 'PG&E',
    summary: 'Critical Docs',
    user: mwgood
)