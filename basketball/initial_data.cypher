match (n)
detach delete (n);

// Create the basketball database
// Source found here: 
// https://github.com/harblaith7/Neo4j-Crash-Course/blob/main/01-initial-data.cypher

CREATE 
(russell:PLAYER{name:"Russell Westbrook", age: 33, number: 0, height: 1.91, weight: 91}),
(lebron:PLAYER{name:"LeBron James", age: 36, number: 6, height: 2.06, weight: 113}),
(anthony:PLAYER{name:"Anthony Davis", age: 28, number: 23, height: 2.08, weight: 115}),
(ja:PLAYER{name:"Ja Morant", age: 22, number: 12, height: 1.91, weight: 79}),
(luka:PLAYER{name:"Luka Doncic", age: 22, number: 77, height: 2.01, weight: 104}),
(kristaps:PLAYER{name:"Kristaps Porzingis", age: 26, number: 6, height: 2.21, weight: 109}),
(kevin:PLAYER{name:"Kevin Durant", age: 33, number: 7, height: 2.08, weight: 109}),
(james:PLAYER{name:"James Harden", age: 32, number: 13, height: 1.96, weight: 100}),
(giannis:PLAYER{name:"Giannis Antetokounmpo", age: 26, number: 34, height: 2.11, weight: 110}),
(khris:PLAYER{name:"Khris Middleton", age: 30, number: 22, height: 2.01, weight: 100}),	
(joel:PLAYER{name:"Joel Embiid", age: 27, number: 21, height: 2.13, weight: 127}),	
(tobias:PLAYER{name:"Tobias Harris", age: 29, number: 22, height: 2.03, weight: 100}),

(frank:COACH{name: "Frank Vogel"}),
(taylor:COACH{name: "Taylor Jenkins"}),
(jason:COACH{name: "Jason Kidd"}),
(steve:COACH{name: "Steve Nash"}),
(mike:COACH{name: "Mike Budenholzer"}),
(doc:COACH{name: "Doc Rivers"}),
(stan:COACH{name: "Stan Van Gundy"}),

(lakers:TEAM{name:"LA Lakers"}),
(memphis:TEAM{name:"Memphis Grizzlies"}),
(mavericks:TEAM{name:"Dallas Mavericks"}),
(nets:TEAM{name:"Brooklyn Nets"}),
(bucks:TEAM{name:"Milwaukee Bucks"}),
(sixers:TEAM{name:"Philadelphia 76ers"}),
 
(lebron)-[:TEAMMATES]-> (russell),
(lebron)<-[:TEAMMATES]- (russell),
(lebron)-[:TEAMMATES]-> (anthony),
(lebron)<-[:TEAMMATES]- (anthony),
(russell)-[:TEAMMATES]-> (anthony),
(russell)<-[:TEAMMATES]- (anthony),
(luka)-[:TEAMMATES]-> (kristaps),
(luka)<-[:TEAMMATES]- (kristaps),
(kevin)-[:TEAMMATES]-> (james),
(kevin)<-[:TEAMMATES]- (james),
(giannis)-[:TEAMMATES]-> (khris),
(giannis)<-[:TEAMMATES]- (khris),
(joel)-[:TEAMMATES]-> (tobias),
(joel)<-[:TEAMMATES]- (tobias),

(frank)-[:COACHES]->(lebron),
(frank)-[:COACHES]->(anthony),
(frank)-[:COACHES]->(russell),
(taylor)-[:COACHES]->(ja),
(jason)-[:COACHES]->(luka),
(jason)-[:COACHES]->(kristaps),
(steve)-[:COACHES]->(kevin),
(steve)-[:COACHES]->(james),
(mike)-[:COACHES]->(giannis),
(mike)-[:COACHES]->(khris),
(doc)-[:COACHES]->(tobias),
(doc)-[:COACHES]->(joel),

(lebron)-[:PLAYS_FOR {salary: 40000000}]-> (lakers),
(russell)-[:PLAYS_FOR {salary: 33000000}]-> (lakers),
(anthony)-[:PLAYS_FOR {salary: 38000000}]-> (lakers),
(ja)-[:PLAYS_FOR {salary: 8000000}]-> (memphis),
(luka)-[:PLAYS_FOR {salary: 50000000}]-> (mavericks),
(kristaps)-[:PLAYS_FOR {salary: 26000000}]-> (mavericks),
(kevin)-[:PLAYS_FOR {salary: 45000000}]-> (nets),
(james)-[:PLAYS_FOR{salary: 4200000}]-> (nets),
(giannis)-[:PLAYS_FOR {salary: 47000000}]-> (bucks),
(khris)-[:PLAYS_FOR {salary: 43000000}]-> (bucks),
(joel)-[:PLAYS_FOR {salary: 4000000}]-> (sixers),
(tobias)-[:PLAYS_FOR {salary: 4000000}]-> (sixers),

(frank)-[:COACHES_FOR]->(lakers),
(taylor)-[:COACHES_FOR]->(memphis),
(jason)-[:COACHES_FOR]->(mavericks),
(steve)-[:COACHES_FOR]->(nets),
(mike)-[:COACHES_FOR]->(bucks),
(doc)-[:COACHES_FOR]->(sixers),


(lebron)-[:PLAYED_AGAINST {minutes: 38, points: 32, assists: 6, rebounds: 6, turnovers: 2}]-> (memphis),
(russell)-[:PLAYED_AGAINST {minutes: 29, points: 16, assists: 12, rebounds: 11, turnovers: 16}]-> (memphis),
(anthony)-[:PLAYED_AGAINST {minutes: 36, points: 27, assists: 2, rebounds: 8, turnovers: 1}]-> (memphis),
(ja)-[:PLAYED_AGAINST {minutes: 43, points: 42, assists: 7, rebounds: 8, turnovers: 4}]-> (lakers),

(lebron)-[:PLAYED_AGAINST {minutes: 23, points: 25, assists: 12, rebounds: 3, turnovers: 0}]-> (memphis),
(russell)-[:PLAYED_AGAINST {minutes: 20, points: 11, assists: 10, rebounds: 3, turnovers: 8}]-> (memphis),
(anthony)-[:PLAYED_AGAINST {minutes: 30, points: 22, assists: 2, rebounds: 8, turnovers: 1}]-> (memphis),
(ja)-[:PLAYED_AGAINST {minutes: 35, points: 35, assists: 3, rebounds: 4, turnovers: 2}]-> (lakers),

(lebron)-[:PLAYED_AGAINST {minutes: 32, points: 18, assists: 3, rebounds: 6, turnovers: 1}]-> (nets),
(russell)-[:PLAYED_AGAINST {minutes: 26, points: 26, assists: 11, rebounds: 13, turnovers: 6}]-> (nets),
(anthony)-[:PLAYED_AGAINST {minutes: 30, points: 26, assists: 7, rebounds: 18, turnovers: 3}]-> (nets),
(kevin)-[:PLAYED_AGAINST {minutes: 43, points: 45, assists: 5, rebounds: 8, turnovers: 2}]-> (lakers),
(james)-[:PLAYED_AGAINST {minutes: 46, points: 35, assists: 13, rebounds: 4, turnovers: 7}]-> (lakers),

(kevin)-[:PLAYED_AGAINST {minutes: 34, points: 37, assists: 2, rebounds: 12, turnovers: 1}]-> (memphis),
(james)-[:PLAYED_AGAINST {minutes: 46, points: 35, assists: 13, rebounds: 4, turnovers: 7}]-> (memphis),
(ja)-[:PLAYED_AGAINST {minutes: 26, points: 32, assists: 13, rebounds: 6, turnovers: 2}]-> (nets),


(luka)-[:PLAYED_AGAINST {minutes: 44, points: 23, assists: 7, rebounds: 13, turnovers: 8}]-> (bucks),
(kristaps)-[:PLAYED_AGAINST {minutes: 24, points: 16, assists: 2, rebounds: 12, turnovers: 0}]-> (bucks),
(giannis)-[:PLAYED_AGAINST {minutes: 33, points: 26, assists: 16, rebounds: 18, turnovers: 5}]-> (mavericks),
(khris)-[:PLAYED_AGAINST {minutes: 46, points: 35, assists: 3, rebounds: 4, turnovers: 3}]-> (mavericks),

(luka)-[:PLAYED_AGAINST {minutes: 33, points: 28, assists: 6, rebounds: 3, turnovers: 3}]-> (sixers),
(kristaps)-[:PLAYED_AGAINST {minutes: 24, points: 18, assists: 4, rebounds: 11, turnovers: 1}]-> (sixers),
(joel)-[:PLAYED_AGAINST {minutes: 25, points: 29, assists: 7, rebounds: 22, turnovers: 2}]-> (mavericks),
(tobias)-[:PLAYED_AGAINST {minutes: 34, points: 18, assists: 13, rebounds: 4, turnovers: 0}]-> (mavericks),

(giannis)-[:PLAYED_AGAINST {minutes: 45, points: 36, assists: 5, rebounds: 12, turnovers: 3}]-> (sixers),
(khris)-[:PLAYED_AGAINST {minutes: 35, points: 22, assists: 5, rebounds: 6, turnovers: 0}]-> (sixers),
(joel)-[:PLAYED_AGAINST {minutes: 33, points: 23, assists: 3, rebounds: 10, turnovers: 3}]-> (bucks),
(tobias)-[:PLAYED_AGAINST {minutes: 38, points: 23, assists: 4, rebounds: 5, turnovers: 1}]-> (bucks),

(kevin)-[:PLAYED_AGAINST {minutes: 29, points: 28, assists: 6, rebounds: 8, turnovers: 0}]-> (mavericks),
(james)-[:PLAYED_AGAINST {minutes: 35, points: 17, assists: 10, rebounds: 8, turnovers: 5}]-> (mavericks),
(luka)-[:PLAYED_AGAINST {minutes: 37, points: 35, assists: 6, rebounds: 11, turnovers: 4}]-> (nets),
(kristaps)-[:PLAYED_AGAINST {minutes: 34, points: 27, assists: 4, rebounds: 8, turnovers: 0}]-> (nets),

(lebron)-[:PLAYED_AGAINST {minutes: 32, points: 27, assists: 12, rebounds: 10, turnovers: 4}]-> (sixers),
(russell)-[:PLAYED_AGAINST {minutes: 25, points: 19, assists: 9, rebounds: 14, turnovers: 5}]-> (sixers),
(anthony)-[:PLAYED_AGAINST {minutes: 32, points: 22, assists: 7, rebounds: 12, turnovers: 2}]-> (sixers),
(joel)-[:PLAYED_AGAINST {minutes: 36, points: 36, assists: 7, rebounds: 12, turnovers: 0}]-> (lakers),
(tobias)-[:PLAYED_AGAINST {minutes: 32, points: 22, assists: 1, rebounds: 7, turnovers: 0}]-> (lakers);
