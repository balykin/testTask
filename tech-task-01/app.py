from flask import Flask, request
import json

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_public_ip():
    client_ip = request.environ.get('HTTP_X_FORWARDED_FOR', request.remote_addr)
    print(request.environ)
    reversed_ip = '.'.join(reversed(client_ip.split('.')))
    # json_data = json.dumps(dict(request.environ), indent=4)
    # json_data = str(dict(request.environ))
    # return json_data
    return reversed_ip


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
