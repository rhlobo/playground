#!/usr/bin/env python


import argh
from flask import Flask


def run(name, port=5000):
    app = Flask(__name__)

    @app.route('/', defaults={'path': ''})
    @app.route('/<path:path>')
    def hello_world(path):
        return '''
               <h1>Server %s</h1><br>
               <i>/%s</i>
               ''' % (name, path)

    app.run(host='0.0.0.0', port=port, debug=True)


if __name__ == '__main__':
    argh.dispatch_commands([run])
