# keycloak-import-schema

This repository provides a JSON Schema for the `RealmRepresentation` object used in Keycloak's import/export functionality. The schema is extracted from Keycloak's OpenAPI specification and can be used to validate or generate realm import JSON or YAML files.

## Usage

Intellij will automatically validate your JSON and YAML files against the schema if you include the `$schema` keyword.

### Including the Schema in Your JSON or YAML Files

#### JSON Example

To include the schema in a JSON file for validation, use the `$schema` keyword:

```json
{
  "$schema": "https://raw.githubusercontent.com/jwesselink/keycloak-import-schema/refs/heads/main/schema/import-schema-26.0.5.json",
  "id": "my-realm",
  "realm": "example",
  "enabled": true,
  "clients": [
    {
      "clientId": "test-client",
      "name": "test-client"
    }
  ]
}
```

#### YAML Example

To include the schema in a YAML file, use the `$schema` keyword:

```yaml
$schema: "https://raw.githubusercontent.com/jwesselink/keycloak-import-schema/refs/heads/main/schema/import-schema-26.0.5.json"
id: my-realm
realm: example
enabled: true
clients:
  - clientId: "test-client"
    name: "test-client"
```
