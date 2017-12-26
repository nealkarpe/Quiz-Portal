# Quiz Portal

A Quizzing Application where admins can create quizzes and users can attempt these questions. When a user logs in, he/she has an option to continue a quiz from where they left off, or start over.

### Prerequisites

* Ruby 2.4
* Rails 5.1

### Running

* Run 'bundle install' to install the dependencies in the Gemfile
* Run 'rails s' to run the development server
* Hop onto 'localhost:3000' to use the application

### Usage

* The database is currently empty.
* Make an admin account.
* Create quizzes. Each quiz can have any number of questions. Each question can one or multiple correct options.
* Make a user accound.
* Index page contains all quizzes that can be attempted.
* Select 'Start Quiz' to start a quiz from the beginning (or) select 'Continue' to continue the quiz where you left off.

### Screenshots

##### Signup Page
![signuppage](https://user-images.githubusercontent.com/31779922/34363718-a06f1616-eaa4-11e7-91ce-22f0be79d1d2.png)

##### Admin can create a new quiz
![admincreatequiz](https://user-images.githubusercontent.com/31779922/34363716-9ff87ea2-eaa4-11e7-87a7-b6ce5ec0d80d.png)

##### Admin can add a question to an existing quiz
![admincreatequestioninquiz](https://user-images.githubusercontent.com/31779922/34363715-9fa18584-eaa4-11e7-98c8-2c1cece7ae64.png)

##### Admin's index view of a quiz
![quizadminview](https://user-images.githubusercontent.com/31779922/34363717-a033fe6e-eaa4-11e7-932d-40d05e0b1ede.png)

##### User quizzes index page. User can start any quiz from the beginning or resume from where they had left off
![userquizzesindex](https://user-images.githubusercontent.com/31779922/34363720-a1152f74-eaa4-11e7-88f9-1f55b7936d08.png)

##### User attempting a quiz
![userquizattempt](https://user-images.githubusercontent.com/31779922/34363719-a0ab3b3c-eaa4-11e7-86d8-9bafa2bae152.png)
