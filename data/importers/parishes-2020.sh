#!/usr/bin/env bash

source importers/utils.sh

function add_parishes(){
	local database=$1
	shift

	rm -rf build/parishes-20
	mkdir -p build/parishes-20
	unzip "downloads/Parishes_(Dec_2020)_EW_BGC.zip" -d build/parishes-20

	local converted=$(reproject_shp "build/parishes-20/PAR_DEC_2020_EW_BGC_V2.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "parishes_20" -g geometry -c utf-8 -s 4326

	add_indexes "$database" "parishes_20" | spatialite $database
}

add_parishes $1
