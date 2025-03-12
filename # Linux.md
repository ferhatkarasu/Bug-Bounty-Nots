
# find & grep
```sh
find /var/www/vulwebapp1.2/ -type -f  -name "*.php"
```
```sh
find /var/www/vulwebapp1.2/ -type -f | grep ".php" | xargs grep '$_POST\$GET\$_REQUEST'
```
