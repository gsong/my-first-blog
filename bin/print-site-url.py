#!/usr/bin/env python

import os
import sys
import json

json_src = sys.stdin.read()
if len(json_src.strip()) > 0:
    config = json.loads(json_src)
    addr = config.get('Driver', {}).get('IPAddress')
    if addr:
        url = "http://%s:%s/" % (addr, os.environ.get('APP_PORT', '8000'))
        print("-" * len(url))
        print(url)
        print("-" * len(url))
