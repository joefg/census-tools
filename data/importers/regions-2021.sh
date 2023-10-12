#!/usr/bin/env bash

source importers/utils.sh

function add_regions(){
	local database=$1
	shift

	rm -rf build/regions-21
	mkdir -p build/regions-21
	unzip "downloads/Regions_(December_2021)_EN_BGC.zip" -d build/regions-21 

	local converted=$(reproject_shp "build/regions-21/RGN_DEC_2021_EN_BGC.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "regions_21" -g geometry -c utf-8 -s 4326

	add_indexes "$database" "regions_21" | spatialite $database
}

add_regions $1
