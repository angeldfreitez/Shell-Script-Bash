#!/bin/bash



	a=( a b s d e )

	echo ${a[0]}
	echo ${a[1]}

	a=("${a[@]}" "AIX" "HP-UX")
	

	echo ===============
	echo ${a[*]}