match (n) detach delete n;

// Create 4 Experiment nodes
CREATE (exp1:Experiment {name: 'Experiment 1'}),
       (exp2:Experiment {name: 'Experiment 2'}),
       (exp3:Experiment {name: 'Experiment 3'}),
       (exp4:Experiment {name: 'Experiment 4'});

// Create 10 Component nodes with names
CREATE (comp1:Component {name: 'Component 1'}),
       (comp2:Component {name: 'Component 2'}),
       (comp3:Component {name: 'Component 3'}),
       (comp4:Component {name: 'Component 4'}),
       (comp5:Component {name: 'Component 5'}),
       (comp6:Component {name: 'Component 6'}),
       (comp7:Component {name: 'Component 7'}),
       (comp8:Component {name: 'Component 8'}),
       (comp9:Component {name: 'Component 9'}),
       (comp10:Component {name: 'Component 10'});

// Create relationships to represent component usage in experiments with a random time
MATCH (exp1:Experiment {name: 'Experiment 1'}),
      (comp1:Component {name: 'Component 1'}), (comp2:Component {name: 'Component 2'}), 
      (comp3:Component {name: 'Component 3'}), (comp4:Component {name: 'Component 4'}), 
      (comp5:Component {name: 'Component 5'})
WITH exp1, [comp1, comp2, comp3, comp4, comp5] AS components1
FOREACH (c IN components1 |
    CREATE (exp1)-[:USES {time: rand()}]->(c));

MATCH (exp2:Experiment {name: 'Experiment 2'}),
      (comp3:Component {name: 'Component 3'}), (comp5:Component {name: 'Component 5'}), 
      (comp7:Component {name: 'Component 7'}), (comp9:Component {name: 'Component 9'}), 
      (comp10:Component {name: 'Component 10'})
WITH exp2, [comp3, comp5, comp7, comp9, comp10] AS components2
FOREACH (c IN components2 |
    CREATE (exp2)-[:USES {time: rand()}]->(c));

MATCH (exp3:Experiment {name: 'Experiment 3'}),
      (comp2:Component {name: 'Component 2'}), (comp4:Component {name: 'Component 4'}), 
      (comp6:Component {name: 'Component 6'}), (comp8:Component {name: 'Component 8'}), 
      (comp10:Component {name: 'Component 10'})
WITH exp3, [comp2, comp4, comp6, comp8, comp10] AS components3
FOREACH (c IN components3 |
    CREATE (exp3)-[:USES {time: rand()}]->(c));

MATCH (exp4:Experiment {name: 'Experiment 4'}),
      (comp1:Component {name: 'Component 1'}), (comp3:Component {name: 'Component 3'}), 
      (comp5:Component {name: 'Component 5'}), (comp7:Component {name: 'Component 7'}), 
      (comp9:Component {name: 'Component 9'}), (comp10:Component {name: 'Component 10'})
WITH exp4, [comp1, comp3, comp5, comp7, comp9, comp10] AS components4
FOREACH (c IN components4 |
    CREATE (exp4)-[:USES {time: rand()}]->(c));
