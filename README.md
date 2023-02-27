# deye-solar-dashboard

Scripts to export data from a dee inverter with serial no 21xxxx through prometheus to a grafana dashboard.
(Tested with firmware MW3_16U_5406_1.53 and MW3_15U)

### What it looks like
![what the dashboard looks like](https://user-images.githubusercontent.com/7593137/221596982-231df63c-a78f-4e70-814a-f9a1c361b5d7.png)




### Setup
The scripts a re running on a rasperry pi
 - have the deye inverter in the same network as the raspberry pi. With a fritzbox you can even block the inverter from accessing the internet via "kindersicherung".
 - have prometheus, prometheus-node-exporter and grafana installed
 - install the `prometheus-exporter.sh`  as a systemd service with a timer
 - add your password for the inverter  and the inverters ip address to the `prometheus-exporter.sh`
 - tell the prometheus node exporter to collect textfiles from the right directory:
    - put `NODE_EXPORTER_ARGS="--collector.textfile.directory /var/lib/node_exporter/"` into `/etc/conf.d/prometheus-node-exporter`
  - check if data is logged to prometheus
  - configure grafana by importing the dashboard from `grafana-dashboard.json`


### Other useful tools
- [If you want to update your deye firmware offline](https://github.com/dasrecht/deye-firmware)

### Feedback
let me know if you tried it and got improvements via the issues/PRs.
