#!/bin/bash
STATIC_PATH="leselys/static"
echo ":: Install tools"
pip install slimit cssmin

echo ":: Minify javascripts"
cat	$STATIC_PATH/js/crel.js  \
	$STATIC_PATH/js/mousetrap.js \
	$STATIC_PATH/js/tinybox.js \
	$STATIC_PATH/js/ajax.js \
	$STATIC_PATH/js/api.js \
	$STATIC_PATH/js/leselys.js \
	> $STATIC_PATH/js/leselys.tmp.js
slimit < $STATIC_PATH/js/leselys.tmp.js	> $STATIC_PATH/js/leselys.min.js
rm $STATIC_PATH/js/leselys.tmp.js

echo ":: Minify css"
cat $STATIC_PATH/css/font-awesome.min.css \
	$STATIC_PATH/css/bootstrap-responsive.min.css \
	$STATIC_PATH/css/leselys.css \
	| cssmin > $STATIC_PATH/css/leselys.min.css