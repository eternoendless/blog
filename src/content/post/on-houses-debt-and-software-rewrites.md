---
title: On houses, debt and software rewrites
date: 2018-09-06T13:10:36+02:00
image: /images/refactored-house.png
tags:
  - Development
  - Refactoring
---

Most non-developers usually struggle to understand the need for software refactoring and rewrites. They ask: “It’s been working fine until now, why change it? And _why the heck_ would I spend good money to rebuild something that I already have?”.

The short answer is, software behaves like a depreciable asset in accounting, or like a fruit. In time, it will progressively rot and lose its value, no matter what you do. In order to keep it working, it needs constant investment in order to replace the rotten parts. But in the end you’ll end up being forced to throw it away and get a new one.

If you, reader, have some experience with software development, you will probably agree that software engineering has a lot in common with architecture and engineering in the physical world. If you don’t, then I hope that you will find this example enlightening. It’s a little long, but please indulge me.

## Building a house

Let’s say you are building a house. You start with your formal requirements — 2 bedrooms, a living room, a kitchen and a bathroom. Then you have people draw it down on a blueprint, have it approved and go on to build it; first with the foundations, then the floor, walls and ceiling, doors and windows, electrical installation and plumbing, and in the end the finishing touches with paint and appliances.

Of course, a house rarely remains untouched for too long. In time it will start developing cracks that needs filling, faded paint that needs refreshing, leaking plumbery that needs patching, and most importantly, structural modifications. It happens that families grow and need more room, so you decide to build a second floor. This of course means that columns will need to be reinforced to sustain the weight of the new floor, the electrical system will need some rewiring to add new circuits, plumbing adjustments, and so on. It’s a lot of work but it beats moving to a new house in another neighborhood.

{{< figure src="/images/refactored-house.png" title="An \"extended\" house" >}}

30 years after, the city has become more dense, and a real estate developer buys the house to build a 5-story building there. Needless to say, he will have a hard time adding three more floors: the massive added weight requires putting a column in the middle of what once was a large living room, reducing the potential selling price for each apartment. Also, making water go up to the 5th floor will need a big pump that requires reworking the basement, as well as replacing the whole plumbery with larger tubes, not to mention the sewage system which needs to be replaced too. And on top of that, new building regulations require external walls to be isolated further in order to reduce energy consumption.

At this point in time, the developer will conclude that it’s more cost-effective to demolish the old house and build the new building from the ground up instead of trying to reuse the old house, because the benefits of reusing the old structure no longer justify the tradeoffs needed to adapt it. As an added bonus, because of new materials and weight disposition, building it from scratch allows getting rid of that lousy column that would have been needed in the middle of the living room.

This buildup of structural problems also exists in software development. And in the same way as with buildings, it will grow relentlessly, regardless of what you do. Of course, depending on how much you invest in maintenance, you can slow the aging down — but it can never be stopped. And like buildings, the more you move pieces around, the sooner it will need to be demolished and rebuilt.

Now that we know that every software inevitably ends up either being scrapped or rewritten, let’s get to how this process develops.

As software evolves, complexity starts increasing. There is a known, direct correlation between complexity, and the cost of fixing bugs and adding features, which can only be reduced by the means of refactoring (partial rewriting) or full rewriting. As complexity increases, it becomes progressively harder to fix bugs and add new features. This outstanding complexity is popularly known as “technical debt”.

## Borrowing from your future self

The consequences of technical debt can be explained using its likeness to financial debt. When you take a small loan, you can invest that capital to, say, start your business. This allows you to get started now, in hopes that the profit you will make of it will allow you to pay up your debt later, while still making a profit in the end. In a way, it’s like “borrowing” money from your future self, and paying interests for the time-traveling service to someone else.

If your business isn’t taking off right away, you can always take a second loan, maybe by putting a mortgage on your house. But as you probably know, cumulating debt is a Bad Thing, because the more in debt you get, the higher the interests and the harder it gets to reimburse. And if you don’t pay up, eventually then the bank will take your house away, and the time-traveller guy will break your legs.

Again, this happens pretty much the same way in software development. When you start off, you can cut some corners and move forward fast. But every corner you cut is added complexity, or “technical debt” that you are adding up. Similarly to the idea that when you take a loan you are borrowing money from your future self, money that you will have to pay back with interests to the time-traveling guy, when you add up technical debt you are borrowing development time from your future team, who will have to reimburse it with interests later.

Furthermore, if you let your “technical debt” get out of hand, you’ll find yourself getting deeper and deeper in a spiral of “hydra bugs”. In this scenario, fixing any bug will produce an unknown number new bugs in unexpected parts of the system, taking your development team an exponentially increasing amount of time to fix, until it gets to a point where all development comes to a standstill because of regressions. Projects reaching this point usually require a full rewrite, with potentially disastrous consequences if your business depends on it.

So to sum it up: treat your technical debt as seriously as you’d treat your financial one. Pay it off progressively and don’t let it pile up. You business survival may depend on it, too.