awk 'NF' data/mtcars.csv data/mtcars.csv | sort | head -n 5

awk 'NF' data/mtcars.csv data/mtcars.csv > playground/duplicated.csv
