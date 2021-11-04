# Electronic voting machine

this is a project to try to reproduce brazil's electoral system. in it we have a register of users and candidates, where with a user it will be possible to vote for a registered candidate, through their code

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)&nbsp;
![Ruby on Rails](https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)&nbsp;

Things you may want to cover:

### Dependencies
   - Ruby v3.0.1
     - [install RVM](https://rvm.io/)
   - Rails v6.1.3.2
   - MySQL v8.0.25-0

### Setup
in the file ``config/database.yml`` put your user's settings for mysql
```bash
$ gem install bundle
$ bundle install
```

### Database create
```
$ rails db:create db:migrate
```

### Run
```
  $ rails s
```
