shisoconf11 is website for Shiso Conference 2011
------------------------------------------------

### Try 
``` 
$ git clone git@github.com:Shisobu/shisoconf11.git
$ bundle install --path vendor/bundle
```

### Test
#### Local
run Sinatra at local, should use [Pow](http://pow.cx/) and [Powder](https://github.com/Rodreegez/powder)
```
$ gem install powder
$ cd shisoconf11
$ powder
$ powder open
```

#### Staging
```
$ heroku create
$ git push heroku master
$ heroku open
```

### Production
How to deploy
-> Ask to @marutanm
