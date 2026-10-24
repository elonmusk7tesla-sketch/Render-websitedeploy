# HyperVM Console on Vercel

A Debian 13 browser terminal with a real bash PTY, protected by a console token.

## Vercel deployment

Import this repository into Vercel with Framework Preset **Other**. Vercel detects
`Dockerfile.vercel` and builds the container. No custom build or install command
is required. Enable Fluid Compute.

Set the following environment variables in the Vercel project before deploying:

- `CONSOLE_TOKEN`: a randomly generated secret of at least 32 characters.
- `PORT`: `80` (the Vercel container runtime default).

Open the deployment and enter your console token. Vercel Deployment Protection
may also require signing into the owner account.

## Session and storage limits

This is a temporary terminal, not a persistent VPS. Vercel applies function
duration and scaling limits. This app closes terminal sessions after 270 seconds,
within the 300-second Hobby limit; click **Reconnect** to start a new shell.
The writable home is `/tmp/hypervm`. Files and installed packages are not durable
across scaling, replacement, or redeployment. A reconnect may use another instance.
Background agents and always-on servers cannot be relied on to keep running.
Systemd, host/kernel operations, nested virtualization, and privileged VPS behavior
are not provided by this deployment.

## Other Docker environments

The original `Dockerfile` remains usable. Set a strong `CONSOLE_TOKEN` and publish
port 10000. `SESSION_MAX_SECONDS=0` disables the app's session timer locally.
