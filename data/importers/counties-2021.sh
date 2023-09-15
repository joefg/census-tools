#!/usr/bin/env bash

source importers/utils.sh

function add_counties(){
	local database=$1
	shift

	rm -rf build/counties-21
	mkdir -p build/counties-21
	unzip "downloads/Counties_(May_2021)_EN_BGC.zip" -d build/counties-21

	local converted=$(reproject_shp "build/counties-21/CTY_MAY_2021_EN_BGC.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "counties_21" -g geometry -c utf-8 -s 4326
}

add_counties $1
