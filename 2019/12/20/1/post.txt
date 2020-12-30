---
title: "Weekly CW51-2019"
date: 2019-12-20 07:00:00
language: en
slug: "/posts/2019-12-20-weekly-cw51-2019"
author: André Bering
type: article
content-type: markdown
published: true
properties:
  tags: ["weekly"]
...

![Weekly CW51](weekly-cw51.svg){.lb .lb-img-noborder width="100%" noborder="yes"}

Even though the article "[Commit messages are not titles](http://antirez.com/news/90)" is dated 2015 it got some traction this week on [Hacker News](https://news.ycombinator.com/). If you would like to see the discussion on HN you can find it [here](https://news.ycombinator.com/item?id=21812772). Pretty interesting/controversial point of view by [Salvatore Sanfilippo](https://twitter.com/antirez) but I do agree to this. A commit message from my position must serve two purposes: explain what this commit contains and what it does. If its a title I'm fine, if not I'm fine, too. Nevertheless you should settle to a convention in your team to which everybody sticks.

A nice introduction to CloudEvents has been delivered by [Doug Davis](https://twitter.com/duginabox), [Clemens Vasters](https://twitter.com/clemensv), [Klaus Deissner](https://twitter.com/kdeissner) and [Vladimir Bacvanski](https://twitter.com/onsoftware) at KubeCon 2019. You can watch their session online. Watch [CloudEvents - Intro, Deep-Dive and More!](https://www.youtube.com/watch?v=yg7RuDWHwV8&feature=youtu.be) if you are interested in understanding how CloudEvents can serve purpose to you. 

Always interesting how big software shops handle changes in API changes or even breaking changes in general. Shopify which is unquestionable a big software shop has published "[How Shopify Manages API Versioning and Breaking Changes](https://engineering.shopify.com/blogs/engineering/shopify-manages-api-versioning-breaking-changes)" which goes in detail on handling and dealing with this kind of changes.

Another great article from a big software shop comes from Amazon. If you have ever had to deal with deployments of stateful services you know this isn't as easy as it sounds in the first place. My money quote from "[Ensuring rollback safety during deployments](https://aws.amazon.com/builders-library/ensuring-rollback-safety-during-deployments/)" is:

> Ensuring that we can roll back a deployment without any disruption for our customers is critical in making a service reliable.

If you are interested in more articles like this you should definitely have a look at the [The Amazon Builders' Library](https://aws.amazon.com/builders-library/).

