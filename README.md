# Heroku スケジュールタスク

Heroku で Ruby の Clockwork を使って Cron 代わりに定期実行をさせるスクリプトサンプル。以下のようにして使う。

```
# clone this repo
git clone git@github.com:dynamis/heroku-clock.git

# create a heroku app
heroku apps:create <CLOCKAPPNAME>

# deploy
git push heroku master

# run clock process (no web process)
# note: App must be deployed before dynos can be scaled
heroku ps:scale web=0 clock=1


# status check
heroku ps
heroku logs --tail
```

詳しくは以下のドキュメント参照

* [Scheduled Jobs and Custom Clock Processes in Ruby with Clockwork](https://devcenter.heroku.com/articles/clock-processes-ruby)
* [Clockwork - a clock process to replace](https://github.com/tomykaira/clockwork)
