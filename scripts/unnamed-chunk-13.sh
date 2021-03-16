touch playground/test_zip.txt
ls -l playground > playground/test_zip.txt # create a file and add content
ls -l playground

cat playground/test_zip.txt # show the original file
gzip playground/test_zip.txt # this will compress the file the original will no longer be available, there is an option to keep both
cat playground/test_zip.txt.gz # show the file was zipped

gunzip playground/test_zip.txt.gz # will unzip the file back to the original.
