---
title: "EX-Twitter: A half-day-only project"
date: 2024-11-18T14:29:56Z
draft: true
description: "A half-day-only project on preserving my twitter presence without using Twitter"
summary: "X-Twitter is now a cesspool. Here's my exit from that cesspool."
---

The goal: reasonably preserve my Twitter history, without relying on twitter to maintain link continuity.

## Discovery

* Looked at using a few different scripts
* Pretty straightforward to download the archive
* Pretty complex to migrate to hugo for storage here

## Why

Personally, I don't like the current politics of the service. I think it's best for democracy when editors have some self-restraint. This includes media owners, human editors and algorthimic editors (e.g. feed designers). 

With the stated goal of being the digital town square, somehow it seems like this particular town square has been invaded by robofacists with megaphones. So I've now left the town square, and decided to put my presence and focus somewhere else.

This particular exercise was triggered by the change in X-Twitter's terms-of-service that notes they'll train a bunch of grok language models on my provided content / data. I wasn't comfortable with that, so now is the time to exit.

## How

Here's what I've done: 

1. Request, wait, then downloaded my [twitter archive](https://x.com/settings/your_twitter_data)
2. Clone [this great parser](https://github.com/timhutton/twitter-archive-parser) into your own git instance
3. Use the parser to generate a library of monthly markdown -- note that there was some complexity in (my) mac install, with python3 vs python2 and a ton of extra config
4. Optional (cleanse out some non-value-add tweets / content without useful context)
5. Optional (cleanse out the public profile)

## My personalisation

6. Construct some textfiles to make it legible using a script [1]
7. Do a one-time media shift, so images are captured properly.
8. Put the tweets [here in my blog](/twitter).

## Learnings

* Some HTML and markdown expertise is valuable here
* When you download your archive, you don't get a full archive of the things you've retweeted (snippets only)
* You get a download of all your PMs -- probably a warning here for public figures who didn't think ahead about assumption of privacy


[1] A script - don't judge me

> `ls | grep 2 > inputyear && while read year
	do
	echo "---" > twitter_$year.md
	echo "title: \"Twitter archive, $year\"" >> twitter_$year.md
	echo "description: \"Captured archive of @robincarswell's twitter history, archived for posterity\"" >> twitter_$year.md
	echo "date: $year-12-31" >> twitter_$year.md
	echo "---" >> twitter_$year.md
	ls $year > inputmonth && while read month
	do
		cat $year/$month |
			sed 's/<[^>]*>//' >> twitter_$year.md
		echo >> twitter_$year.md
	done < inputmonth
done < inputyear && rm inputmonth && rm inputyear`


