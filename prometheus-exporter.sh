#!/bin/bash

# scrapes the web interface of a deye inverter with serial number 21xx to the prometheus nodeexporter textfile format

metric_name="solar"
password="your-password"
#query=($(curl http://admin:$password@solar/status.html -s | grep -e "var webdata_now_p =" | cut -d '"' -f2))


file=/var/lib/node_exporter/$metric_name.prom.tmp
echo '# HELP solar_now_p current watt of solar' > $file
echo '# TYPE solar_now_p gauge' >> $file
echo '# HELP solar_today_e today total kwh' >> $file
echo '# TYPE solar_today_e gauge' >> $file
echo '# HELP solar_total_e total kwh' >> $file
echo '# TYPE solar_total_e gauge' >> $file
echo '# HELP solar_sn device serial number' >> $file
echo '# TYPE solar_sn untyped' >> $file
#echo $query >>  $file
curl http://admin:$password@solar/status.html -s | grep -e "var webdata" | sed 's/var webdata/solar/g' | sed 's/"[[:space:]]*"/"0"/g'|sed 's/ = "/ /g' | sed 's/";\r//g' | sed 's/[[:blank:]]*$//' >> $file

mv /var/lib/node_exporter/$metric_name.prom.tmp /var/lib/node_exporter/$metric_name.prom
