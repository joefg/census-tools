# census-tools

Simple tools with which to analyse, interpret, and visualise British census
data.

## Notebook

A runfile is provided for your convenience.

`./run restore` fetches all dependencies and `./run dev` spawns a Jupyter
notebook server, containing `geopandas` and `plotly` packages.

## Data

`cd` to `data/`, then:

1. Make sure you have `sqlite`, `ogr2ogr`, and `spatialite` installed.

2. Download your data into `downloads/`.

3. Run `./run build`. This should build a Spatialite database inside `databases/`.

Open QGIS, add this Spatialite database as a source, and you should be able to
add layers from tables inside it.
