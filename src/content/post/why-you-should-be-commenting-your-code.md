---
title: Why You Should Be Commenting Your Code
date: 2022-04-22
image: /images/code-comments.jpg
_build:
  list: false
summary: Many developers shun inline comments because they don't understand when and where they are useful. They are missing out on incredible value. 
tags:
  - Best Practices
  - Development
  - Documentation
  - PHP
---

> "A developer's job isn't done until the code is properly covered by unit tests, peer reviewed, and documented."
{ .big }

Most candidates I have interviewed for developer positions have enthusiastically agreed with the statement above. Of course, most of them were also lying. 

We developers, like most humans, are fundamentally reward-driven. As long as we can get away with it, we will always choose to skip the boring stuff and go straight to the interesting part. For most developers, coding is definitely more rewarding than testing, reviewing, or –god forbid– _documenting_. So I'm not surprised these activities receive less attention. 

To make matters worse, writing proper, discrete technical documentation is not for everyone. It can take a lot of time, requires good written expression skills, and writing for humans can be frustrating for people who are used to writing for computers. I totally understand why most developers don't enjoy it. And admittedly, for many projects, it's probably not even worth the time. 

Inline comments, however, are a whole different story. To this day, I'm still amazed by how much developers will go out of their way to avoid them, even though they provide incredible value for a ridiculously small investment.

## Inline comments are more valuable than you think

According to my experience, most developers don't understand the value of good comments, simply because they aren't used to seeing them. Many developers don't understand how to write good comments and where and when they are valuable, so they tend to write low-quality comments or no comments at all. This provides a bad example to other developers, who will go on to reproduce this bad practice, further spreading both bad comments and the general perception that comments are generally worthless.

Since no one wants to invest time in pointless activities, developers will find any excuse to avoid writing comments when asked to do so. One of the most common is this particularly well-known sophism: 

_"The best documentation is no documentation: code should be self-explanatory."_

Of course, we can all agree that writing clear and readable code is very important and an excellent practice – I certainly recommend it. But even the most clear and readable code can hardly be "self-explanatory". It's always missing a critical piece of information: **context**.

## Code only tells a part of the story

Be honest and tell me this has never happened to you: you had to debug a piece of code that you had written some time ago, but you found yourself scratching your head, unable to remember why you implemented it in that specific way. What made perfect sense in the past, now seemed weird and convoluted. You just couldn't remember what was supposed to happen when the parameter `resolveParameters` was set to `false`. Yes, it is clear that setting it to false means it won't "resolve parameters". That is _self-explanatory_. But what does it mean, not to "resolve parameters"? What happens exactly when parameters are not resolved? Somewhere in your mind you knew, you were certain, but you just couldn't remember. So you ended up spending an hour browsing your own code before you were able to understand. If only you had written that down somewhere...

No matter how high level and verbose your language of choice is, how well-chosen your variable names are, how domain-oriented your architecture is, **programs still are instructions written in computer-speak**, meant to guide a computer into performing a task. They will never be fully self-documenting, not only because developers are not computers (at least not for now), but because code describes **how** to perform a task, but not **why** it has to be performed, **the context** in which it is expected to be performed, the **side effects** of performing it, and **the reasons** behind that specific implementation.

This is where the value of good documentation kicks in. Code only tells a part of the story: the instructions to perform a task. Documentation is there to fill in the gaps and draw the full picture. Without it, contextual information is lost, and once the original developer has forgotten about it (or left the company), it's gone. You can still attempt to get some of it back through the unreliable, time-consuming art of reverse-engineering... as long as you have the time, the skills, and all the code at your disposal.

Yes, most projects don't need a full-blown discrete technical documentation. But good inline comments can provide the right amount of documentation that will help you and your project. 

Let's see are some concrete examples now.

## Describing your components

One of the things I'm very insistent about in code review is having every single class described in a Docblock header. A simple, concise description requires little effort to write, but provides numerous benefits. In fact, the more complex or abstract the concept behind a class is, the greater the benefits of having a good class description. 

The most obvious reason to describe your component is to help developers understand what its purpose is (and optionally, how to use it), without having to resort to guesswork or code reverse-engineering. 

This is helpful for developers working with your component, but I also find it extremely useful to remove cognitive friction when performing code review: having understood the author's intent, the reviewer can focus on analyzing the implementation, instead of wasting time trying figure out what the author was going for.

In general, a good description should be limited to stating the class's purpose or "responsibility". Keep it short: one or two lines should be more than enough. If you want to provide usage instructions, you can do it below the description, but never _instead_ of it. A well-designed component should be usable in black-box mode, without ever requiring any knowledge about how it works internally. A good description should never dwell into the details of its implementation. You can always add that information inside the class' body, if needed. 

Take this example:

```php
class Division
{
    /* ... */
}
```

What is the purpose of this class? Does it describe a division within a company or army? Perhaps a group of teams in a soccer league? Or is a separator between two components on an interface? We can't know without looking at the class' code.

A good description makes it outright clear:

```php
/**
 * Computes the division between two decimal numbers.
 */
class Division
{
   /* ... */
}
```

Most IDEs provide pop-up information about components on hover. By adding a description in the class Docblock header, a developer seeing the component in use won't even need to open up the component's file to understand it: they only need to hover on the component's name and see its description pop up.

### It's useful for you, too

Good descriptions not only help others, they can also help *you*. Writing a description before you start implementing a class is a wonderful [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging) design exercise. The simple task of putting the class' responsibility into words helps clarify its responsibility, and even find better class names. 

Here is an example of how adding description headers can help you shape your code for the better. Let's say I have a form with user profile information whose data I need to manage. For that, I created this class:

```php
/**
 * Manages users' data
 */
class UserDataManger
{
   /* ... */
}
```

A "UserDataManager". It manages users' data all right... but the class name and description don't feel quite right. A class with a single, well-understood responsibility should be easily described in one single phrase. In this case I managed to pull up a simple phrase, but it feels a little vague. This is usually a telling sign that the class' responsibility is not clear enough to me. 

One of the techniques I use to help me write good descriptions is keep an eye out for meaningless keywords and expressions like "manage", "handle", or "data", because they are generic terms that usually hide important details. And as we all know, the devil hides in the details. _"Manages users' data"_ can mean a lot of things. Does it validate the data? What data? Or does it save it? Maybe retrieve it? From where? A good description is informative, precise, and unequivocal: **"Validates, saves and retrieves user profile information from database"** seems a much better choice.

Okay, now we're getting somewhere, but we're not quite done. Whenever a description is too long, or if it contains the word "and", it usually means that the class has [too many responsibilities](https://en.wikipedia.org/wiki/Single-responsibility_principle) and needs to be redesigned. According to that description, the class clearly does too many things. If I cut the validation part out into an independent `Validator`, we end up with a more clearly-trimmed scope: **"Saves and retrieves user profile information from database"**. This description still contains the word "and", but it automatically makes me think of a common pattern: _repository_. So I can now rename the class and describe it accordingly:

```php
/**
 * Contains profile information for all users
 */
class UserProfileRepository
{
   /* ... */
}
```

In short, putting a class' responsibility in words helps _you_ make sure that your code is well-designed, and _others_ understand what you meant it to do in the first place.

## Describing class members

Another part that is often overlooked from documentation class members like attributes and functions. I personally suggest documenting _everything_, including private members. But if you need to choose, public class members are the ones that should be documented first – these constitute the public API others will be most in contact with.

Many people in the PHP world seem to believe that the main utility of Phpdoc headers was to enable type hints for parameters and return values, back in the day when these weren't supported by the language itself. Now that PHP supports type hints everywhere, they argue, they are useless and should be removed. This is far from true.

The primary purpose of Docblocks is not type hinting, but _description_. Similarly to class descriptions, well-described class members help developers understand how the component works and how to use it properly. A well-designed component shouldn't require developers to reverse-engineer its source code to understand how it works. For developers using an IDE, good documentation allows them to get the information they need to understand your components without having to inspect their code.

Let's see an example. Take this simple public method:

```php
public function addStrings(
    string $number1,
    string $number2,
    bool $fractional = false
): string
```

Just by reading its signature, you can have a general idea of what it does... or _can_ you? It adds two strings, for sure. But what does that mean, precisely? Does it concatenate or perform an addition? And what is that `$fractional` flag for? Without any comments, you'd _need_ to read the source code to answer those questions, and understand how to use this method. _"Read the f-ing code"_ is never the answer.

Now, by adding a little text, this becomes a lot clearer:

```php
/**
  * Performs addition of two decimal numbers.
  *
  * @param string $number1 Base number as a string
  * @param string $number2 The addend number as a string
  * @param bool $fractional [default=false]
  *   If true, the numbers will be interpreted as the fractional part of 
  *   a number (padded with trailing zeroes).
  *   Otherwise, they will be interpreted as the integer part
  *   (padded with leading zeroes).
  *
  * @return string The result of the addition.
  * 
  * @throws NotANumberException if one of the numbers cannot be interpreted 
  *   as a decimal number.
  */
public function addStrings(
    string $number1,
    string $number2,
    bool $fractional = false
): string
```

In the example above, we're describing the method's **responsibility** (what it is _for_), the **content** (not just type) of the return value, the **meaning** of each parameter, **how** they work together to affect the final result, and **what to expect** in case of errors.

Many developers just assume that their code is self-documenting, and therefore the meaning of a parameter or return value is obvious. It might be obvious to them at the time (until they forget), but not to other people. As a golden rule, I believe it is better to repeat the obvious than to risk leaving it open to interpretation, misunderstanding, and the errors that ensue.

Like with class descriptions, it is best to avoid describing the details of the implementation in header blocks, unless they are important to understand how to use the component. Method headers are intended to help understand _meaning_ and _usage_, not implementation. These details can be described inline within the method's body as a guide for developers trying to understand or debug the code.

The example above focuses on methods, but I encourage you to document your classes' constants and attributes as well, to explain what kind of content they hold and, above all, _why_. 

Here is an example of a private attribute whose name is "self-documenting" in terms of what it contains, but that requires a comment to understand why it is needed:

```php
/**
 * Maximum safe string size in order to be confident that we won't
 * overflow the max int size when performing math operations.
 * @var int
 */
private int $maxSafeIntStringSize;
```

## Describing implementation choices, quirks, and reasoning

Inline comments are most commonly used outside Docblocks to explain the meaning of a line or a group of lines. 

The golden rule for writing good inline comments is to use your common sense. You don't need to explain every single line of code. Instead, add comments to explain what is not self-evident and remains hiding beneath the instruction.

Explain _"what"_ the instruction does only when the instruction itself is difficult to understand.

```php
// pad the partial result with as many zeros as performed steps
$padding = str_pad('', $stepNumber, '0');
$partialResult = $padding . $partialResult;
```

In most cases, however, good comments explain _"why"_ that piece of code exists, making the author's intent explicit when it wouldn't be immediately evident otherwise:

```php
if ($topNumberLength < $bottomNumberLength) {
    // multiplication is commutative, and this algorithm
    // performs better if the bottom number is shorter.
    return $this->multiplyStrings($bottomNumber, $topNumber);
}
```

Intent is often missing in the code: you can know what a code does, but not _why_. Without making the reasoning explicit, it can only be inferred by performing reverse-engineering, leading to the oh-so-common situation where a developer makes an educated guess, then introduces a bug because they had guessed wrong.

## Describe test cases

Tests –in case you are actually writing them– are another place where descriptions go a long way to making them understandable.

A test case is a set of instructions that provide the information of _how_ a test is to be performed. It performs a series of assertions that a developer most likely is able to read and understand. However, when a test fails, how can you know if the bug lies in the tested component, or if it's the test that is faulty?  

Without a good test description, developers need to reverse-engineer the test to figure out the reasoning behind it – once again, a tedious, error-prone task. A good test description, however, should provide enough information about _intent_ to help developers understand what the test's author was attempting to verify in the first place.

I personally like the Gherkin syntax to explain test cases. Here is an example of that in a Docblock header a PhpUnit test case:

```php
/**
 * Given a decimal number
 * When rounding it to a target precision using the ceiling algorithm
 * Then the resulting number should have at most <precision> number of decimals
 * And it should be rounded to positive infinity if its original precision
 *     was larger than the target one
 *
 * @dataProvider provideCeilTestCases
 */
public function testItPerformsCeilRounding(
    string $decimalNumber, 
    int $precision, 
    string $expectedResult
): void
```

While we are at it, even though it's not strictly about comments, I strongly suggest adding dedicated error messages to your assertions. This has a double purpose: it provides developers with an explanation of the underlying meaning of the assertion, and a more meaningful error message if the assertion fails.

Here is an example:

```php
public function testItDividesNumbers(
    string $number1,
    string $number2,
    string $expectedResult
)
{
    /* ... */
    $this->assertSame(
        $expectedResult,
        $actualResult,
        "Failed asserting that $number1 / $number2 = $expectedResult"
    );
}
```

## Final words

Before we finish, I would like get back to the "self-documenting code needs no documentation" sophism I mentioned at the beginning of this article. Many developers support this argument together with this other apothegm:

_"Inline documentation should be avoided because it can fall aut of sync the code whenever one is modified but not the other."_

To people waving this argument as an excuse to avoid documenting their code, I say: 

Whenever you modify or refactor a component, you also update its tests, as well as any other places where your component is used, right? I have never heard anyone complain about that. Why should documentation be any different?

I hope this article has helped you understand that the small cost of good comments pays off enormously in the different ways they can benefit your projects, not only by improving collaboration through less friction and knowledge sharing, but also by helping _you_ improve the overall quality of your code.