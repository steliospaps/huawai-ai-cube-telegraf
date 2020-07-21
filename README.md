# about
Record in influxdb traffic statistics from a [huawei ai cube 4G router](www.three.co.uk/Discover/Devices/Huawei/AICubeB900)
I got from 3 UK with my 4G home broadband.

The script assumes that the router is in the default (for me) IP.
# references
the only reference I could find for the API was [this project in gihub](https://github.com/HSPDev/Huawei-E5180-API/)

I based my crontab script on [this article](https://cactusprojects.com/rpi-status-log-to-influxdb/)

# usage

## script in crontab
copy to ~/bin:
```
install ./router-metrics-crontab.sh ~/bin/router-metrics-crontab.sh
```

edit the crontab:
```
crontab -e
```

append the following line to gather stats every minute:
```
* * * * * /home/username/bin/router-metrics-crontab.sh
```

## telegraph

copy to ~/bin:
```
install ./router-metrics-telegraf.sh ~/bin/router-metrics-telegraf.sh
```

then edit /etc/telegraf/telegraf.conf:

```
[[inputs.exec]]
  commands=["/home/username/bin/router-metrics-telegraph.sh"]
  name_override="router"
  data_format="influx"
```
