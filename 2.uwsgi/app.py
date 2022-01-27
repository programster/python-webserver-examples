import time


def application(env, start_response):
    # Sleep for half a second to simulate fetching data from database etc.
    time.sleep(0.5)

    start_response('200 OK', [('Content-Type','text/html')])
    return [b"Hello World"]