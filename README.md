# Instalation
```docker
docker-compose up
docker exec -it {containerId} bash
rails db:create
rails db:migrate
rails db:seed
bundle exec sidekiq
```


# Register
```ruby
POST
localhost:3000/api/v1/accounts/register
parameters: { email: "dk@gmail.com", password: "123456", password_confirmation: "123456" }
```

# Login
```ruby
GET
localhost:3000/api/v1/accounts/login
parameters: { email: "dk@gmail.com", password: "123456" }
```

## All of the bottom APIs need jwt token in your request header.

# Logout
```ruby
GET
localhost:3000/api/v1/accounts/logout
```

# AddUrl --->  User registers a new url
```ruby
POST
localhost:3000/api/v1/websites/add_url
parameters: { add_url: "https://digiato.com/" }
```

# Feeds List
```ruby
GET
localhost:3000/api/v1/feeds
```

# Get a feed
```ruby
GET
localhost:3000/api/v1/feeds/:id
```

# Favorit ---> Like and Dislike a feed.
```ruby
PUT
localhost:3000/api/v1/feeds/favorit/:id
```

# Read ---> User read a feed or not yet.
```ruby
PUT
localhost:3000/api/v1/feeds/read/:id
```

# Bookmark ---> User can bookmarks or undo for a feed.
```ruby
PUT
localhost:3000/api/v1/feeds/bookmark/:id
```

# Comment ---> Comment on a feed.
```ruby
POST
localhost:3000/api/v1/feeds/:id/comments
parameters: { description: "This is a description" }
```

# Comment ---> Comment list for a feed.
```ruby
GET
localhost:3000/api/v1/feeds/:id/comments
```

