Week 5: Archiving and Logging Data

Step 1: Create, Extract, Compress, and Manage tar Backup Archives
  1.  Command to extract the TarDocs.tar archive to the current directory:
        
          tar xvvf Tardocs.tar -C ./

  2.  Command to create the Javaless_Doc.tar archive from the TarDocs/ directory, while excluding the TarDocs/Documents/Java directory: 
       
          tar cvvWf Javaless_Docs.tar --exclude="./TarDocs/Documents/Java" ./TarDocs/Documents/

  3.  Command to ensure Java/ is not in the new Javaless_Docs.tar archive:
        
           tar tvvf Javaless_Docs.tar | grep "Java"

Bonus: 
  Command to create an incremental archive called logs_backup.tar.gz with only changed files to snapshot.file for the /var/log directory: 
  For the very first backup:
    
         sudo tar zcvvf logs_backup.tar.gz --listed-incremental=snapshot.file.snar --level=0 /var/log
    
  For the incremental backup:
    
         sudo tar zcvvf logs_backup.tar.gz --listed-incremental=snapshot.file.snar /var/log
    
  Critical Analysis Question: 
  Why wouldn't you use the options -x and -c at the same time with tar?
  
         -c is for creating a backup while -x is for extracting the backup that was created.  It cannot be used at the same time because you cannot extract an archive that hasn’t been created.  

Step 2: Create, Manage, and Automate Cron Jobs
  1.  Cron job for backing up the /var/log/auth.log file:
      
          * 6 * * 3 tar cvfz /auth_backup.tgz /var/log/auth.log

Step 3: Write Basic Bash Scripts
  1.  Brace expansion command to create the four subdirectories: 
        
          mkdir -p ~/backups/{freemem,diskuse,openlist,freedisk}


  2.  Paste your system.sh script edits below:

          #!/bin/bash 
        
          #Free memory output to a free_mem.txt file     
          free -hm > ~/backups/freemem/free_mem.txt 
        
          #Disk usage output to a disk_usage.txt file
          du -h > ~/backups/diskuse/disk_usage.txt
        
          #List open files to a open_list.txt file
          lsof > ~/backups/openlist/open_list.txt
        
          #Free disk space to a free_disk.txt file
          df -h > ~/backups/freedisk/free_disk.txt


  3.  Command to make the system.sh script executable: 
            
          sudo chmod +x system.sh

Optional:
Commands to test the script and confirm its execution:
To test the script: 
    
        sudo ./system.sh

To confirm execution in each directory:
    
        cat ~/backups/freemem/free_mem.txt
        cat ~/backups/diskuse/disk_usage.txt 
        cat ~/backups/openlist/open_list.txt
        cat ~/backups/freedisk/free_disk.txt

Bonus
  Command to copy system to system-wide cron directory:
    
        sudo cp ~/system.sh ../../etc/cron.weekly

Step 4. Manage Log File Sizes
  1.  Run sudo nano /etc/logrotate.conf to edit the logrotate configuration file.
      Remove # before compress to uncomment it for the log files to be compressed across the board to preserve disk space.

      Configure a log rotation scheme that backs up authentication messages to the /var/log/auth.log.

      Add your config file edits below:
      
          /var/log/auth.log {
          rotate 7
          weekly
          notifempty
          missingok
          delaycompress
          endscript 
          }

Bonus: Check for Policy and File Violations
  1.  Command to verify auditd is active: 
          
          systemctl status auditd


  2.  Command to set number of retained logs and maximum log file size: 
       
          sudo nano /etc/audit/auditd.conf
    
      Add the edits made to the configuration file below:
       
          max_log_file = 35
          num_logs = 7
      
  3.  Command using auditd to set rules for /etc/shadow, /etc/passwd and /var/log/auth.log: 
        
          sudo nano /etc/audit/rules.d/audit.rules

      Add the edits made to the rules file below:
        
          -w /etc/shadow -p wra -k hashpass_audit
          -w /etc/passwd -p wra -k userpass_audit
          -w /var/log/auth.log -p wra -k authlog_audit
      
  4.  Command to restart auditd: 
        
          sudo systemctl restart auditd

  5.  Command to list all auditd rules: 
       
          sudo auditctl -l

  6.  Command to produce an audit report: 
       
          sudo aureport

  7.  Create a user with sudo useradd attacker and produce an audit report that lists account modifications: 
![](Images/Attacker_user.png)

  8.  Command to use auditd to watch /var/log/cron: 
          
          -w /var/log/cron -p rwa -k cron
       
  9.  Command to verify auditd rules: 
          
          sudo auditctl -l

      Listing after restarting auditd:
          
          -w /etc/shadow -p rwa -k hashpass_audit
          -w /etc/passwd -p rwa -k userpass_audit
          -w /var/log/auth.log -p rwa -k authlog_audit
          -w /var/log/cron -p rwa -k cron

Bonus (Research Activity): Perform Various Log Filtering Techniques
  1.  Command to return journalctl messages with priorities from emergency to error: 
          
          sudo journalctl -b -p 0..3

  2.  Command to check the disk usage of the system journal unit since the most recent boot: 
        
          sudo journalctl -u system-journald --disk-usage
      
  3.  Command to remove all archived journal files except the most recent two: 
          
          sudo journalctl --vacuum-files=2

  4.  Command to filter all log messages with priority levels between zero and two, and save output to /home/sysadmin/Priority_High.txt: 
        
          sudo journalctl -p 0..2 >> /home/sysadmin/Priority_High.txt

  5.  Command to automate the last command in a daily cronjob. Add the edits made to the crontab file below: 
        
          0 8 * * * journalctl -p 0..2 >> /home/sysadmin/Priority_High.txt 

