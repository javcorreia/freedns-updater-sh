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

This, theoretically, will run in any GNU/Linux distro with bash, or any *nix type OS with bash installed.  
It will require [jq](https://stedolan.github.io/jq/) and dig commands to be present in your system.  
Installation with a **HowTo** on some distros:  
* Debian and its derivates
```bash
sudo apt install dnsutils jq
```
* CentOs and derivates
```bash
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && sudo yum install jq bind-utils
```
* Arch and derivatives
```bash
sudo pacman -S jq dnsutils
```
* Fedora and derivatives
```bash
sudo dnf install jq bind-utils
```
