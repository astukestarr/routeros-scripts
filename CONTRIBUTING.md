# Contributing a script

Thank you - every script here saves someone else an afternoon. The easiest way is TikManager's **Share** button
(Tasks > Scripts); it does the steps below for you. By hand: fork this repository, add your file under `scripts/`,
and open a pull request.

## Rules

1. **One script per file**, `scripts/<short-name>.rsc`, lower case with dashes (`block-ssh-brute-force.rsc`).
2. **Start with the header** - name, description, author (your GitHub name), tags and the RouterOS versions you tested:
   ```
   # name: ...
   # description: ...
   # author: ...
   # tags: ...
   # routeros: 7.12+
   ```
3. **Nothing client-specific.** No passwords, keys, pre-shared keys, certificates, public IP addresses, e-mail
   addresses, company or site names. Use `:local` variables at the top that the person fills in, or TikManager
   placeholders (`{{identity}}`, `{{client}}`, `{{site}}`, `{{wan_ip}}`).
4. **Say what it changes**, in the description and in comments - especially anything that touches users, services,
   firewall rules or schedulers, or that reboots the router.
5. **Safe to run twice** where possible (check before adding, or remove what you add first).
6. **Never** disable the `www` service, remove the `tikmanager` user or touch the `tikmanager` WireGuard interface -
   TikManager manages routers through them.
7. **Tested on RouterOS 7** (say which version in the header).

## Review

Every pull request is read before it's merged, because scripts run on routers with full rights. Expect questions about
anything that changes access, deletes things or talks to the internet.
