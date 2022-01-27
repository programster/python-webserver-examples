Python Webserver Examples
==========================

When developing a website in Python, there is endless documentation on deploying
a webserver, to the point where it can get a bit confusing. This codebase is
to provide examples of each kind, mostly in order of basic to advanced, with 
the advanced ones being more suitable for production.

The main purpose of this was for me to run against a stress test with 
[Gatling](https://blog.programster.org/stress-test-your-webserver-with-gatling)
to check for and ensure there were no performance bottlenecks. Each application
is as simple as possible, with a sleep for half a second to simulate fetching
data from a database, or a remote API, before returning a small textual 
response.

## How To Use
1. Ensure nothing else is running on port `8080`.
2. Ensure you have Docker installed.
3. Navigate into the folder of the example you are interested in.
4. Run `bash build.sh` to build the Docker image.
5. Run `bash run.sh` to run the built image, using that example.
6. Navigate to localhost:8080 and you should see the webserver respond.


## Examples

### 1. python-webserver
This is the most basic example and not recommended for production.
It implements the webserver in python itself using http.server, which only
implements basic security checks.


### 2. uwsgi
Implements a webserver through the use of [uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/).
By default uWSGI does preforking, so your app is loaded one time, and then
forked.


### 3. gunicorn
Implements a webserver through [gunicorn](https://gunicorn.org/).

#### Number of Workers
According to the [gunicorn docs on how many workers](https://docs.gunicorn.org/en/latest/design.html#how-many-workers), 
one should NOT scale the number of workers to the number of clients you expect 
to have. Gunicorn should only need 4-12 worker processes to handle hundreds or 
thousands of requests per second. They recommend setting `(2 x $num_cores) + 1` 
workers.


### 4. Gunicorn & Nginx
This example is like the previous example, but we use Nginx as a proxy.
This is strongly recommended by 
[the gunicorn deployment docs](https://docs.gunicorn.org/en/stable/deploy.html).
This will buffer slow clients. Without this buffering Gunicorn will be easily 
susceptible to denial-of-service attacks. You can use 
[Hey](https://github.com/rakyll/hey) to check if your proxy is behaving 
properly.


## Suggestions
If you want to add an example, or feel that one of the examples could be 
improved or sped up with some configuration changes, be sure to submit a merge
request.
