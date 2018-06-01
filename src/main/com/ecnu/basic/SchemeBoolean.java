package com.ecnu.basic;

public class SchemeBoolean extends SchemeToken<Boolean> {

    public SchemeBoolean(Boolean content)
    {
        this.content = content;
    }

    @Override
    public TokenType getType()
    {
        return TokenType.Boolean;
    }
}