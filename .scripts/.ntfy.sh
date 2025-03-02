#!/bin/bash
# Simple telegram bot toknotify myself from command line.
# Maybe turn into a real bot with more useful functionality via rust framework.

TOKEN=8185728034:AAHeC_NgYdZXxVsaLeRAtvLeOf241sfYHkU

echo -e "NOTIFIED TELEGRAM"
curl -X POST -H "Content-Type:multipart/form-data" \
-F chat_id=6739543348 \
-F text="CLI NOTIFICATION TRIGGERED!" "https://api.telegram.org/bot$TOKEN/sendMessage"
