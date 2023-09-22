# 🎉 VPN Access Notifier to Discord WebHook 🎉
## Sample Image
![example](https://github.com/naoido/VpnAccessNotifier4YamahaRouer/assets/54303857/143a5def-d7a2-456c-ad43-d5c2e873158c)


## Usage 
> Transfer the script file to the router
```
tftp ${your yamaha router ip} put ${lua script path} /lua/vpn_access_notifier.lua/${your administrator password}
```

  
> Run the script
```
lua /lua/vpn_access_notifier.lua
```

  
> Set script schedule
```
schedule at ${schedule id} startup * lua /lua/vpn_access_notifier.lua
```
