# RouterOS script library

Ready-made MikroTik RouterOS scripts, shared by people who manage routers with
[TikManager](https://github.com/astukestarr/tikmanager) - and usable on any RouterOS 7 router.

**In TikManager:** Tasks > Scripts > **Community library** lists everything here. Pick a script, read it (lines that
deserve a second look are highlighted), and import it into your own scripts - nothing runs until you run it. To share
one of your own scripts, press **Share** next to it: TikManager checks it for passwords, keys and client details, then
opens a pull request here for review.

**Without TikManager:** open a script, read it, and paste it into a RouterOS terminal (or upload the `.rsc` and run
`/import file-name=...`).

> Scripts run with the rights of the user running them - usually full admin. **Read every script before you run it**,
> try it on a test router first, and keep a configuration backup.

## Scripts

Everything is in [`scripts/`](scripts/). Each file starts with a header:

```
# name: Block SSH brute force
# description: Blacklists addresses that keep opening SSH connections, for 10 days
# author: github-user
# tags: security, firewall, ssh
# routeros: 7.1+
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). In short: one script per file, the header above, nothing client-specific (no
passwords, keys, public IP addresses or names), tested on RouterOS 7, and a short description of what it changes.

## License

MIT - see [LICENSE](LICENSE). Each script is provided as is, without warranty; you're responsible for what you run on
your routers.
