# github hook processor

Can listen to github webhooks and do one of two things: execute a script or a git pull.

It consists of a PHP component which can be called through the web and parses the payload provided by github and a bash component which actually executes the hook scripts.