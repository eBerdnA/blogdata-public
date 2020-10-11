# YAML Frontmatter

    ---
    title: "Citizen Developer? - Just my two cents"
    date: 2019-12-10 09:00:00
    slug: "/posts/2019-12-10-citizen-developer-just-my-two-cents"
    author: André Bering
    type: article
    content-type: markdown
    published: true
    lang: en
    properties:
    tags: ["weekly"]
    ...

## date

`date` must be in format

    YYYY-MM-DD hh:mm:ss

The value should always represent the date in UTC.

## lang

Possible values are:
* de
* en

## type

Possible values are:
* note
* article

## content-type

Possible values are:
* markdown
* html



# Picture with caption

    ![Citizen Developer/Every developer](citizen-developer.png){.lb .lb-img-noborder width="100%" noborder="yes"}
    *Figure: Citizen Developer/Every developer*

# Picture without caption

    ![Citizen Developer/Every developer](citizen-developer.png){.lb .lb-img-noborder width="100%" noborder="yes"}


