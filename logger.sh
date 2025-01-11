#!/bin/sh

if [$# -ne 1]; then
    echo "Incorrect number of arguments"
    exit 1
fi

LOG_DIR="$1"

if [!-d "$LOG_DIR"]; then
    echo "Directory doesn't exist"
    exit 1
fi

OUTPUT_DIR="archive_logs"
mkdir -p "$OUTPUT_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_$TIMESTAMP.tar.gz"

tar -czf"$OUTPUT_DIR/$ARCHIVE_NAME" -C"$LOG_DIR"

echo "Logs archivated from '$LOG_DIR' to $TIMESTAMP" >> archive_log.txt
echo "Logs compressed at $OUTPUT_DIR/$ARCHIVE_NAME and writen to the log file" 





