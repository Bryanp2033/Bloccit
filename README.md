# Bloccit 

Web App allowing users to create and share popular topics and articles

# Concept

This project is an inspiration Reddit and that what I was trying to achieve, it was my first major coding project ever and it centered around creating a site where users can create topics and creates posts to those said topics.

It wasn’t an original idea, but merely a project to test my skills in web development, none the less this project is still a fully fletched out one with various amounts of features, from liking and favoriting, to creating posts, to making user profiles the option to incorporating a user profile picture, to creating comments.

# Sign Up

When going the url, the user is treated with a simple login page in which users can sign in/sign up, tabs in which guests or users who are not loggin can still navigate.

To start off, a User has choice of signing up or signing in a created account.
Once a user has created an account, they will get notified a email to vertify their email that they signed up with

Clicking on Sign Up Button
![Signing Up](/gifs/signing-up.gif "Signing Up")

Creating an account
![Creating Account](/gifs/creating-account.gif "Creating an account")

Email Being Sent
![Email Being Sent](/gifs/email-sent.gif "Email Being Sent")

# Signing In

If a user has already created their account they have the option to then navigate the website on the latest topics or posts, or checking their account

Checking topics and posts
![Topics and Posts](/gifs/topics-and-posts.gif "Topics and Posts")

Checking owned user profile

![Game Swap: Login and User Search](/gifs/user-profile.gif "Login and User Searchh")

# User Features

Users can upload an image of their choice, and this application does make use of AWS, on the user profile page, users can also find their latest posts they favorited.

Updating Username
![Updating Username](/gifs/updating-username.gif "Updating Username")

Uploading a profile pic
![Uploading a profile pic](/gifs/uploading-image.gif "Uploading a profile pic")

Deleting Account
![Deleting Account](/gifs/delete-account.gif "Deleting Account")


# Post CRUD

A topic can hold many posts and thus posts can also be created, updated, or deleted. A post also must meet the requirements 

Post Validation
![Creating a post inside a topic](/gifs/Post-require.gif "Creating a post inside a topic")


Creating a post inside a topic
* Trying again with a long post title/body
![Creating a post inside a topic](/gifs/create-post.gif "Creating a post inside a topic")

Update a post
![Update a post](/gifs/edit-post.gif "Login and User Searchh")

Deleting a post
![Deleting a post](/gifs/delete-post.gif "Deleting a post")


# Comments CRUD

A user can comment inside of a post and delete as well

Creating a Comment
![Creating a Comment](/gifs/create-comment.gif "Creating a Comment")

Deleting a Comment
![Deleting a Comment](/gifs/delete-comment.gif "Deleting a Comment")

# Favorite and Upvote/Downvote Feature

Much like Reddit, the user can also favorite a post and find their favorited post on the user profile page

Favoriting a post
![Favoriting a post](/gifs/favorite-post.gif "Favoriting a post")

The User can also upvote or downvote a post, with this there is a popular tab that shows the top upvoted posts of that topic

Upvoting
![Upvoting](/gifs/Upvote.gif "Upvoting")

Downvoting
![Downvoting](/gifs/Downvote.gif "Downvoting")

# Technologies Used:

- Ruby on Rails Framework
- Javascript
- Ruby
- Sqlite
- HTML5
- CSS3


# Gemfiles Used:

- puma
- thin
- factory_girl
- will_paginate
- newrelic_rpm
- redcarpet
- devise
- carrierwave
- mini_magick
- fog
- sqlite3
- uglifier
- jquery-rails
- faker
- turbolinks
- bootstrap-sass
- better_errors
- pundit