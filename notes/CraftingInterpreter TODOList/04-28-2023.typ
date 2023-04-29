= *04/28/2023* _Scanning & Representing Code_

== Can Strings add Null in Java?

#link("https://docs.oracle.com/javase/specs/jls/se20/html/jls-15.html#jls-15.18.1")[The Java Language Specification] explains that when the + operator is used with a String and another object, the non-string operand is converted to a String using the toString() method.

If only one operand expression is of type String, then string conversion is performed on the other operand to produce a string at run time.

The result of string concatenation is a reference to a String object that is the concatenation of the two operand strings. The characters of the left-hand operand precede the characters of the right-hand operand in the newly created string.

The String object is newly created unless the expression is a constant expression.

== Non-Regular Lexical Grammars in Python and Haskell

The lexical grammars of Python and Haskell are not regular. What does that mean, and why aren’t they?

Regular grammars are a type of formal grammar that describe regular languages. Regular languages are those that can be recognized by finite-state automata, which are machines that have a fixed number of states and can only recognize patterns that can be expressed by a regular grammar.

The lexical grammar of a programming language defines the syntax of its elementary units or tokens, such as keywords, identifiers, literals, and operators. These tokens are then used by the language's syntactic grammar to define the syntax of its statements, expressions, and other constructs.

Python and Haskell are both programming languages that have lexical grammars thatThe reason why the lexical grammars of Python and Haskell are not regular is that they have features that require context-sensitive rules, such as nested comments, string interpolation, and indentation-based block delimiters. These features make the lexical analysis of these languages more complex than what can be expressed by a regular grammar.

In Python, for example, the use of whitespace for block delimiters means that the lexer needs to keep track of the indentation level of each line to determine the scope of each block. This requires a context-sensitive approach that cannot be expressed by a regular grammar.

In Haskell, the use of layout rules to delimit blocks also requires a context-sensitive lexer. Additionally, Haskell allows the use of Unicode characters in identifiers, which makes the lexer more complex than what can be expressed by a regular grammar.

Overall, the complexity of the lexical grammars of Python and Haskell is a reflection of the expressive power of these languages and the need for more sophisticated parsing techniques to handle their syntax.

```hs
  foo x = 
    if x > 0
    then x + 1
    else x - 1
```

In this code, the if, then, and else keywords are not explicitly delimited by braces or parentheses, but instead, their scope is determined by the layout of the code. The lexer needs to keep track of the indentation level to correctly recognize these keywords as tokens and determine their scope.

Another feature that makes the Haskell lexical grammar non-regular is its support for Unicode characters in identifiers. This means that identifiers can contain not only ASCII characters but also characters from other scripts, such as Greek, Cyrillic, or Arabic. This requires the lexer to handle a wider range of characters than what can be expressed by a regular grammar.

Finally, Haskell also supports string interpolation, where variables can be embedded in string literals. This means that the lexer needs to handle not only the usual string literals but also string literals that contain placeholders for variable values. This requires context-sensitive rules that cannot be expressed by a regular grammar.

Overall, the complex lexical grammar of Haskell is a reflection of the expressive power of the language and the need for more sophisticated parsing techniques to handle its syntax.

== Multiple Dispatch


Multiple Dispatch is a programming language feature that allows a method or function to be selected based on the runtime types of multiple arguments. In other words, when a function is called with multiple arguments, the system looks for the most specific function that matches the types of all the arguments, and then calls that function.

This is different from traditional single dispatch, where the system selects a method or function based on the type of a single receiver object. With multiple dispatch, the system can take into account the types of all the arguments, which allows for more flexible and expressive code.

For example, in a system with multiple dispatch, you could define a method that takes both a Circle and a Rectangle object as arguments, and then have the system automatically select the correct method to use based on the actual types of the objects passed in.

Multiple dispatch is a common feature in object-oriented programming languages such as Common Lisp and CLOS, as well as in functional programming languages such as Julia. It can also be implemented in other languages using techniques such as pattern matching and function overloading.

Here is a link to a reference article on multiple dispatch: 
#link("https://en.wikipedia.org/wiki/Multiple_dispatch")
