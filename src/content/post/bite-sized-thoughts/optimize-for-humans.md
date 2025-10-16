---
title: "Optimize for Humans"
date: 2025-10-16
image: /images/optimize-for-humans.png
imageCopy: AI-generated illustration
summary: If your code confuses people, is is really optimized?
tags:
- "Bite-sized Thoughts"
- "Development"
---

Developers — especially early in their careers — are easily lured by premature optimization and clever abstractions. Layers of factories, interfaces, or "flexible" design patterns may appear elegant, but they come at a cost.

Unless there's a _very_ good reason, resist the urge. Code optimized for machines or hypothetical futures often becomes a burden for the humans who have to read and maintain it. Understanding multiple layers of indirection slows everyone down, increases the risk of bugs, and makes new features harder to build.

Before abstracting or "optimizing," ask yourself:

* _Is this really a performance bottleneck?_
* _Will this component need to change or scale in the near future?_

If not, go with simplicity. Optimize for the next person who reads your code: [Hardware is cheap, programmers are expensive](https://blog.codinghorror.com/hardware-is-cheap-programmers-are-expensive/).
