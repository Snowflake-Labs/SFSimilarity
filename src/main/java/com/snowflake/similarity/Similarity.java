package com.snowflake.similarity;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.text.similarity.CosineDistance;
import org.apache.commons.text.similarity.CosineSimilarity;
import org.apache.commons.text.similarity.FuzzyScore;
import org.apache.commons.text.similarity.HammingDistance;
import org.apache.commons.text.similarity.JaccardDistance;
import org.apache.commons.text.similarity.JaccardSimilarity;
import org.apache.commons.text.similarity.JaroWinklerDistance;
import org.apache.commons.text.similarity.JaroWinklerSimilarity;
import org.apache.commons.text.similarity.LevenshteinDistance;
import org.apache.commons.text.similarity.LongestCommonSubsequence;
import org.apache.commons.text.similarity.LongestCommonSubsequenceDistance;

public class Similarity {

    public static double cosineDistance(String left, String right) {

        CosineDistance cosine = new CosineDistance();
        Double result = cosine.apply(left, right);

        return result;
    }

    public static double cosineSimilarity(String left, String right) {

        Map<CharSequence, Integer> vector1 = new HashMap<>();
        Map<CharSequence, Integer> vector2 = new HashMap<>();

        for (String token : left.split(" ")) {
            vector1.put(token, vector1.getOrDefault(token, 0) + 1);
        }

        for (String token : right.split(" ")) {
            vector2.put(token, vector2.getOrDefault(token, 0) + 1);
        }

        CosineSimilarity cosine = new CosineSimilarity();
        Double result = cosine.cosineSimilarity(vector1, vector2);

        return result;
    }

    public static int fuzzyScore(String left, String right, String localeString) {

        Locale locale = new Locale(localeString);
        FuzzyScore fuzzy = new FuzzyScore(locale);
        Integer result = fuzzy.fuzzyScore(left, right);

        return result;
    }

    public static int hammingDistance(String left, String right) {

        HammingDistance hamming = new HammingDistance();
        Integer result = hamming.apply(left, right);

        return result;
    }

    public static double jaccardDistance(String left, String right) {

        JaccardDistance jaccard = new JaccardDistance();
        Double result = jaccard.apply(left, right);

        return result;
    }

    public static double jaccardSimilarity(String left, String right) {

        JaccardSimilarity jaccard = new JaccardSimilarity();
        Double result = jaccard.apply(left, right);

        return result;
    }

    public static double jaroWinklerDistance(String left, String right) {

        JaroWinklerDistance jaro = new JaroWinklerDistance();
        Double result = jaro.apply(left, right);

        return result;
    }

    public static double jaroWinklerSimilarity(String left, String right) {

        JaroWinklerSimilarity jaro = new JaroWinklerSimilarity();
        Double result = jaro.apply(left, right);

        return result;
    }

    public static int levenshteinDistance(String left, String right) {

        LevenshteinDistance levenshtein = new LevenshteinDistance();
        Integer result = levenshtein.apply(left, right);

        return result;
    }

    public static int longestCommonSubsequence(String left, String right) {

        LongestCommonSubsequence lcs = new LongestCommonSubsequence();
        Integer result = lcs.apply(left, right);

        return result;
    }

    public static int longestCommonSubsequenceDistance(String left, String right) {

        LongestCommonSubsequenceDistance lcs = new LongestCommonSubsequenceDistance();
        Integer result = lcs.apply(left, right);

        return result;
    }
}