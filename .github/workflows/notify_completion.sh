#!/bin/bash

# Notify Telegram when the build completes
MESSAGE=$1
# Replace with your Telegram bot token and chat ID
BOT_TOKEN=${{ secrets.BOT_TOKEN }}
CHAT_ID=${{ secrets.CHAT_ID }}

curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
     -d "chat_id=$CHAT_ID&text=$MESSAGE"
