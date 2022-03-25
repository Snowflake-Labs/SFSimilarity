package com.snowflake.similarity;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * Unit tests for Snowflake similarity
 */
public class SimilarityTest 
{

    /**
     * Cosine Distance Tests
     */
    @Test
    public void cosineDistanceTest()
    {
        // These should match perfectly
        assertEquals(0, (int) Similarity.cosineDistance("foo", "foo"));

        // And this one off by 1
        assertEquals(1, (int) Similarity.cosineDistance("foo", "boo"));
    }

    /**
     * Cosine Similarity Tests
     */
    @Test
    public void cosineSimilarityTest()
    {
        // These should match perfectly
        assertEquals(1, (int) Similarity.cosineSimilarity("foo", "foo"));
    }

    /**
     * Fuzzy score is locale dependent
     */
    @Test
    public void fuzzyScoreTests()
    {
        // These should match 
        assertEquals(7, Similarity.fuzzyScore("foo", "foo", "en-US"));

        // These not so much 
        assertEquals(0, Similarity.fuzzyScore("foo", "boo", "en-US"));
    }

    /**
     * Hamming Tests - note strings have to be same length
     */
    @Test
    public void hammingTestss()
    {
        // These should match perfectly
        assertEquals(0, Similarity.hammingDistance("foo", "foo"));

        // And this one off by 1
        assertEquals(1, Similarity.hammingDistance("foo", "boo"));
    }

    /**
     * Jaccard Distance Tests
     */
    @Test
    public void jaccardDistanceTests()
    {
        // These should match perfectly
        assertEquals(0, (int) Similarity.jaccardDistance("foo", "foo"));
    }

    /**
     * Jaccard Similarity Tests
     */
    @Test
    public void jaccardSimilarityTests()
    {
        // These should match perfectly
        assertEquals(1, (int) Similarity.jaccardSimilarity("foo", "foo"));
    }

    /**
     * Jaro Winkler Distance Tests
     */
    @Test
    public void jaroWinklerDistanceTests()
    {
        // These should match perfectly
        assertEquals(1, (int) Similarity.jaroWinklerDistance("foo", "foo"));
    }

    /**
     * Jaro Winkler Similarity Tests
     */
    @Test
    public void jaroWinklerSimilarityTests()
    {
        // These should match perfectly
        assertEquals(1, (int) Similarity.jaroWinklerSimilarity("foo", "foo"));
    }

    /**
     * Levenshtein Tests
     */
    @Test
    public void levenshteinTest()
    {
        // These should match perfectly
        assertEquals(0, Similarity.levenshteinDistance("foo", "foo"));

        // And this one off by 1
        assertEquals(1, Similarity.levenshteinDistance("foo", "boo"));
    }

    /**
     * Longest Common Subsequence Tests
     */
    @Test
    public void longestCommonSubsequenceTests()
    {
        // These should match perfectly the full length
        assertEquals(3, Similarity.longestCommonSubsequence("foo", "foo"));

        // And this one just 2 of the chars match in order
        assertEquals(2, Similarity.longestCommonSubsequence("foo", "boo"));
    }

    /**
     * Longest Common Subsequence Distance Tests
     */
    @Test
    public void longestCommonSubsequenceDistanceTests()
    {
        // These should match perfectly with 0 difference
        assertEquals(0, Similarity.longestCommonSubsequenceDistance("foo", "foo"));

        // And this one should be 2
        assertEquals(2, Similarity.longestCommonSubsequenceDistance("foo", "boo"));
    }

}
