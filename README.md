# freedns-updater-sh
A simple bash updater for https://freedns.afraid.org service


## Installation

Just get a zip and copy the code from `/src` directory to wherever you choose in your machine.

## Configuration

Config comes from `config.json` file. 

* in `total` parameter put the total keys you have in your account
* in `keys` parameter put the keys themselves

## Usage

This thing, in theory, only updates when your public IP changes.  
So configure a cron job to your hearts content.  

An example:  
run this
```bash
crontab -e
```
and paste this code in it to have it run every 10 minutes
```
*/10 * * * * PATH_TO/freedns-updater.sh 2>&1 &
```

This script logs any update request made to freedns.afraid.org to the `freedns_updater.log` in the same directory of installation.  
The file will be created on first time request to freedns.

## Requirements

This script requires [jq](https://stedolan.github.io/jq/) and dig commands to be installed.  
Installation on Debian like distros:
```bash
sudo apt install dnsutils jq
```
