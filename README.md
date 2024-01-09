# Creating a new post

First checkout a new branch. Then create a new stub using of the following four commands. Each will use the corresponding template file from the `.templates` directory.

```bash
./prep-for-pub.sh new de-direct
./prep-for-pub.sh new en-direct
./prep-for-pub.sh new de-article
./prep-for-pub.sh new en-article
```

After the post has been written it can be prepped for publication running the script `./prep-for-pub.sh` prep. Afterwards create a PR and merge the created post.

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


