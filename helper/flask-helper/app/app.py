from flask import Flask
from redis import Redis, RedisError
from flask import jsonify
import os
import socket

# Connect to Redis
redis = Redis(host=os.getenv("REDIS_HOST", "localhost"), password=os.getenv("REDIS_PASSWORD"),port=os.getenv("REDIS_PORT", 6379), db=0, socket_connect_timeout=2, socket_timeout=2, charset="utf-8", decode_responses=True)

app = Flask(__name__)

def getCurrentIndex(username):
    return int(redis.get(username))

def getCurrentMessageSize():
    return redis.llen("helpMessage")

def getCurrentMessage(username):
    return redis.lindex("helpMessage", getCurrentIndex(username) - getCurrentMessageSize())

def getNextMessage(username):
    redis.incr(username)
    return redis.lindex("helpMessage", getCurrentIndex(username) - getCurrentMessageSize())

def getAllMessage(username):
    return redis.lrange("helpMessage", 0 - getCurrentMessageSize(), getCurrentIndex(username))


@app.route("/current/<username>")
def current(username):
    result= {"username":username, "helpMessage":getCurrentMessage(username)}
    return jsonify(result)

@app.route("/next/<username>")
def next(username):
    result= {"username":username, "helpMessage":getNextMessage(username)}
    return jsonify(result)

@app.route("/all/<username>")
def all(username):
    result= {"username":username, "helpMessage":getAllMessage(username)}
    return jsonify(result)

@app.route("/init/<username>")
def init(username):
    if redis.exists(username) :
        return jsonify({"error" : "user already exists"})
    else:
        redis.set(username, 0)
        return jsonify({"succes" : "user created"})


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
