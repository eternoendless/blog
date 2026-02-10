---
title: AI Writes the Code — But Do You Understand It?
date: 2026-02-10
image: /images/understand-code.jpg
imageCopy: AI-generated illustration
summary: Code can be generated; staying in charge is still a human job.
tags:
    - AI
    - Best Practices
    - Engineering Culture
---

About a year ago, I had a discussion with another leader at my company about the need for better comments in the codebase. As I wrote in _[Why You Should Be Commenting Your Code][why-you-should]_, I argued for it by highlighting its impact on productivity and long-term maintainability. 

His response caught me off guard: 

> "We don't need comments anymore. **We have AI now.**"
{ .big }

He had a point. With AI-assisted coding tools, you can ask your agent about almost any piece of code within the system, and it will explain it instantly. At that time, many people were already impressed by the capabilities of AI coding, and began to believe that AI would soon replace software developers. 

That got me seriously thinking. If machines were going to read and write code better than humans, was [optimizing code for human understanding][optimize-for-humans] a concern soon to become obsolete? Would "good practices" —SOLID design, readable code, meaningful naming, low cyclomatic complexity— still be relevant?

There is no denying that the developer's workflow has changed radically in the last year or so. AI-assisted and agentic coding are becoming part of the standard toolset. But at the same time, it’s becoming clear that professional developers are **_not_** disappearing.

One reason is that while current models are very good at producing functional code quickly, they do not guarantee quality. Generated code often ends up longer, more repetitive, and more complex than necessary. In fact, studies and industry reports note that AI amplifies whatever structure it operates in: solid foundations lead to cleaner results, while weak ones accumulate technical debt faster.

We can ask AI agents to generate code, refactor existing modules, propose implementations, and make tests pass. But someone still needs to decide what the system should look like, where its boundaries are, and whether the result actually fits the original intent. That means defining the architecture, expressing constraints clearly, and verifying that the generated output is acceptable — those are still very much the responsibilities of a human.

That's why, even if most of the code is now being read and written by machines, good practices —like readable code and clean architecture— are still as relevant as they have ever been, for the same reasons they always were: understandability, stability, testability, and managing complexity at scale.

Software is still being designed and analyzed by humans. The difference is that humans are no longer doing most of the typing.


[why-you-should]: {{< ref "why-you-should-be-commenting-your-code.md" >}}
[optimize-for-humans]: {{< ref "optimize-for-humans.md" >}}