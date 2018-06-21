package com.ecnu.utils;

import com.ecnu.process.Eval;

import java.util.ArrayList;
import java.util.Objects;

import static com.ecnu.primitive.primitive.scheme_truep;

public class SpecialForms {

    public static ArrayList special_form = new ArrayList();



    public static Object SPECIAL_FORMS(String first,  AbPair expressions, Frame env)
    {
        switch(first) {
            case "and":
                return do_and_form(expressions,env);
            case "begin":
                return do_begin_form(expressions,env);
            case "cond":
                break;
            case "define":
                break;
            case "if":
                break;
            case "lambda":
                break;
            case "let":
                break;
            case "or":
                break;
            case "quote":
                break;
            case  "define-macro":
                break;
        }
        return false;
    }

    private static Object do_and_form(AbPair expressions, Frame env){
        Object last = new Object();
        if (expressions instanceof nil)
            return true;
        while (! (expressions instanceof nil))
        {
            last = Eval.scheme_eval( (AbPair) expressions.getFirst(), env);
            if (! scheme_truep(last))
                return false;
            expressions = (AbPair)expressions.getSecond();
        }
        return last;
    }

    private static Object do_begin_form(AbPair expressions, Frame env){
        Eval.check_form(expressions,1,9999);
        return Eval.eval_all(expressions, env);
    }

//    private static Object do_cond_form(Pair expressions, Frame env){
//        Pair clause = new Pair();
//        while((AbPair)expressions != nil.getInstance())
//        {
//            clause = (Pair)expressions.getFirst();
//            Eval.check_form(clause, 1, 9999);
//            //TODO:先判断是不是string，直接下面这样可能会报错？
//            if (((Object)clause.getFirst()).equals("else"))
//            {
//                if(expressions.getSecond() == nil.getInstance())
//                {
//                    throw  new RuntimeException();
//                }
//            }
//            else
//                //if (scheme_truep(test))
//        }
//    }


}
