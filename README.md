# lemondeapi 

<!-- badges: start -->
<!-- badges: end -->

`lemondeapi` is a REST API for lemonde.fr written in R. This work is purely 
educational.

# Quickstart 

The easiest way to get the REST API to run is by running it from a 
docker container. You will probably need Docker Desktop installed on your 
computer.

The fist step will be to build the docker container. 

```
git clone https://github.com/cedricbatailler/lemondeapi.git

cd lemondeapi/

docker build -t lemondeapi .
```

Once the docker built, you can run from anywhere a docker can run. Note 
that the API will run on a server emitting on the 8000 port. To serve the 
docker locally, you can use the following:

```
docker run -p 8000:8000 lemondeapi
```

The API will then be accissible from http://localhost:8000/. Documentation
of the API will be hosted at http://localhost:8000/__docs__/.
