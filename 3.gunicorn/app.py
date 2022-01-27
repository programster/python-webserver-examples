import time

def app(environ, start_response):
    """Simplest possible application object"""
    # Sleep for half a second to simulate fetching data from database etc.
    time.sleep(0.5)

    data = b'Hello, World!\n'
    status = '200 OK'
    
    response_headers = [
        ('Content-type', 'text/plain'),
        ('Content-Length', str(len(data)))
    ]

    start_response(status, response_headers)
    return iter([data])