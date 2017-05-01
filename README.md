# README

## RD Challenge

#### Accepted by Cawe Coy

### Installation guide

#### Ruby on Rails server-side application

First off, make sure you have Ruby >= 2.1.0, Bundler, SQLite3 and Rails >= 4.2.2 installed.

Then follow the steps below to get the server-side application installed and running:

1. Clone respected git repository

```git clone https://github.com/cawecoy/cawerd.git```

2. Install all dependencies

```bundle install```

3. Create db and migrate schema

```rake db:create```
```rake db:migrate```

4. Now run your application

```rails s```

Now go to check your server address.

#### Javascript client-side library

Just add this before the close `</body>` tag of the pages you want to track users and you are done.

```<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>```
```<script src="https://cawerd.herokuapp.com/users/client/rd.js"></script>```

In case you are hosting the server-side application in your own server, add this just before the above code:

```<script>var rd_server_url = "https://your-server-address.com";</script>```

Changing `https://your-server-address.com` to the server address you installed the server-side application.

If you have any trouble, please don't hesitate to send feedback and collaborate with this application through GitHub :)