= *05-02-2023* _Evaluating Expressions, Statements and State & Control Flow_

== Comparison between LL(\*) and Recursive Descent Parsing

In computer science, a recursive descent parser is a kind of top-down parser built from a set of mutually recursive procedures (or a non-recursive equivalent) where each such procedure implements one of the nonterminals of the grammar. Thus the structure of the resulting program closely mirrors that of the grammar it recognizes.

A predictive parser is a recursive descent parser that does not require backtracking. Predictive parsing is possible only for the class of LL(k) grammars, which are the context-free grammars for which there exists some positive integer k that allows a recursive descent parser to decide which production to use by examining only the next k tokens of input. The LL(k) grammars therefore exclude all ambiguous grammars, as well as all grammars that contain left recursion. Any context-free grammar can be transformed into an equivalent grammar that has no left recursion, but removal of left recursion does not always yield an LL(k) grammar. A predictive parser runs in linear time.

Recursive descent with backtracking is a technique that determines which production to use by trying each production in turn. Recursive descent with backtracking is not limited to LL(k) grammars, but is not guaranteed to terminate unless the grammar is LL(k). Even when they terminate, parsers that use recursive descent with backtracking may require exponential time.

Although predictive parsers are widely used, and are frequently chosen if writing a parser by hand, programmers often prefer to use a table-based parser produced by a parser generator,[citation needed] either for an LL(k) language or using an alternative parser, such as LALR or LR. This is particularly the case if a grammar is not in LL(k) form, as transforming the grammar to LL to make it suitable for predictive parsing is involved. Predictive parsers can also be automatically generated, using tools like ANTLR.

Predictive parsers can be depicted using transition diagrams for each non-terminal symbol where the edges between the initial and the final states are labelled by the symbols (terminals and non-terminals) of the right side of the production rule.

See also:

- #link("https://en.wikipedia.org/wiki/Parser_combinator")[Parser combinator] – a higher-order function used in combinatory parsing, a method of factoring recursive descent parser designs
- #link("https://en.wikipedia.org/wiki/Parsing_expression_grammar")[Parsing expression grammar] – another form representing recursive descent grammar
- #link("https://en.wikipedia.org/wiki/Recursive_ascent_parser")[Recursive ascent parser]
- #link("https://en.wikipedia.org/wiki/Tail_recursive_parser")[Tail recursive parser – a variant of the recursive descent parser]

== Database vs File system storage

When it comes to storing data, there are two main options: database and file system storage. Both have their own advantages and disadvantages, and choosing the right one depends on your specific needs.

File system storage is simple and easy to use, making it a popular choice for storing data. With file system storage, data is stored in files on a hard drive or other storage device. This method is suitable for small datasets and is easy to set up and manage. However, as the amount of data increases, file system storage can become difficult to manage and inefficient.

On the other hand, databases are designed to handle large amounts of data efficiently. Databases provide a structured way to store data, making it easier to search, retrieve, and manipulate. Databases also provide mechanisms for ensuring data consistency and integrity, which is important for applications that require strong data reliability.

One disadvantage of using databases is that they can be more complex to set up and manage than file system storage. Additionally, databases can be slower than file system storage for certain types of operations, such as reading or writing large files.

In summary, the choice between database and file system storage depends on the specific needs of your application. If you need to store a large amount of structured data, a database is the way to go. However, for smaller datasets or simple storage needs, file system storage can be a good option.

== ACID in MongoDB

#link("https://www.mongodb.com/")[MongoDB] is a popular NoSQL document database that is known for its flexibility, scalability, and performance. However, unlike traditional relational databases, MongoDB is not ACID compliant by default.

ACID is a set of properties that ensure data reliability, consistency, and integrity in a database. These properties are essential for applications that require strong data consistency, such as financial transactions or inventory management systems.

MongoDB uses a data model called BSON (Binary JSON), which allows for flexible and dynamic schemas. While this provides many benefits, it also sacrifices some of the ACID properties, such as consistency and isolation, in favor of performance and scalability.

However, MongoDB does provide support for ACID-like properties through the use of multi-document transactions. With multi-document transactions, it is possible to execute multiple write operations across multiple documents as a single, atomic transaction. This provides some level of consistency and isolation, but it is not the same as full ACID compliance.

Whether or not MongoDB is appropriate for a particular application depends on the specific requirements of that application. For applications that require full ACID compliance, a traditional relational database may be a better choice. However, for applications that prioritize scalability and performance over strict data consistency, MongoDB can be a powerful and flexible choice.
