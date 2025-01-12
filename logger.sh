#!/bin/sh

if [ $# -ne 1 ]; then
    echo "Incorrect number of arguments"
    exit 1
fi

LOG_DIR="$1"

if [ ! -d "$LOG_DIR" ]; then
    echo "Directory doesn't exist"
    exit 1
fi

OUTPUT_DIR="archive_logs"
mkdir -p "$OUTPUT_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_$TIMESTAMP.tar.gz"

if [ "$(ls -A "$LOG_DIR")" ]; then  
    tar -czf "$OUTPUT_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .
    echo "Logs archived from '$LOG_DIR' to $TIMESTAMP" >> archive_log.txt  
    echo "Logs compressed at $OUTPUT_DIR/$ARCHIVE_NAME and written to the log file."
else  
    echo "No files to compress in '$LOG_DIR'"
    exit 1  
fi





