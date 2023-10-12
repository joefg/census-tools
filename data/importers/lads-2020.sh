#!/usr/bin/env bash

source importers/utils.sh

function add_lads(){
	local database=$1
	shift

	rm -rf build/lad-20
	mkdir -p build/lad-20
	unzip "downloads/LAD_DEC_2020_UK_BGC.zip" -d build/lad-20

	local converted=$(reproject_shp "build/lad-20/LAD_DEC_2020_UK_BGC.shp" "EPSG:4326")
	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "lad_20" -g geometry -c utf-8 -s 4326

	add_indexes "$database" "lad_20" | spatialite $database
}

add_lads $1
