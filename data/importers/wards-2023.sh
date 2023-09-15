#!/usr/bin/env bash

source importers/utils.sh

function add_wards(){
	local database=$1
	shift

	rm -r build/wards-23
	mkdir -p build/wards-23
	unzip "downloads/Wards_(May_2023)_Boundaries_UK_BGC.zip" -d build/wards-23 

	local converted=$(reproject_shp "build/wards-23/WD_MAY_2023_UK_BGC.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "wards_23" -g geometry -c utf-8 -s 4326
}

add_wards $1
