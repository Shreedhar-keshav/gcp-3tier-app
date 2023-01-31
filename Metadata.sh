#!/bin/bash

# Get metadata in JSON format
metadata=$(curl "http://metadata.google.internal/computeMetadata/v1/instance/disks/?recursive=true&alt=json" -H "Metadata-Flavor: Google")

# Print the metadata
echo $metadata | jq '.'
