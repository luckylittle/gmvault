# gmvault-gmv-1.9.2-beta-1-containerized

With Python2 being EOL and completely removed from modern distros like RHEL 9, it is now difficult to use no longer updated [GMvault](https://github.com/gaubert/gmvault/). That is why I quickly created this containerized version of it, specifically the latest `gmvault-gmv-1.9.2-beta-1` (md5sum `f93dcf73f34a16307fea55b5dc305696`).
It is tested and working on Red Hat Enterprise Linux release `9.2` (Plow) and Podman version `4.4.1`.

## Procedure

1. Build a GMvault container image; [./BUILD_CONTAINER.zsh](BUILD_CONTAINER.zsh)
2. Run any `gmvault` command inside the container from 1., preferrably mount the host folder so you can also use the backups outside of it; [./BACKUP_GMAIL.zsh](BACKUP_GMAIL.zsh)
3. The backups will appear in the mapped host folder, e.g. `user_gmail_com`

## Contributions

Lucian Maly <<lmaly@redhat.com>>
