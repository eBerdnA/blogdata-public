---
date: "2019-07-23 11:31:00"
title: "Setting Git proxy"
language: en  
legacy: true
slug: "/posts/2019-07-23-setting-git-proxy"
type: article
content-type: markdown
published: true
language: en
properties:
  tags: []
...
Because I simply always keep forgetting how to un-/set proxy settings for Git this is my reminder for the future.

**Set proxy**

	git config --global http.proxy http://<username>:<password>@<proxy-server-url>:<port>
	git config --global https.proxy http://<username>:<password>@<proxy-server-url>:<port>
	
**Unset proxy**
	
	git config --global --unset-all http.proxy # to remove it from the global config
	git config --unset-all http.proxy  # to remove it from the local repo config file
