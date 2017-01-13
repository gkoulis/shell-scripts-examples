#!/bin/bash

echo -n "$(date) - Connections (this month): "

last | grep $(date +"%b") | grep 'root' | wc -l

