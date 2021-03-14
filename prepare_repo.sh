# Use this script to merge the .Rmd export (r-code used to export shell scripts) to prepare this document to pure bash script
awk 'FNR==1{print ""}{print}' scripts/* > pure_scripts.sh

# Move and rename the .md built to top level
cp build-md/build/cs-bash.md ./README.md
