#!/usr/bin/env bash

source importers/utils.sh

function add_msoas(){
	local database=$1
	shift

	rm -rf build/msoa-21
	mkdir -p build/msoa-21
	unzip "downloads/MSOA_2021_EW_BGC_V2.zip" -d build/msoa-21

	local converted=$(reproject_shp "build/msoa-21/MSOA_2021_EW_BGC_V2.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "msoa_21" -g geometry -c utf-8 -s 4326
}

add_msoas $1
