# SFSimilarity

## Similarity and Distance functions for Snowflake
Various different mechanisms of calculating "similarity scores" as well as "edit distances between Strings. Note, the difference between a "similarity score" and a "distance function" is that a distance functions meets the following qualifications:

- d(x,y) >= 0, non-negativity or separation axiom 
- d(x,y) == 0, if and only if, x == y 
- d(x,y) == d(y,x), symmetry, and 
- d(x,z) <= d(x,y) + d(y,z), the triangle inequality 

Whereas a "similarity score" need not satisfy all such properties. Though, it is fairly easy to "normalize" a similarity score to manufacture an "edit distance."  

The list of "edit distances" that we currently support follow:
- Cosine Distance,
- Hamming Distance,
- Jaccard Distance,
- Jaro Winkler Distance,
- Levenshtein Distance,
- Longest Common Subsequence Distance,

and the list of "similarity scores" that we support follows:
- Cosine Similarity,
- Fuzzy Score Similarity,
- Jaccard Similarity,
- Jaro-Winkler Similarity, and
- Longest Common Subsequence Similarity.

Underlying package java docs:
https://commons.apache.org/proper/commons-text/userguide.html

A good walkthrough of the algorithms with examples:
https://apothem.blog/apache-commons-text.html#string-similarity

### Installation: 

Before creating the UDFs in Snowflake you need to upload the `sfsimilarity-1.0.jar`, `commons-lang3-3.12.0.jar` and `commons-text-1.9.jar`, download the binaries from the [Latest Release](/releases).

[Create a stage](https://docs.snowflake.com/en/sql-reference/sql/create-stage.html) (or use an existing one) in Snowflake.

To load the Jars to a Snowflake stage (for example @udfstage) using Snowsql:
```
put file:///Users/me/Documents/sfsimilarity/sfsimilarity-1.0.jar @udfstage/ AUTO_COMPRESS = FALSE OVERWRITE = TRUE;
put file:///Users/me/Documents/sfsimilarity/commons-lang3-3.12.0.jar @udfstage/ AUTO_COMPRESS = FALSE OVERWRITE = TRUE;
put file:///Users/me/Documents/sfsimilarity/commons-text-1.9.jar @udfstage/ AUTO_COMPRESS = FALSE OVERWRITE = TRUE;
````

Create the UDFs using the SQL from the source code in sfsimilarity/src/main/sql/SnowflakeSimilarity.sql

### Compiling from source: 
Clone this repository, then

Build the jar for the UDF functions using Maven:
```
mvn package
```

