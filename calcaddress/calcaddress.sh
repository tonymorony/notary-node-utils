#!/bin/bash
curl -s --url "http://127.0.0.1:7783" --data "{\"userpass\":\"1d8b27b21efabcd96571cd56f91a40fb9aa4cc623d273c63bf9223dc6f8cd81f\",\"method\":\"calcaddress\",\"passphrase\":\"$1\",\"coin\":\"$2\"}"

