---
date: "2019-02-08 20:50:00"
title: "last service restart"
language: en
slug: "/posts/2019-02-08-last-service-restart"
type: article
content-type: markdown
published: true
language: en
properties:
  tags: ["linux" ]
...
For reasons it could be possible that you need to get the information when a service was restarted. First of all you need to find the process id.

    ps | grep "uwsgi"

Using the so found process id you can now get the information of the last restart.

    ps -p <processId> -o lstart
