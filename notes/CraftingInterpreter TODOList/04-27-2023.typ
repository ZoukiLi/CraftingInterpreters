= *04/27/2023* _The Lox Language_

== Inner Class and Local Class in Java

A local class has access to the members of its enclosing
class. In the previous example, the PhoneNumber constructor accesses the member LocalClassExample.regularExpression.

In addition, a local class has access to local variables. However, a local class can only access local variables that are declared final. When a local class accesses a local variable or parameter of the enclosing block, it captures that variable or parameter. For example, the PhoneNumber constructor can access the local variable numberLength because it is declared final; numberLength is a captured variable.

However, starting in Java SE 8, a local class can access local variables and
parameters of the enclosing block that are final or effectively final. A variable or parameter whose value is never changed after it is initialized is effectively final. For example, suppose that the variable numberLength is not declared final, and you add the highlighted assignment statement in the PhoneNumber constructor to change the length of a valid phone number to 7 digits:

```java
  PhoneNumber(String phoneNumber) {
      numberLength = 7;
      String currentNumber = phoneNumber.replaceAll(
          regularExpression, "");
      if (currentNumber.length() == numberLength)
          formattedPhoneNumber = currentNumber;
      else
          formattedPhoneNumber = null;
  }
```

Because of this assignment
statement, the variable numberLength is not effectively final anymore. As a result, the Java compiler generates an error message similar to
"*local variables referenced from an inner class must be final or effectively final*" where the inner class PhoneNumber tries to access the numberLength variable:

```java
  if (currentNumber.length() == numberLength)
```

Starting in Java SE 8, if you declare the local class in a method, it can access the method's parameters. For example, you can define the following method in the PhoneNumber local class:

```java
  public void printOriginalNumbers() {
      System.out.println("Original numbers are " + phoneNumber1 +
          " and " + phoneNumber2);
  }
```

The method printOriginalNumbers accesses the parameters phoneNumber1 and phoneNumber2 of the method validatePhoneNumber.


== Lambda Expression and "Effective Final" in Java


```java
  public Supplier<Integer> getCounter() {
      // var counter = 0;
      AtomicInteger counter = new AtomicInteger(0);
      return () -> {
          // counter++;
          counter.incrementAndGet();
          return counter.get();
      };
  }
```

This is a method in Java that returns a Supplier object, which is essentially a functional interface that represents a supplier of results. In this case, the supplier returns an Integer value that represents a counter.

The method creates an AtomicInteger object with an initial value of 0, which is thread-safe and can be accessed and modified by multiple threads concurrently without the need for explicit synchronization. The method then returns a lambda expression that increments the AtomicInteger object and returns its current value.

This method is useful in scenarios where you need a simple counter that can be accessed and incremented by multiple threads concurrently, without the need for explicit synchronization. For example, in a multithreaded application where you want to keep track of the number of requests processed by a server, you can use this method to create a counter that can be accessed and incremented by multiple threads safely.

== Keyword `this` in JavaScript 

A function's this keyword behaves a little differently in JavaScript compared to other languages. It also has some differences between strict mode and non-strict mode.

In most cases, the value of this is determined by how a function is called (runtime binding). It can't be set by assignment during execution, and it may be different each time the function is called. The `bind()` method can set the value of a function's this regardless of how it's called, and arrow functions don't provide their own `this` binding (it retains the `this` value of the enclosing lexical context).

#link("https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this")

== Keyword `super` Comparison in JavaScript, Python, Java, and Lox

- *JS* #link("https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/super")

- *Python* #link("https://docs.python.org/3/library/functions.html#super") \
For practical suggestions on how to design cooperative classes using `super()`, see guide to using #link("https://rhettinger.wordpress.com/2011/05/26/super-considered-super/")[`super()`]

- *Java* #link("https://docs.oracle.com/javase/tutorial/java/IandI/super.html")

- *Lox* 

```js
  class A1 {
      f() {
          print "A1: f.";
      }
  }
  
  class A2 < A1 {
      init() {
          this.f();
      }
  }
  
  class A3 < A2 {
      init() {
          this.f = this.g;
          super.init();
      }
  
      g() {
          print "A3: g.";
      }
  }
  
  A3();
```

Will generate the following output:

```commands-builtin-shell-bash
❯ ../clox super_method.lox
A3: g.
```
