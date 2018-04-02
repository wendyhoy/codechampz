# CodeZen

A Rails application to test your coding skillz! Check it out on Heroku: https://codezzen.herokuapp.com/.  Or to run the app, do the following:

* Clone or download the repository
* Run 'bundle'
* Run 'rails db:create'
* Run 'rails db:migrate'
* Run 'rails db:seed' (optional)
* Start the server with 'rails s' and go to http://localhost:3000/.


## Technologies Used

* Ruby on Rails
* Bootstrap
* Simple Form
* CanCanCan
* Cocoon


## Team Members & Contributions


### Jay

* Created, ordered and sorted my_drill_groups by names/levels for the index page
* Created the all_drill_groups page for non_admin users
* Implemented the add_to_my_drills button to create an instance of a student_drill_group
* Created the navbar for students and admin
* Modified the index and create actions in the users controller
* Created validations for the user model


### Kaysha

* Implemented authentication
* Implemented authorization
* Built off Wendy and Metika's student drills controller -- Layout and navigating through completing a quiz
* Front-end design (color theme, landing page design, favicon)
* Ensured design cohesion throughout app


### Kealy

* Added validations for drill, drill group and solution
* Implemented CRUD for drill groups, drill and solution controllers
* Styled drill groups, drill and solutions CUD views, including nested forms
* Implemented user badges and points
* With Wendy, implemented leaderboard


### Metika

* Created validations for the student drill groups and student drills
* Created the student drills controller
* Implemented delete for the student drill groups
* Prepared database seeds with actual questions and answers


### Wendy

* Implemented base logic for students to complete drill groups
* Updated the drill groups page to only show drills that haven't been added
* Prioritized features, delegated tasks, and managed the team's schedule
* Reviewed builds, facilitated team meetings, and maintained git repo
* Helped with tasks, fixing bugs, and deployed project to heroku
