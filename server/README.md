# Shared site counters

One PHP endpoint, many counters. Each site picks a counter by `name`.

## Layout on the server

| Path | Purpose |
|------|---------|
| `/usr/share/site-counters/counter.php` | Shared script (read-only) |
| `/var/lib/site-counters/*.count` | Per-site counts (writable) |
| `/counter` (HTTP) | Apache Alias to the PHP script |

Mutable counter files belong under `/var/lib`, not `/usr/share` (FHS). The script still lives in a single shared place under `/usr/share`.

## Install

```bash
sudo install -d -o www-data -g www-data -m 0755 /var/lib/site-counters
sudo install -d -m 0755 /usr/share/site-counters
sudo install -m 0644 counter.php /usr/share/site-counters/counter.php
sudo cp apache-site-counters.conf /etc/apache2/conf-available/site-counters.conf
sudo a2enconf site-counters
sudo systemctl reload apache2
```

Requires `php` (and Apache PHP module or php-fpm + `SetHandler`).

## API

```
POST /counter?name=hastherapturehappened
→ {"name":"hastherapturehappened","count":42}

GET  /counter?name=hastherapturehappened&peek=1
→ {"name":"hastherapturehappened","count":42}   # no increment
```

Names: `^[a-z0-9][a-z0-9_-]{0,63}$`

## Other sites

Point them at the same `/counter` URL with a different `name`. No per-site PHP needed.

---

# Periodic rebuild (backup.stattenfield.org)

`rebuild-site.sh` pulls `main`, runs Hugo, and rsyncs into `/var/www/hastherapturehappened.com`.

On the server (already done once):

| Path | Purpose |
|------|---------|
| `~/src/hastherapturehappened` | Git checkout |
| `/usr/local/bin/rebuild-hastherapturehappened` | Rebuild script |
| `crontab` `0 */12 * * *` | Every 12 hours |
| `~/logs/hastherapturehappened-rebuild.log` | Cron output |

Manual run: `rebuild-hastherapturehappened`
