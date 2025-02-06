#!/bin/bash

# Wait for Blazegraph to start
echo "Waiting for Blazegraph to start..."
until curl -f http://localhost:8889/bigdata 2>/dev/null; do
    sleep 5
done


# Trigger the data import
echo "Loading data into Blazegraph..."
curl -X POST \
  --data-binary @dataloader.txt \
  --header 'Content-Type:text/plain' \
  http://localhost:8889/bigdata/dataloader

echo "Data loading complete!"
