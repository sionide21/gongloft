SalesLoft Gong
==============

An API driven gong living in the SalesLoft dev cave.

## Setup

You will need:

* A raspberry pi
* A servo like [this one](http://www.amazon.com/SMAKN%C2%AE-MG996R-Digital-Torque-Helicopter/dp/B00MCHLBIY)
* A 6v power supply for your servo

### Physical Setup

*Coming Soon...*

### Server Environment

* `RING_TOKEN` - The token used to post to the gong
* `GONG_TOKEN` - The token used by the gong to check for updates

#### Deploying to Heroku

Since the server is in a subdirectory of the repo, you have to use the following command to deploy to Heroku:

```
git subtree push --prefix server heroku master
```

### Raspberry Pi Setup

1. Install a recent version of Raspbian
2. Install WiringPi (`sudo apt-get install wiringpi`)
3. Upload `pi/*.sh` to `/home/pi`
4. Set the `GONG_TOKEN` and `SERVER` variables in `cron.sh`
5. Add a cron job with `crontab -e`. The following will run Mon-Fri from 9:00 - 6:00 ET:

```
* 13-22 * * 1-5 sh /home/pi/cron.sh
```

## Usage

To ring the gong:

```
curl -XPOST http://yourserver.com/queue/your_ring_token
```
