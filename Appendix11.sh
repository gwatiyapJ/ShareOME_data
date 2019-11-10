#!/bin/sh
## netCTLpan script

# Usage: ./netCTLpan_v1.sh A2_alleles.txt SharesNonames.fasta ("$line"_pan_out.txt "$line"_panPredicted.txt = $3 and $4)

#export JAVA_HOME=/opt/jdk1.7.0_60
export JAVA_HOME=/usr/bin/java
# Remove pre-existing result files
rm -fr pan_*

# Predict T-cell epitopes through NetCTLpan
        #/home/james/immuneXterization/netCTLpan-1.1/netCTLpan -a $1 -s 0 $2 >> $3
		netCTLpan -a $1 -s 0 $2 >> $3
# Extract only the line specifying the supertype predicted and epitopes
        #grep 'Number of MHC ligands\|<-E' pan_out.txt > pan_predicted.txt

# Extract only the line specifying the supertype predicted and epitopes without "Number..." line
	grep '<-E' pan_out.txt | awk -F" " '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}' > pan_predicted.txt
	#grep '<-E' $3 | awk -F" " '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10}'| sed 's/ /;/g' > $4
	
# Get the seq id [TEST]
# grep -v "Number" pan_predicted.txt | awk '{print $2}' | cut -d '|' -f2
