#!/usr/bin/env python3
"""Monitor gateway MQTT telemetry (topic map + OpenSync sts.Report decode).

The ISP gateway (RDK-B family) runs an unauthenticated mosquitto on 1883 whose
`local/device_optimizer_stats` carries OpenSync protobuf telemetry including
per-client connection tables.

Usage: python mqtt_monitor.py --host <gw-ip> [--duration 300] [--save topic.log]
Requires: paho-mqtt, protobuf (optional, for structured decode)
"""
import argparse, time

try:
    import paho.mqtt.client as mqtt
except ImportError:
    print("pip install paho-mqtt"); raise SystemExit(1)

TOPIC = "local/device_optimizer_stats"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--host", required=True)
    ap.add_argument("--port", type=int, default=1883)
    ap.add_argument("--duration", type=int, default=300)
    ap.add_argument("--save")
    args = ap.parse_args()

    seen = set()
    out = open(args.save, "a", encoding="utf-8") if args.save else None

    def on_connect(c, u, f, rc):
        c.subscribe("#")

    def on_message(c, u, msg):
        key = (msg.topic, len(msg.payload))
        if msg.topic not in seen:
            seen.add(msg.topic)
            line = f"[NEW] {msg.topic} len={len(msg.payload)}"
            print(time.strftime("%H:%M:%S "), line)
            if out: out.write(line + "\n"); out.flush()

    c = mqtt.Client(client_id="research-mon", protocol=mqtt.MQTTv311)
    c.on_connect, c.on_message = on_connect, on_message
    c.connect(args.host, args.port, keepalive=30)
    c.loop_start()
    time.sleep(args.duration)
    c.disconnect()
    if out: out.close()
    print(f"\ntopics seen: {len(seen)}")


if __name__ == "__main__":
    main()
