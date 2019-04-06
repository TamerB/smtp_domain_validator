# SMTP domain validator WEB

This web app uses https://mailboxlayer.com to check if a given email has an existing SMTP domain.

Note: At most 5 requests per second are allowed


* Ruby version: 2.5.5

* Dependencies: Run ```bundle install```

* Configuration: You need to add ```API_ACCESS_KEY``` to ```.env```file.

## Database:
This Web app/API uses PostgreSQL. So make sure it is installed and with your username as a role
* Run ```rails db:create```
* Ten run ```rails db:migrate```
### For production environment:
* Run ```rake db:create RAILS_ENV=production```
* Then run ```rake db:migrate RAILS_ENV=production```

## Testing:
  Run ```bundle exec rspec``` (Only added testing for the API. However, web view is using almost the same functionality).

## Running the app:
Run ```dotenv rails s``` (add which environment if you are trying an environment other than development).

### For web view:
In web browser enter ```http://0.0.0.0:3000/validation_requests```

### For API:
#### Example options from terminal:
* Using http: Run ```http POST :3000/api/validation_requests email=tamer.bhgt@gmail.com```
* Using curl: Run ```curl --data "email=tamer.bhgt@gmail.com" 0.0.0.0:3000/api/validation_requests```
####Example option using Ajax:
```
var formData = {
  'email': "tamer.bahgat@sunrise-resorts.com"
};

$.ajax({
  type: "POST",
  url: "https://shrouded-refuge-61541.herokuapp.com/validation_requests ",
  data: formData,
  success: function(dataString) {
    console.log(JSON.stringify(dataString));
  }, error: function(error) {
    console.log(JSON.stringify(error));
  }
});
```

* Services: For now, just checking if SMTP domain exists
