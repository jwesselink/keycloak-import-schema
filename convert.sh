#!/bin/bash

# Check for input file
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <openapi_file.json> <output_file.json>"
  exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Extract RealmRepresentation schema and include full components.schemas so references can be resolved
jq '{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Keycloak import realm schema",
  "type": "object",
  "properties": .components.schemas.RealmRepresentation.properties,
  "components": {
      "schemas": (
        .components.schemas
        | with_entries(select(.key != "RealmRepresentation"))
      )
  }
}' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "JSON Schema for RealmRepresentation written to $OUTPUT_FILE"
