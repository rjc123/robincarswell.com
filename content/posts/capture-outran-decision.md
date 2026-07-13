---
title: "Capture outran decision, and everything got rebuilt"
description: "The least flattering post in this series, and the most useful. Two patterns the data wouldn't let me pretend away."
summary: "This is the least flattering post in the series, and probably the most useful. Two patterns showed up in six months of my own data that I couldn't argue with: I captured ideas far faster than I decided what to do with them, and I rebuilt almost everything I built. Neither is quite the failure it looks like, but both taught me where the real bottleneck actually sits."
date: 2026-07-13T05:30:00Z
draft: false
series:
  - "AI Sabbatical"
series_order: 4
categories:
  - "Working Life"
---

This is the least flattering post in the series. It's also the one I'd keep if I could only keep one.

Two patterns turned up in six months of my own data, and neither would let me pretend it wasn't there. I captured ideas far faster than I decided what to do with them. And I rebuilt almost everything I built, sometimes three or four times over.

### I captured much faster than I decided

I told you in the last post that parking an idea is fine, because holding it costs nothing. That's true. Here's the part I left out: a lot of mine weren't parked. Parked means you looked at it and chose to wait. Mine were undecided, which is a different thing entirely.

By the end I had more than 300 open items sitting in a state of "evaluate this: build it, park it, or kill it." Not parked on purpose. Just never ruled on. Each one a small decision I'd swerved by capturing it and moving on to the next shiny thing.

That's the trap hiding inside cheap capture. When writing an idea down costs nothing, you stop paying the one price that actually matters: deciding. The scarce resource was never ideas, and after this year it isn't building either. It's the judgement to say no, out loud, and mean it. A backlog full of un-ruled-on items isn't a plan. It's avoidance with a timestamp.

### I rebuilt almost everything

The other pattern was churn. I rewrote the logic behind my CRM four times. I tore out a tool I'd built and rebuilt it from scratch. The messaging plumbing got ripped out and redone. A core policy went to a second version within weeks of the first. Built, broke, worked around, rebuilt, over and over.

For a while that felt like failure, like I couldn't get anything right first time. I've come round on it. You genuinely cannot know the right shape of a thing until you've lived with the wrong one for a fortnight. A rebuild is tuition, and it's usually cheaper than the analysis you'd have done to avoid it.

But there's an honest edge, and it's where the two patterns meet. Some of that rebuilding wasn't learning. It was rework I'd caused myself by never deciding what the thing was for in the first place. Build without a verdict and you don't build once, you build until you accidentally stumble on the requirements. The decision debt from the first half of this post is exactly what paid for half the churn in the second.

The CRM was the worst offender, and an instructive one. A good chunk of those four rewrites traced back to a task breakdown I'd structured badly at the start, made worse by a bug in my own task tool that surfaced far too much work whenever I asked it what to do next. So I kept building against a picture that was both wrong and overflowing. That isn't the model failing. That's me handing it a bad map and acting surprised when it took me the wrong way.

### Where it actually broke

When things fell over, it was almost never the clever bit. The AI wrote the code fine. What broke were the seams: young tools wired together fast and loose. Sync conflicts. Automation that failed silently and left me trusting stale data. A tool that lost information without so much as a warning.

Cheap building gives you the pieces. It does nothing to make them fit. The integration, the plumbing, the boring contracts between one system and the next, that's still the hard part and it's still entirely on me. Nobody's automated the glue.

### What I'd actually change

Three things, and I'm holding myself to them for the back half:

- **A decide-or-kill cadence.** Cap the undecided pile. Force a verdict on anything that's been sitting unruled for a week: build, park, or bin it, but choose.
- **Fewer tools, better joined.** One well-connected system beats five loosely wired ones every time, and the loose wiring is where every failure lived.
- **Treat a rebuild as a question, not just a cost.** When I'm rewriting something, ask whether I'm learning the right shape or paying off a decision I dodged. The first is fine. The second is the one to catch.

The backlog was never a to-do list. It's a monument to the decisions I kept avoiding. The building, it turns out, was the easy part all along. Deciding was the work.
