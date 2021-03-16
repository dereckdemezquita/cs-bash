cat data/rcsb_pdb_6E5B.fasta | tail -n +1 | cut -c4- | sort -k1 | uniq | awk '{print $1 "\t" $4}' | head

cat data/rcsb_pdb_6E5B.fasta | tail -n +1 | cut -c4- | sort -k1 | uniq | awk '{print $1 "\t" $4}' | gzip > playground/newfile.txt.gz
