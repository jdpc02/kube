#!/bin/bash
find . ./* -type f ! -name "convert.sh" -exec dos2unix {} \;
