# SMTP domain validator WEB

This web app uses https://mailboxlayer.com to check if a given email has an existing SMTP domain.

Note: At most 5 requests per second are allowed


* Ruby version: 2.5.5

* Dependencies: Run ```bundle install```

* Configuration: You need to add ```API_ACCESS_KEY``` to ```.env```file.

* Database:
  - This API uses PostgreSQL. So make sure it is installed and with your username as a role
  - Run ```rails db:create```
  - Ten run ```rails db:migrate```
  - For production environment:
    - Run ```rake db:create RAILS_ENV=production```
    - Then run ```rake db:migrate RAILS_ENV=production```

* Services: For now, just checking if SMTP domain exists
