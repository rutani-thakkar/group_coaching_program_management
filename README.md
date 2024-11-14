# README

### Postgres for Database
1. gem 'pg', '~> 1.1'
2. bundle install
3. create database.yml file
4. rails db:create
5. rails db:migrate


### Release Note
1. Create database.yml file inside config folder; by renaming database.yml.example file
2. Create database using command: rails db:create
3. Run migrations using command: rails db:migrate
4. Run test cases using command: bundle exec rspec
5. There are total 4 models: Coach, Company, employee, coaching_program
6. Company: 
    - has_many coaching_programs, employees, coaches
7. Coach:
    - has_many coaching_programs
8. Coaching Program:
    - has_many coaches, employess
9. Employee
    - has_many coaching_programs


