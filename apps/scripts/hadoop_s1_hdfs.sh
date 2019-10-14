THIS_FILE=$(readlink -f "$0")
THIS_PATH=$(dirname "$THIS_FILE")

years="2019"
months="01 02 03 04"
days="01 02 03 04"
hours="01 02 03 04"
suffixes="0000 0001"

for y in $years; do
  for m in $months; do
    for d in $days; do
      for h in $hours; do
	 for suffix in $suffixes; do     
	   hadoop fs -mkdir -p /bdpc/data/hdfs/source/$y/$m/$d/$h	 
	   hadoop fs -put $THIS_PATH/data_sample /bdpc/data/hdfs/source/$y/$m/$d/$h/file-$suffix
         done 
      done	      
    done	    
  done	  
done
