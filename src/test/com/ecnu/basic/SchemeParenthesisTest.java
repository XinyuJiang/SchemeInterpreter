package com.ecnu.basic;

import org.junit.Assert;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;

/**
 * SchemeParenthesis Tester.
 *
 * @author CaoZiyu
 * @version 1.0
 * @since <analyze>June 1, 2018</analyze>
 */
public class SchemeParenthesisTest {

    SchemeParenthesis parenthesis;
    @Before
    public void before() throws Exception {
        parenthesis = new SchemeParenthesis('(', 0);
    }

    @After
    public void after() throws Exception {
    }

    /**
     * Method: getType()
     */
    @Test
    public void testGetType() throws Exception {
        Assert.assertEquals(TokenType.Parenthesis, parenthesis.getType());
    }

    /**
     * Method: getContent()
     */
    @Test
    public void testGetContent() {
        Assert.assertEquals('(', parenthesis.getContent().charValue());
    }

} 