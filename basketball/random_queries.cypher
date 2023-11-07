// Run the query found in initial_data.cypher and then continue
// with the following queries.

// get all the players
match (p:PLAYER) return p;

// Get the players with height > 2 and weight < 110
match(p:PLAYER) where p.height > 2 and p.weight < 110 return p;

// Get the first 5 players
match(p:PLAYER) 
return p 
limit 5;

// Skip the first 4 players and get the next 5 players
match(p:PLAYER) 
return p 
skip 4
limit 5;

// Get all players with height >= 2 and order in descending
match(p:PLAYER) 
where p.height >= 2
return p 
order by p.height desc;

// Get all players with height >=2 and coach Doc or Jason
match (p:PLAYER), (c:COACH) 
where p.height > 2 and (c.name = "Doc Rivers" or c.name = "Jason Kidd")
return p, c;

// Get coaches Doc or Jason
match (c:COACH) 
where c.name = "Doc Rivers" or c.name = "Jason Kidd"
return c;

// get all players that play on the lakers
match (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
where t.name = "LA Lakers"
return p, t;

// get all players that play on the lakers
match (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
where t.name = "LA Lakers"
return (p);

// get all players making more than 35000000
match (p:PLAYER) -[contract:PLAYS_FOR]-> (t:TEAM)
where contract.salary >= 35000000
return (p);

// quickly get all the possible relationships between two nodes
match (n:PLAYER)-[r]->(t:PLAYER)
return distinct(type(r));

// get all players that are on LeBron's team
match (p:PLAYER) -[sal:PLAYS_FOR]-> t.TEAM
with t
match (_p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
where _p.name = "LeBron James"
return p;

// SQL like common table expression
// Find all of Lebron's teammates that have a salary greater than 35,000,000
match (_p:PLAYER {name: "LeBron James"}) -[:PLAYS_FOR]-> (t:TEAM)
with t
match (p:PLAYER) -[sal:PLAYS_FOR]-> (t)
where p.name <> "LeBron James" and sal.salary > 35000000
return p, sal, t;

// See how many games the player has played 
match (p:PLAYER) -[gp:PLAYED_AGAINST]-> (t:TEAM)
return p, count(gp);

// Quickly see the properties of a relationship
match (p:PLAYER) -[gp:PLAYED_AGAINST]-> (t:TEAM)
return properties(gp) 
limit 1;

// get the average points the players have gotten a game and order by descending
match (p:PLAYER) -[gp:PLAYED_AGAINST]-> (t:TEAM)
return p, avg(gp.points) as avg_pts
order by avg_pts desc;

// Delete the player Ja Morant
// You need to detach all relationships and then you can delete
match (ja {name: "Ja Morant"}) 
detach delete (ja);

// Ja has been deleted 
match (n:PLAYER) 
where n.name = "Ja Morant"
return (n);

// Delete a relationship
match (j {name: "Joel Embiid"}) -[r:PLAYS_FOR]-> (t:TEAM)
delete r;

// Joel no longer plays for a team
match (j {name: "Joel Embiid"}) -[r:PLAYS_FOR]-> (t:TEAM)
return t;

// delete every node in the database
match (n)
detach delete n;

// everything is deleted 
match (n)
return n;

// lets create some nodes
create (lebron:PLAYER:COACH:GENERAL_MANAGER 
{name: "LeBron James", height: 2.01}
);

// We can create a node that has a relationship
create (:PLAYER {name: "Anthony Davis"}) -[:PLAYS_FOR {salary: 34}]-> (:TEAM {name: "LA Lakers"});

// We can check to see only Davis has a relationship
match (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
return p, t;

// Lets make a relationship between LeBron and the LA Lakers
match (p:PLAYER {name: "LeBron James"}), (t:TEAM {name: "LA Lakers"})
create (p) -[:PLAYS_FOR {salary: 44}]-> (t);

// Now we see that Davis and LeBron have a relationship
match (p:PLAYER) -[:PLAYS_FOR]-> (t:TEAM)
return p, t;

// Lets get the id of Anthony Davis
match (p:PLAYER {name: "Anthony Davis"})
return id(p);

// We can query by the ID
match (p:PLAYER)
where id(p) = 30
return p;

// We can use CTE with id's
match (p:PLAYER {name: "LeBron James"})
with id(p) as lebron_id
match (p:PLAYER)
where id(p) = lebron_id
return p;

// Lets update the LeBron James node and add a age
match (p:PLAYER {name: "LeBron James"})
with id(p) as lebron_id
match(lj:PLAYER)
where id(lj) = lebron_id
set lj.height = 2.02, lj.age = 36
return lj;

// We can add a label to LeBron
match (p:PLAYER {name: "LeBron James"})
with id(p) as lebron_id
match(lj:PLAYER)
where id(lj) = lebron_id
set lj:REF
return lj;

// Lets update LeBron's salary
match (p:PLAYER {name: "LeBron James"}) -[sal:PLAYS_FOR]-> (t:TEAM)
set sal.salary = 66
return p, sal, t;

// Lets remove some properties of LeBron
match (lj:PLAYER {name: "LeBron James"})
remove lj.age
return lj;

match (lj:PLAYER {name: "LeBron James"})
remove lj:REF
return lj;

// Finally, delete everything
match (n)
detach delete n;
