# Python 3 server example
# Courtesy of https://pythonbasics.org/webserver/
from http.server import BaseHTTPRequestHandler, HTTPServer
import time
import random
import decimal

hostName = ""
serverPort = 8080

class MyServer(BaseHTTPRequestHandler):
    def do_GET(self):
        
        # Sleep for a random amount of time between 0 and 0.5 seconds to
        # simulate fetching data from database or an external API.
        time.sleep(float(decimal.Decimal(random.randrange(0, 50))/100))

        # Simulate some "work"
        #for i in range(1000000):
        #    print("Hello")
        
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        self.wfile.write(bytes("<html><head><title>https://pythonbasics.org</title></head>", "utf-8"))
        self.wfile.write(bytes("<p>Request: %s</p>" % self.path, "utf-8"))
        self.wfile.write(bytes("<body>", "utf-8"))
        self.wfile.write(bytes("<p>This is an example web server.</p>", "utf-8"))
        self.wfile.write(bytes("</body></html>", "utf-8"))

if __name__ == "__main__":
    webServer = HTTPServer((hostName, serverPort), MyServer)
    print("Server started http://%s:%s" % (hostName, serverPort))

    try:
        webServer.serve_forever()
    except KeyboardInterrupt:
        pass

    webServer.server_close()
    print("Server stopped.")