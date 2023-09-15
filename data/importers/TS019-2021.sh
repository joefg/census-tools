#!/usr/bin/env bash

function add_ts019() {
	local database=$1
	shift
	sqlite3 $database ".import --csv downloads/TS019-2021.csv ts019"
}

add_ts019 $1
