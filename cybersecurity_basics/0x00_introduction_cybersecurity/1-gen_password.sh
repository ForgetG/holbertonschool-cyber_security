#!/bin/bash
tr -cd [:alnum:] < /dev/urandom | head -c "$1"
