# census-tools

Simple tools with which to analyse, interpret, and visualise British census
data.

## Using this with QGIS

cd to `data/`, then:

1. Make sure you have `sqlite`, `ogr2ogr`, and `spatialite` installed.

2. Download your data into `downloads/`.

3. Run `./run build`. This should build a Spatialite database inside databases/.

Open QGIS, add this Spatialite database as a source, and you should be able to
add layers from tables inside it.
