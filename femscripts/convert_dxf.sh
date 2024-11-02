


echo $PWD

for file in $PWD/*.dxf;do
	    perl ../femscripts/dxf2geo.pl $file
done
