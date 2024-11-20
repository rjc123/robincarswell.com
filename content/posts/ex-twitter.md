---
title: "EX-Twitter: A half-day-only project"
date: 2024-11-18T14:29:56Z
description: "A half-day-only project on preserving my twitter presence without using Twitter"
summary: "X-Twitter is now a cesspool. Here's my exit from that cesspool."
---

I've decided to exit Twitter. I'm going to leave the profile alive, so that strangers can't easily claim my user name, and/or hijack my identity. [This isn't a challenge - don't take it as one.]

I'll be shifting to some other platforms -- you can find them linked on my homepage if you'd like to reach out.

## Why make a change?

Personally, I don't like the current politics of the service. I think it's best for democracy when editors have some self-restraint. This includes media owners, human editors and algorthimic editors (e.g. feed designers). 

If you're going to be a digital town square, don't let your town square be taken over by robofacists with megaphones -- because people will leave the town square. I'm going to put my presence and focus somewhere else.

Although it's been in the thoughtworks for a while, it was triggered today by the change in X-Twitter's terms-of-service -- they're going to start training a bunch of grok language models on my provided content / data. I'm not comfortable with that, so now is the time to exit.

The goal: leave Twitter, reasonably preserve my public Twitter history (not that it's a seminal work), without relying on twitter to maintain link continuity.

## Discovery

* Looked at using a few different scripts to do some porting
* Pretty straightforward to download the overall archive (required under GDPR)
* Pretty straightforward to use a script to modify the archive from its default structure
* Pretty complex to migrate to hugo for useful publication here, so will need some sort of scripting to modify. 

## What I've done

Here's what I've done: 

1. Requested, waited, then downloaded my [twitter archive](https://x.com/settings/your_twitter_data)
2. Cloned [this great parser](https://github.com/timhutton/twitter-archive-parser) into my own git instance so I have a record of it
3. Use the parser to generate a library of monthly markdown -- note that there was some complexity in (my cluttered) mac install, with python3 vs python2 and a ton of extra config to figure here
4. Optional (cleansed out some non-value-add tweets / content without useful context)
5. Optional (cleansed out the public profile on twitter -- nothing serious to worry about)

## My personalisation

Here's what I did next:

6. Constructed some markdown files to make it legible using a script [1]
7. Did a one-time media shift, so images are presented properly.
8. Put the tweets [here in my blog](/twitter).
9. Updated my social presence icons on the left panel. Particularly, you can now find me on [Bluesky](https://bsky.app/profile/robincarswell.bsky.social)

## Learnings

* Some HTML and markdown expertise is valuable here
* When you download your archive, you don't get a full archive of the things you've retweeted (it retains snippets only). Your content is preserved in full, however.
* You get a download of all your PMs -- probably a warning here for public figures who didn't think ahead about assumption of privacy ten or twenty years ago

[1] [A script](https://gist.github.com/rjc123/78dbb3f6a5979cef680ddd1f0b28f7a8) I used to make the markdown legible for hugo - don't judge me 


*This post was edited after publishing for brevity and levity. Also, changed how it worked so that I could regenerate the twitter archive properly.*