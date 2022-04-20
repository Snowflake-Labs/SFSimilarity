-- Create UDFs for Snowflake Similarity

CREATE or REPLACE FUNCTION CosineDistance(left string, right string)
RETURNS float
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/commons-lang3-3.12.0.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.cosineDistance'
COMMENT = 'Measures the cosine distance between two character sequences.';

CREATE or REPLACE FUNCTION CosineSimilarity(left string, right string)
RETURNS float
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/commons-lang3-3.12.0.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.cosineDistance'
COMMENT = 'Measures the Cosine similarity of two vectors of an inner product space and compares the angle between them.';

CREATE or REPLACE FUNCTION FuzzyScore(left string, right string, locale string)
RETURNS integer
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.fuzzyScore'
COMMENT = 'A matching algorithm that is similar to the searching algorithms implemented in editors such as Sublime Text, TextMate, Atom and others.
One point is given for every matched character. Subsequent matches yield two bonus points. A higher score indicates a higher similarity.';

CREATE or REPLACE FUNCTION HammingDistance(left string, right string)
RETURNS integer
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.hammingDistance'
COMMENT = 'The hamming distance between two strings of equal length is the number of positions at which the corresponding symbols are different.';

CREATE or REPLACE FUNCTION JaccardDistance(left string, right string)
RETURNS float
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.jaccardDistance'
COMMENT = 'Measures the Jaccard distance of two sets of character sequence. Jaccard distance is the dissimilarity between two sets. It is the complementary of Jaccard similarity.';

CREATE or REPLACE FUNCTION JaccardSimilarity(left string, right string)
RETURNS float
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.jaccardSimilarity'
COMMENT = 'Measures the Jaccard similarity (aka Jaccard index) of two sets of character sequence. Jaccard similarity is the size of the intersection divided by the size of the union of the two sets.';

CREATE or REPLACE FUNCTION JaroWinklerDistance(left string, right string)
RETURNS float
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.jaroWinklerDistance'
COMMENT = 'Measures the Jaro-Winkler distance of two character sequences. It is the complementary of Jaro-Winkler similarity.';

CREATE or REPLACE FUNCTION JaroWinklerSimilarity(left string, right string)
RETURNS float
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/commons-lang3-3.12.0.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.jaroWinklerSimilarity'
COMMENT = 'A similarity algorithm indicating the percentage of matched characters between two character sequences. 
The Jaro measure is the weighted sum of percentage of matched characters from each file and transposed characters. Winkler increased this measure for matching initial characters.';

CREATE or REPLACE FUNCTION LevenshteinDistance(left string, right string)
RETURNS integer
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.levenshteinDistance'
COMMENT = 'An algorithm for measuring the difference between two character sequences.
This is the number of changes needed to change one sequence into another, where each change is a single character modification (deletion, insertion or substitution).';

CREATE or REPLACE FUNCTION LongestCommonSubsequence(left string, right string)
RETURNS integer
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.longestCommonSubsequence'
COMMENT = 'A similarity algorithm indicating the length of the longest common subsequence between two strings.
The Longest common subsequence algorithm returns the length of the longest subsequence that two strings have in common.';

CREATE or REPLACE FUNCTION LongestCommonSubsequenceDistance(left string, right string)
RETURNS integer
LANGUAGE java
IMPORTS = ('@SFSimilarity/commons-text-1.9.jar', '@SFSimilarity/sfsimilarity-1.0.jar')
HANDLER = 'com.snowflake.similarity.Similarity.longestCommonSubsequenceDistance'
COMMENT = 'An edit distance algorithm based on the length of the longest common subsequence between two strings.';
