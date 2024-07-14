# README

Suggested solution for the [Problem Statement](#problem-statement) described below, as part of Malo's technical test

* [Problem Statement](#problem-statement)
* [Starting The Application](#starting-the-application)
* [Database Structure](#database-structure)
* [Future Developments](#future-developments)
  * [Needed Evolutions](#needed-evolutions)
  * [Features](#features)
  * [Code Maintenability](#code-maintenability)
  * [Minor Improvements](#minor-improvements)

## Problem Statement

```
Malo is heavily driven by its content. A large part of our content is based on articles.
Build a page to search for articles. It should include a form to search through free text entry and display the matching articles' images with their titles.
The search should apply to both the content of the articles, its title and their tagging.
Only save the tags which are *not* starting with a hash ("#").
The list of articles and its data is joined to this email. We expect you to load them into a database.
We do not require more fields than the searchable fields at the time.

The goal of this exercise is to test your ability to code and to achieve a result in a limited time span.
You'll be questioned on code quality and trade-offs done during the exercise.
We welcome tests but they are not mandatory.
We welcome a decent UI, but it does not have to look great or be responsive.
The goal is to have something thought off and working.

We expect you to spend ~3 hours on the test.
We would recommend Rails as a tech stack to be inline with our own stack and knowledge
```

## Starting The Application

To run locally the application, follow these steps:

* Install the ruby version specified in the `Gemfile`
* Install dependencies: `bundle install`
* Run the server: `rails server` (or `./bin/dev` if you want to also have live tailwindcss rebuild)

## Database Structure

Database was created as simple as possible with only one table (`articles`) that stores everything needed to search for articles (as required in the [Problem Statement](#problem-statement)).

There are two specifities (which are not that unusual) :
1. UUID are used as primary key, since I consider them more safe and future-proof.
2. Postgresql full-text search features are used (but in a very simple way)

## Future Developments

This project aims to be a **very** simple solution (and could be seen as a proof of concept). There is still a lot to be done if we want it to be production-ready.

Below are lists of developments that would improve this project, organized by category.

### Needed Evolutions

All the listed evolutions here should be done as soon as possible.

* Paginate results from `ArticlesController#index` (with infinite scroll using turbo frames?)
* Add a tsvector column to the `articles` table => this will improve performance by a lot and will be important when there will be more rows in the table

### Features

For now, this application allows only one feature (searching for article) but much more could be done. Here are the first ideas that came to my mind.

* Allow the user to display the content of an article
* Allow the user to bookmark an article
* Allow the user to search article only by tag
* Allow the user to follow a tag in order to be notified when a new article was posted with this tag

### Code Maintenability

If the project needs to grow, these are the subjects we can work on to make development easier.

* Coding style guideline (e.g. rubocop)
* Better seeds

### Minor Improvements

* Better image storing for articles (e.g. multiple quality)
* Automatically search as the user type
* Use others psql search features (e.g. trigram)
