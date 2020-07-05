# Resources Service

---

### Description
This is a microservice meant to list all the resources in (Credential Registry API)[https://staging.credentialengineregistry.org/envelopes].

---

## Usage (without docker)
- Clone this project locally
- Run `bundle install`
- Run `ruby router.rb`
- Make sure you have a redis instance running and available at port `6379`
- Go to (localhost:4567)[http://localhost/4567] and you will have instructions at the root of the service

## Usage (with docker)
- Clone this project locally
- Run `docker-compose build`
- Run `docker-compose up`
- Go to (localhost:4567)[http://localhost/4567] and you will have instructions at the root of the service
- In (localhost:8080)[http://localhost/8808] you will found the documentation server

> Additional note: you can enter the "tasks" directory and run `rake resources:fetch` to get all the resources listed