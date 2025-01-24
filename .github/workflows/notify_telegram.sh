#!/bin/bash

# Check if the required environment variables are set
if [ -z "$TELEGRAM_BOT_TOKEN" ] || [ -z "$CHAT_ID" ] || [ -z "$ERROR_LOG_PATH" ]; then
  echo "Error: Required environment variables are not set."
  exit 1
fi

# Check if the error log file exists
if [ -f "$ERROR_LOG_PATH" ]; then
  # Send the error log to Telegram
  curl -F chat_id="$CHAT_ID" \
       -F text="Build failed on ${DEVICE_CODE}" \
       -F document=@"$ERROR_LOG_PATH" \
       "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendDocument"
else
  echo "No error.log found."
fi
