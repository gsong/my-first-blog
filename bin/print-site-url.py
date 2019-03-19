#!/usr/bin/env python

import json
import os
import sys

json_src = sys.stdin.read()
if len(json_src.strip()) > 0:
    config = json.loads(json_src)
    addr = config.get("Driver", {}).get("IPAddress")
    if addr:
        url = "http://%s:%s/" % (addr, os.environ.get("APP_PORT", "8000"))
        hr = "-" * len(url)
        print("\n\n")
        print(hr)
        print("Your website's address is:")
        print(hr)
        print(url)
        print(hr)
