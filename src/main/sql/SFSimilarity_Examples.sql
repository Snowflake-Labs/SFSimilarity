----------------------------
-- SFSIMILARITY Examples
-- Similarity and Distance Functions for Snowflake
----------------------------

-- Define some strings to compare
set s1='hyperspace';
set s2='cyberscape';


----------------------------
-- SIMILARITY FUNCTIONS
----------------------------

-- The Jaccard similarity, which captures the number of common characters (here a, c, e, p, r, s, y) divided by the number of all characters (here a, b, c, e, h, p, r, s, y), hence 7 / 9 = 0.777777...
SELECT JACCARDSIMILARITY($s1, $s2);

-- The Jaro-Winkler similarity, which takes into account both matching characters and transpositions correcting them with a scaling factor
SELECT JAROWINKLERSIMILARITY($s1, $s2);

-- The Longest Common Subsequence (LCS), which finds the longest sequence of characters (not necessarily adjacent), which in this case would be y, e, r, s, a, e of length 6
SELECT LONGESTCOMMONSUBSEQUENCE($s1, $s2);

-- The fuzzy score, a custom matching algorithm based on a specific locale (for lowercasing), where one point is given for every matched character and subsequent matches yield two bonus points; 
-- the second string is treated as a query on the first string, so long common character sequences get a higher score:
SELECT FUZZYSCORE($s1, $s2, 'ENGLISH');


----------------------------
-- TOKEN SIMILARITY
----------------------------
--The similarity measures we have seen so far can be used on any string because they are based on single characters; 
-- what if instead we want to measure the similarity between sentences, i.e. combinations of words (or tokens) separated by a delimiter such as whitespace? 
-- Although a string itself can be seen as a sequence of one-character tokens, tokens usually consist of few characters; 
-- therefore, a token distance will look at tokens as the base elements to compare

-- More strings to compare
set s3='string similarity';
set s4='string distance';

-- Cosine similarity, which works on vectors of tokens (along with their counts) by multiplying them using the dot product and dividing the result by the product of their norms
SELECT COSINESIMILARITY($s3, $s4);


----------------------------
-- STRING DISTANCE FUNCTIONS
----------------------------

-- Start with the well-known Levenshtein distance, which takes into account character additions, deletions and substitutions:

-- First try the built in Snowflake function EDITDISTANCE (Levenshtein Distance)
SELECT EDITDISTANCE($s1, $s2);

-- Try the SFSimilarity version of the same
SELECT LEVENSHTEINDISTANCE($s1, $s2);

-- The cosine distance, simply defined as 1 - cosine similarity. Building from the previous examples with s1 = "string similarity" and s2 = "string distance", where the cosine similarity were 0.5 and about 0.632 respectively, we will have a cosine distance of 0.5 and about 0.3 respectively: 
SELECT COSINEDISTANCE($s3, $s4);
SELECT COSINEDISTANCE($s3, ' string');

-- The Hamming distance, i.e. the number of different characters (which requires the strings to be compared to be of equal length):
SELECT HAMMINGDISTANCE($s1, $s2);

-- The Jaccard distance, defined as 1 - Jaccard similarity, hence 1 - 0.777777... = 0.222222...:
SELECT JACCARDDISTANCE($s1, $s2);

-- the Jaro-Winkler distance, defined as 1 - Jaro-Winkler similarity, hence it should be 1 - 0.825 = 0.175 but it is not at the moment (see https://issues.apache.org/jira/browse/TEXT-104):
SELECT JAROWINKLERDISTANCE($s1, $s2);

-- The longest common subsequence (LCS) distance, defined as the difference between the sum of the lengths of the compared strings minus twice their LCS similarity, hence 10 + 10 - 2 * 6 = 8:
SELECT LONGESTCOMMONSUBSEQUENCEDISTANCE($s1, $s2);
