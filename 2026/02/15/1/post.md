---
title: 'LOC - lines of code'
language: en
date: '2026-02-15 10:00:00'
type: article
properties:
    tags: ["ai"]
published: true
---

    ~ git diff --shortstat <older-commit> <newer-commit>

    62 files changed, 9696 insertions(+), 474 deletions(-)

Or if you want to limit to code changes, e.g. Python, HTML, CSS, JavaScript.

    ~ git diff --shortstat <older-commit> <newer-commit> -- '*.py' '*.html' '*.css' '.js' '.yml'

    36 files changed, 6265 insertions(+), 453 deletions(-)


Now, please share what this means to you and what conclusions you draw from it.