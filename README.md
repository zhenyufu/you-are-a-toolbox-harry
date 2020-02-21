# you-are-a-toolbox-harry

Some tools and commands 

![lol](random/harry.jpg)


### docker images 
```
docker-compose -f docker/mysql.yml up
docker-compose -f notebook/docker-compose.yml up
```

### Installing linux on a laptop 
* you want to install in UEFI mode
    * Rufus Patition scheme: GPT and DD mode
    * Disable secure boot, do not enable legacy as to use UEFI
    * SATA: AHCI otherwise the installatoin does not pick up the internal ssd
    * install with boostloader GRUP: ESP

