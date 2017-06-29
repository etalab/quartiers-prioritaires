#!/bin/bash

CACHE_DIR=.cache
TMP_DIR=.tmp
DIST_DIR=dist
SRC_DATASET_URL="http://www.ville.gouv.fr/squelettes/carto/assets/qp-politiquedelaville-shp.zip"
SRC_DATASET_DST=$CACHE_DIR/qp-politiquedelaville-shp.zip
SRC_LAYER_TO_EXTRACT=QP_METROPOLEOUTREMER_WGS84_EPSG4326
CONVERTED_DATASET=$TMP_DIR/qp-converted.json
TRANSFORMED_DATASET=$TMP_DIR/qp-transformed.json
FINAL_DATASET=$DIST_DIR/qp.json

echo "Ensure .cache directory exists"
mkdir -p $CACHE_DIR

echo "Ensure .tmp directory exists"
mkdir -p $TMP_DIR

echo "Ensure dist directory exists"
mkdir -p $DIST_DIR

echo "Download source dataset"
wget -P $CACHE_DIR/ -N $SRC_DATASET_URL

echo "Extract France dataset and convert to raw GeoJSON"
rm -f $CONVERTED_DATASET && ogr2ogr -f GeoJSON $CONVERTED_DATASET /vsizip/$SRC_DATASET_DST $SRC_LAYER_TO_EXTRACT

echo "Transform dataset"
node transform

echo "Copy produced dataset to dist"
rm -f $FINAL_DATASET && cp $TRANSFORMED_DATASET $FINAL_DATASET

echo "Clean .tmp directory"
rm -Rf $TMP_DIR

echo "Finished"
