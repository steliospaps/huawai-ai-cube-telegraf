# about
Record in influxdb traffic statistics from a [huawei ai cube 4G router](www.three.co.uk/Discover/Devices/Huawei/AICubeB900)
I got from 3 UK with my 4G home broadband.
# references
the only reference I could find for the API was [this project in gihub](https://github.com/HSPDev/Huawei-E5180-API/)

I based my script on [this article](https://cactusprojects.com/rpi-status-log-to-influxdb/)
# usage

## script in crontab
copy to ~/bin:
```
install ./router-metrics.sh ~/bin/router-metrics.sh
```

edit the crontab:
```
crontab -e
```

append the following line to gather stats every minute:
```
* * * * * /home/username/bin/router-metrics.sh
```

to simulate load I run every hour the following command:

```
curl --silent http://ipv4.download.thinkbroadband.com/10MB.zip >dev/null
```
## telegraph

copy to ~/bin:
```
install ./router-metrics-telegraf.sh ~/bin/router-metrics-telegraf.sh
```

```
[[inputs.exec]]
  commands=["/home/username/bin/router-metrics-telegraph.sh"]
  name_override="router"
  data_format="influx"
```
