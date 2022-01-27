import time
import random
import decimal

def app(environ, start_response):
    """Simplest possible application object"""

    # Sleep for a random amount of time between 0 and 0.5 seconds to
    # simulate fetching data from database or an external API.
    time.sleep(float(decimal.Decimal(random.randrange(0, 50))/100))

    # Simulate some "work"
    #for i in range(1000000):
    #    print("Hello")

    data = b'Hello, World!\n'
    status = '200 OK'
    
    response_headers = [
        ('Content-type', 'text/plain'),
        ('Content-Length', str(len(data)))
    ]

    start_response(status, response_headers)
    return iter([data])