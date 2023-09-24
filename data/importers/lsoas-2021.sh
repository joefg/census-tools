#!/usr/bin/env bash

source importers/utils.sh

function add_lsoas(){
	local database=$1
	shift

	rm -rf build/lsoa-21
	mkdir -p build/lsoa-21
	unzip "downloads/Lower_layer_Super_Output_Areas_2021_EW_BGC_V3.zip" -d build/lsoa-21

	local converted=$(reproject_shp "build/lsoa-21/LSOA_2021_EW_BGC_V3.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "lsoa_21" -g geometry -c utf-8 -s 4326
}

add_lsoas $1
