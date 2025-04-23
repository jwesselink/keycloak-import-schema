#!/bin/bash

# Define array of versions
versions=("26.0.5")

# Create directories if they don't exist
mkdir -p tmp
mkdir -p schema

# Loop through each version
for version in "${versions[@]}"; do
  echo "Processing version $version..."

  # Construct URL and filenames
  url="https://www.keycloak.org/docs-api/${version}/rest-api/openapi.json"
  input_file="tmp/openapi-${version}.json"
  output_file="schema/import-schema-${version}.json"

  # Download the OpenAPI spec
  echo "Downloading OpenAPI spec from $url"
  curl -sSfL "$url" -o "$input_file"

  # Check if download was successful
  if [[ $? -ne 0 ]]; then
    echo "Failed to download $url"
    continue
  fi

  # Run the conversion script
  echo "Converting $input_file to $output_file"
  ./convert.sh "$input_file" "$output_file"
done