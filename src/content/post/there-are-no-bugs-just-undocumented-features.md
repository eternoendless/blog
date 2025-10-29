---
title: "There Are No Bugs, Just Undocumented Features"
date: 2025-10-30
image: /images/it-works.jpg
imageCopy: AI-generated illustration
summary: Write your rules down before your product forgets how it's supposed to work.
tags:
- "Best Practices"
- "Engineering Culture"
- "Engineering Processes"
---

A few years ago I was hired to lead a large open-source project. During the first few days, I explored the interface and skimmed the code. I thought it was fairly simple and that I understood how it worked. I didn't.

Soon, I noticed a worrying pattern: contributors were frustrated — QA kept rejecting their Pull Requests for "breaking" existing features they didn't even know existed. Worse, users started reporting new bugs after almost every fix. How could it be?

As it turns out, after years and generations of contributors, the project had accumulated thousands of features — some core, others obscure. Very few people knew them all. Slowly but steadily, it had grown out of control. 

Regularly, a developer would see something odd and think, _"This must be a bug,”_ then remove or rewrite it. Or they would unintentionally break dependencies between features simply because they weren't aware that those features even existed. 

At some point, it was hard to tell what was a bug and what was just forgotten behavior. Sometimes we didn't even agree on what the right behavior was. That's when it hit me.

We like to think of a bug as "unexpected or incorrect behavior.” But unexpected according to whom? Incorrect compared to what? 

Expectations depend on shared understanding — and in large, evolving systems, that understanding is fragile. Oral knowledge is hard to find and easy to lose. As teams grow and people come and go, the collective memory of your business rules fades. You need to have it in writing.

Some engineers still argue _"We don't need documentation; the code is the documentation.”_ It's a comforting illusion, until the codebase starts arguing with itself. If code were always right, bugs couldn't exist — by definition. But code only tells you what was implemented, not what was _intended._

A bug is not just faulty code. It's a misalignment between implementation and _expectation_. 

That's why expectations must be written down — as a specification.

If the code deviates from the spec, it's a **code bug**.  
If the code behaves as intended but the outcome is wrong, it's a **feature bug**.

One is a breach of expectations that needs fixing. The other requires an agreement on what the correct behavior should be. 

As systems grow more complex, so do the rules that govern them. Write them down, or your product will soon become a minefield of "undocumented features.”
