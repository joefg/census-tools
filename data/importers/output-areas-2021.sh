#!/usr/bin/env bash

source importers/utils.sh

function add_oas(){
	local database=$1
	shift

	rm -rf build/oa-21
	mkdir -p build/oa-21
	unzip "downloads/Output_Areas_2021_EW_BGC_V2.zip" -d build/oa-21

	local converted=$(reproject_shp "build/oa-21/OA_2021_EW_BGC_V2.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "oa_21" -g geometry -c utf-8 -s 4326
}

add_oas $1
