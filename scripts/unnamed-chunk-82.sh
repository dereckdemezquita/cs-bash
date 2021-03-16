cat data/SC.gtf | grep -e "transcript\t" | awk '{print $1"\t"$4"\t"$5"\t"$10"\t0\t"$7}' | sed 's/[;\*]//g' | sed 's/["\*]//g' | head
