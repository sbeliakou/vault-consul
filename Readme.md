### Spin up a VM
```
$ vagrant up
```

### Services

- Consul UI: http://192.168.56.10:8500
- Vault UI: http://192.168.56.10:8000


### Log into this VM
```
$ vagrant ssh
$ sudo su
```

### Working Dir
```
# cd /var/server/config
```

### Unsealing Vault
```
# cd /var/server/config
# docker-compose exec vault sh
/ # vault init
Unseal Key 1: KI5QlzLfU8+fn26flUvUFjq4b15rHVsM5egw1uPGUVlp
Unseal Key 2: vtWHVneWO31xGWcK3B4oZFTPplJbHjc4YDhNUESt+JxU
Unseal Key 3: QRAZOfwJl37TDh7fsMlxVANHeQv20tyKOUrjqGacpiy0
Unseal Key 4: zOQ+KjAbNoRmS/3BqsYNy6jQxRSzbUEWsGel1Sdzgfc4
Unseal Key 5: LWeJfKkXjyHYvuRKaGRhmNGlyKBWu+qyytG9fCevhTiI
Initial Root Token: 1b8ae355-9be2-0640-b820-5d2aef31a7fb

Vault initialized with 5 keys and a key threshold of 3. Please
securely distribute the above keys. When the vault is re-sealed,
restarted, or stopped, you must provide at least 3 of these keys
to unseal it again.

Vault does not store the master key. Without at least 3 keys,
your vault will remain permanently sealed.

/ # vault unseal KI5QlzLfU8+fn26flUvUFjq4b15rHVsM5egw1uPGUVlp
/ # vault unseal vtWHVneWO31xGWcK3B4oZFTPplJbHjc4YDhNUESt+JxU
/ # vault unseal LWeJfKkXjyHYvuRKaGRhmNGlyKBWu+qyytG9fCevhTiI
```

### Troubleshooting and Tips

```
# dig @172.28.0.1 vault.service.consul

# docker container prune
# docker image prune -a
# docker volume prune
# docker network prune
# docker system prune --volumes

# docker-compose rm
```

Links:
- https://docs.docker.com/engine/admin/pruning/#prune-everything
- https://docs.docker.com/compose/reference/rm/

