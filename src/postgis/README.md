
# Postgis (postgis)

PostGIS extends the capabilities of the PostgreSQL relational database by adding support for storing, indexing, and querying geospatial data.

## Example Usage

```json
"features": {
    "ghcr.io/Guistoff081/features/postgis:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| pgVersion | Choose the PostgreSQL version you have installed. This is used to install the correct PostGIS version and command line tools. | string | latest |
| version | Choose the PostGIS version to install.  | string | latest |
| installTools | Install PostGIS commandline tools shp2pgsql, raster2pgsql. | boolean | true |



---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/Guistoff081/features/blob/main/src/postgis/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
