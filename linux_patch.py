import subprocess
from flask_cors import CORS
from flask import Flask, request
from flask_restful import Resource, Api
#from json import dumps
#from flask.ext.jsonpify import jsonify

app = Flask(__name__)
CORS(app)
api = Api(app)

class Check(Resource):
    def get(self, ip5, ip15):
        result = subprocess.Popen(['sh', 'linux_patch.sh', ip5, ip15], stdout=subprocess.PIPE)
        return  {"output": result.stdout.read()}

api.add_resource(Check, '/api/avmpatch/<ip5>/<ip15>')


if __name__ == '__main__':
     app.run(host='10.10.10.10', port='9910')
