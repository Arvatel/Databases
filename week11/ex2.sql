-- 1. Return all middle/welter/light weight fighters (155, 170, 185) who at least have
-- one win and grouped by weight. 

MATCH (f1:Fighter)-[:BEAT]->(f2:Fighter)
WHERE f1.weight IN [155, 170, 185]
RETURN f1.weight, collect(f1.name) AS fighters

-- 2. Return fighters who had 1-1 record with each other. Use Count from the
-- aggregation functions. Pair repetitions is accepted. Expected two column response.
-- Hint: “MATCH (f:Fighter)-[b:beats]->(f2:Fighter) - [b2:beats] -> (f3:Fighter) …” this
-- part of the query might be useful. 

MATCH (f1:Fighter)-[:BEAT]->(f2:Fighter)<-[:BEAT]-(a:Fighter)
WHERE f1 <> a
WITH f1, a
ORDER BY f1.name, a.name
WITH collect(f1.name + ' vs. ' + a.name) AS pairs
WHERE size(pairs) > 0
RETURN pairs

-- 3. Return all fighters who has the greatest number of fights. 

MATCH (f:Fighter)-[:BEAT]->()
WITH f, count(*) AS N_Fights
ORDER BY N_Fights DESC LIMIT 1
RETURN f.name, N_Fights

-- 4. Return undefeated fighters (0 losses) and defeated fighters (0 wins). Expected
-- two rows response.

MATCH (f:Fighter)
WHERE NOT EXISTS((f)-[:BEAT]->())
RETURN f.name, 'undefeated' AS status
UNION ALL
MATCH (f:Fighter)-[:BEAT]->()
WHERE NOT EXISTS(()-[:BEAT]->(f))
RETURN f.name, 'defeated' AS status