import time
import random
import decimal


def application(env, start_response):  
    # Sleep for a random amount of time between 0 and 0.5 seconds to
    # simulate fetching data from database or an external API.
    time.sleep(float(decimal.Decimal(random.randrange(0, 50))/100))

    # Simulate some "work"
    #for i in range(1000000):
    #    print("Hello")

    start_response('200 OK', [('Content-Type','text/html')])
    return [b"Hello World"]