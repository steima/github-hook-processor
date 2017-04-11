# github hook processor

Can listen to github webhooks and do one of two things: execute a script or a git pull.

It consists of a PHP component which can be called through the web and parses the payload provided by github and a bash component which actually executes the hook scripts.

The script parses the field `repository->name` from the supplied payload which is used to determine which deploy script to execute. Deploy scripts are searched for in `/usr/lib/github-hook-processor/<repo-name>.sh`.

## Setup

To generally install the script-set on your system you would just clone the project into a location reachable through you webserver like:

```
git clone https://github.com/steima/github-hook-processor.git /var/www/github-hook-processor
```

Afther that make sure that all files are in their respective location by issuing.

```
bash /var/www/github-hook-processor/install.sh
```

## Github configuration

In Github navigate to `Settings > Webhooks` to create a new webhook. Point the **Payload URL** the URL where your `deploy.php` file can be reached. And configure the **Content type** with `application/json`. For now the optional field **Secret** is not used.

## Root Privileges

In many cases the scripts found in `/usr/lib/github-hook-processor/` will need to be run with root privileges. If this is required you must have [sudo](https://www.sudo.ws/download.html) installed on your system.

If sudo is present we will try to execute the deploy script through sudo. This means that once sudo is installed a valid configuration for each of your deploy scripts must be presente in `/etc/sudoers`. It is strongly advised to refrain from setting wildcard permissions for the user running the webserver!
