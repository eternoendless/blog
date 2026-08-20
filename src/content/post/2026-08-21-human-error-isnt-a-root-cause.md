---
title: "\"Human Error\" Isn't a Root Cause"
date: 2026-08-21
image: /images/foolproof-system.jpg
imageCopy: AI-generated illustration
summary: Good systems don't rely on people not making mistakes.
tags:
    - Engineering Processes
    - Best Practices
    - Big Picture Thinking
---

A deployment goes out. Minutes later, users start seeing intermittent HTTP 500 errors while browsing. The team promptly rolls back to the previous version, investigates what went wrong, then ships a fix. Crisis over.

A few days later, as a standard practice, we sit together for a short retrospective. In preparation for the meeting, the team is requested to reconstruct what happened, find the root cause(s) that led to the problem, and identify the actions we can take to prevent it from happening again.

I always encourage my teams to use the [5 Whys technique][5-whys] to identify root causes. The idea is simple: you take a problem and ask why it happened. Then you take the answer and ask why again. Then you repeat, until you get to the bottom of it. Usually 5 cycles are enough to get to the root cause.

But no matter how simple the exercise might seem, teams often fall into a common pitfall that makes them derail and draw the wrong conclusions. Here's a typical example:

> Problem: Users were seeing intermittent HTTP 500 errors.
> 
> **Why?**  
> Because requests were reaching pods with inconsistent user context.
> 
> **Why?**  
> Because some pods were still running an older version.
> 
> **Why?**  
> Because part of the deployment had failed.
> 
> **Why?**  
> Because a race condition caused some asynchronous deployment tasks to fail.
> 
>  **Why?**  
> Because we didn't anticipate the race condition could happen.
> 
> **Action 1:** Fix the race condition.  
> **Action 2:** Check the CI logs after every deployment for failed tasks.

At first sight, this seems like a perfectly reasonable analysis. The team followed the chain until they found the problem, fixed it, and even added a verification step to catch the problem next time. All good, right?

In fact, no.

The race condition was a problem. It caused part of the deployment to fail. Fixing it was necessary. But it wasn't the root cause of the production incident.

Developers are naturally drawn to the technical details of a failure. They want to understand exactly what broke, where it broke, and under which conditions. That matters. But they often get so fixated on the details that they keep digging until they land on some form of "someone screwed up". That's not helpful. 

Asking _"Why did we make a mistake?"_ doesn't lead to a useful conclusion because it'll always end up in human error. But to err is human. It's natural. It's _unavoidable_. It's not something that can be fixed by “paying more attention” or adding more manual verifications. That's just moving the opportunity for human errors somewhere else in the process.

The right question you should be asking instead is: **_"what made it possible for a human error to break production?"_**. That's something you can use to strengthen your guardrails.

Go back to that same why. Don't ask what you missed — ask what your processes missed:

> [...] a race condition caused some asynchronous deployment tasks to fail.
> 
>  **Why?**  
> Because a failed deployment task didn't stop the deployment from being marked successful.

That's the real root cause. Not the race condition itself. Not that the team failed to foresee it. **The real problem was that the process _allowed_ a partially failed deployment to be marked as successful.** That should never have been possible. A strong system doesn't rely on people never making a mistake. It enforces the right state, automatically, at all times.

That's why the action that matters the most is not the one that fixes this specific race condition. It is the one that prevents any partial deployment from silently reaching production:

> **Action 1:** Make asynchronous deployment task failures fail the whole deployment.   
> **Action 2:** Automatically verify that all pods are running the expected version before considering the deployment successful.  
> **Action 3:** Automatically roll back when production does not reach the expected state.
>

Every failure is an opportunity to have a hard look at your processes, and identify the guardrails that you can set up to significantly reduce the chances of that happening again — not just for that particular issue, but for whole classes of issues.

Remember: people make mistakes. It's going to happen. Your job is to build an environment where those mistakes can't break production.

[5-whys]: https://en.wikipedia.org/wiki/Five_whys