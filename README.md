# mktlist

How To Use

1. create route table with name: rkn 

```
 /routing/table/add name=rkn fib
```

2. create firewall magle rule

Tab General
chain: prerouting
Scr.Address: 192.68.88.0/24 (or your local network)

Tab Advanced
Dst. Address List: rkn

Tab Action
Action: mark routing
New Routing Mark: rkn
Passthrough: true


3. create new route

Tab General
Dst. Address: 0.0.0.0/0
Gateway: address your vpn
Distance: 1
Scope: 30
Target Scope: 10
Routing Table: rkn

4. create new script

copy and paste file AllYouNeed

5. create scheduler for script


optional

6. custom script for edit address list

```
:global removeAddr {
    104.16.64.0/23;
    18.65.3.0/24;
    172.67.130.0/24
}

:foreach addr in $removeAddr do={
  :do {/ip firewall address-list remove [/ip firewall address-list find where name=rkn && address=$addr]}
}


:global addAddr {
    104.16.64.0/23;
    18.65.3.0/24;
    172.67.130.0/24
}

:foreach addr in $addAddr do={
  do {/ip firewall address-list add list=rkn && address=$addr}
}
```
