# Eventer

Eventer is a simple API that is used to send emails to users.

# Instalation
#### Redis
Run `brew install redis` and follow the instructions.

#### Sendgrid
Configure your username password and domain:
```
export SENDGRID_USER="username"
export SENDGRID_PASSWORD="password"
export SENDGRID_DOMAIN="localhost"
```


Next, run the queues using
`bash scripts/run_queues.sh`

# General explanation
I use two queues (using [resque](https://github.com/resque/resque)) to process stuff in the background. When adding emails I'm adding the emails to the DB queue and when sending mails I add them to the mails queue. Each queue is later processed by it's own worker.

#### Exception handling
The workers are adding messages back to queue before raising exceptions.
