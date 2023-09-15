#!/usr/bin/env bash

source importers/utils.sh

function add_pcons(){
	local database=$1
	shift

	rm -rf build/pcon-22
	mkdir -p build/pcon-22
	unzip "downloads/Westminster_Parliamentary_Constituencies_Dec_2022_UK_BGC.zip" -d build/pcon-22

	local converted=$(reproject_shp "build/pcon-22/PCON_DEC_2022_UK_BGC.shp" "EPSG:4326")

	spatialite_tool -i -shp "${converted}" -d "$database" \
		-t "pcon_22" -g geometry --charset utf-8 --srid 4326
}

add_pcons $1
