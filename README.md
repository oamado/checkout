## Checkout system

### How to run?

Open a terminal in the directory an run the example:

```bash
ruby demo.rb
```

Feel free to edit the rules and the scan process to see how it works.

### How to run tests?

Open a terminal in the directory an run:

```bash
rspec specs/
```


### Thought process

In order to make an flexible system for more types of promotions I decided to create
a class per promotion type. It means single responsibility.

Also, the Checkout class doesn't handle the logic that calculates the prices per item.
This is a responsibility of the rule classes.

I added a factory class. Its unique responsibility is to build the correct rule price class
depending of the type. In the future if there are a lot of rules classes it will be
easier and more readable using this factory.

The Checkout class has a dependency injection, when it receives the rules in the
constructor.


Additionally, I added an AbstractPriceRule, this is not mandatory for Ruby, but I think
if this code will be modified for other developers and they forget to add the method
calculate_price it can help to show them a verbose error.
