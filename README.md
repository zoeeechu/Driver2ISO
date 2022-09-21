#Driver2ISO

A simple script that injects Drivers into a Windows Recovery ISO :octocat:
 ```██████╗ ██████╗ ██╗██╗   ██╗███████╗██████╗ ██████╗ ██╗███████╗ ██████╗      ████████╗      
██╔══██╗██╔══██╗██║██║   ██║██╔════╝██╔══██╗╚════██╗██║██╔════╝██╔═══██╗   ████████ ███║
██║  ██║██████╔╝██║██║   ██║█████╗  ██████╔╝ █████╔╝██║███████╗██║   ██║   █████  █████║
██║  ██║██╔══██╗██║╚██╗ ██╔╝██╔══╝  ██╔══██╗██╔═══╝ ██║╚════██║██║   ██║   ███ ████████║
██████╔╝██║  ██║██║ ╚████╔╝ ███████╗██║  ██║███████╗██║███████║╚██████╔╝    ╚████████╔╝```

> This Project is based off and automates this Documentation
https://www.dell.com/support/kbdoc/en-ca/000112190/how-to-install-windows-7-on-systems-with-skylake-chipset

Make sure to create a C:/temp folder and place..

- C:\temp\src
- C:\temp\mount
- C:\temp\winremount
- C:\temp\hotfix
- C:\temp\drivers

..into it 
- Download and extract all needed drivers into C:\temp\drivers
- if needed place all hotfixes (.msu) into C:\temp\hotfix
- make sure you have oscdimg installed :warning:
- lastly make sure to copy all files and folders from your ISO into src 

:tulip: Now just run the Batch file with elevated rights and enjoy <3

when chould this be useful? 
> Eg: Windows 7 ISO's dont have USB 3.0 support in the installer by default you can inject the drivers for them to make the install process more bareable





