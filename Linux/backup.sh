#!/bin/bash
mkdir -p /var/backup
tar cvvWf /var/backup/home.tar /home
mv /bar/backup/home.tar /varbackup/home.02262022.tar
ls -lah /var/backup >> /var/backup/file_report.txt
free -h >> /var/backup/file_report.txt
