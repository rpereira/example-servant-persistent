This project is a small example for how to set up a web-server with
[servant-server](http://haskell-servant.readthedocs.io/) that uses
[persistent](https://www.stackage.org/package/persistent) for saving data to a
database.

You can build and run the project with [stack](http://haskellstack.org/), e.g.:

``` bash
stack build
stack exec example-servant-persistent
```

Then you can query the server:

``` bash
# POST /users
curl --request POST --header "Content-Type: application/json" \
    --data '{"username": "alice", "email": "alice@me.com", "password": "ninjas"}' \
    http://localhost:3000/users

# GET /users/:username
curl --request GET --header "Content-Type: application/json" \
    http://localhost:3000/users/alice
```
