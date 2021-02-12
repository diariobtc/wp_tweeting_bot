# wp_tweeting_bot

Python Tweeting bot to promote the last N posts of a blog on twitter.

Your tweets won't be read by all your followers if you just tweet them once.
Your tweets will be more attractive if they have image attachments.

This bot, fetches your last posts titles and featured images and it will tweet up to N last posts found every time it runs.

Ideally you should set it up to run on a cronjob every few hours, so you can keep your last posts on rotation.

# Usage
Make sure you have all the required libraries as specified by the [requirements.txt](requirements.txt) file.

`python3 -m pip install -r requirements.txt`

Add as many sections on your config file for as many blogs as you need.
See [config.conf.sample](config.conf.sample) (save it as `config.conf`)

Simply run `./wp_tweeting_bot <config_file_path>`

# Configuration
You can configure multiple twitter accounts on multiple RSS feeds on a single config file

## RSS Feed Tweet Bot Configuration

Sample config file:
```
[yourblog.com]
feed_url=https://www.yourblog.com/index.php/feed/
num_last_tweets=4
max_days_in_rotation=5
intervals_between_tweets_in_seconds=60
attach_featured_images=true
dry_run=false
expirable_categories=markets:86400
oauth_token=
oauth_token_secret=
oauth_consumer_key=
oauth_consumer_secret=

[yourOtherBlog.com]
feed_url=https://www.yourotherblog.com/index.php/feed/
num_last_tweets=2
max_days_in_rotation=2
intervals_between_tweets_in_seconds=300
attach_featured_images=false
dry_run=true
oauth_token=
oauth_token_secret=
oauth_consumer_key=
oauth_consumer_secret=
```


`feed_url (string)` the RSS feed URL

`num_last_tweets (integer)` How many posts from the last available you want to tweet

`max_days_in_rotation (integer)` For how many days a post after publishing should be tweeted by the bot

`intervals_between_tweets_in_seconds (integer)` How often should the bot tweet in seconds

`attach_featured_images (boolean)` if `true|1|yes` it will upload the featured image available for that post to the tweet

`lock_tcp_port (integer)` Use a port number to avoid another bot instance running for this blog/twitter account, ideally > 8080 if not running as root

`dry_run (boolean)` Set to `true` to do a test run without actually tweeting, see output on console or nohup.out

`oauth_xxx (string)` Your Twitter app credentials

## Rotation Bot Configuration

If you want to run a bunch of tweets from a .txt file (instead of an RSS feed) this is how you configure the tweeting bot.

Most configuration keys are the same as the prior section, except for the feed source, instead of `feed_url` you will pass the path to the .txt file containing your tweets with `feed_path`. The Bot expects one tweet per line.

`feed_path (string)` text file with tweets disk path, e.g. `feed_path=/home/user/feeds/rotation_file_1.txt`

`repetition_interval_in_seconds (integer)` how many seconds to wait until repeating a tweet

`shuffle (boolean)` if true, randomize the order on which to send the tweets in the file, otherwise they will come out in the same order as typed in the file
