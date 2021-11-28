# Project-Management Sinatra App

## Overview
- [Purpose](#purpose)
- [Requirements](#requirements)

## <a id='purpose'>Purpose</a>
I am currently working as an electrical engineering at an engineering consulting firm. The electrical team that I am on has its own resource management tool that one of my coworkers built with MS Office tools to manage project assignments and who is working on them. The tool is quite clunky and issues pop up all the time with the current MS Office design. My thought was to build a PoC project management tool that can assign engineers to projects and keep track of pertinent information such as the engineers level. This can later be expanded to account for the engineers particular bill rate depending on their level and could possibly bring in the projects budget.

## <a id='requirements'>Requirements</a>
The project follows the MVC structure and uses ActiveRecord to keep track of all users and projects. A user (engineer) can have many projects and a project belongs to that user. An engineer is able to sign in or sign up if they do not yet have an account. Once signed in they can take a look at the other engineers on their team and the projects that are currently existing with the assigned engineer. New projects can also be created with the ability to assign any existing engineers to the project.
