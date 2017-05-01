== README

# RD Chalange

## Accepted by Cawe Coy

# Installation guide

First off, make sure you have Ruby >= 2.1.0, Bundler, SQLite3 and Rails >= 4.2.2 installed.

Then follow the steps below to get this application installed and running:

1. Clone respected git repository

```git clone https://github.com/martynbiz/human_services_finder.git```

2. Install all dependencies

```bundle install```

3. Create db and migrate schema

```rake db:create
rake db:migrate```

4. Now run your application

```rails s```

Now check the browser to the URL specified by you rails server adding `/users` to its end.