
import sys
import re
import math
# arg1 for input file
# arg2 for out file

# in/out file declare
infile=open(sys.argv[1],'r')
outfile=open(sys.argv[2],'wb')

test_pattern=r'.\w*\.\w+'	
Data_rate=[]
Threshold1=172.5
label=0;
i=0
temp_list=[];
outfile.write('class,Max_Ecio,Min_Ecio,Std_Ecio,Max_Rscp,Std_Rscp'+'\n');
while True :
	string=infile.readline()
	if not string:
		break	
	match=re.findall(test_pattern,string)
	print match
	if match:
		temp_list=match
		if float(temp_list[0]) > Threshold1:
			outfile.write('yes'+',')
		else:
			outfile.write('no'+',')
		for i in range(1,len(temp_list)):
			if i != len(temp_list)-1:
				outfile.write(str(temp_list[i])+',')
			else:
				outfile.write(str(temp_list[i]))	
		outfile.write('\n')
total_lines=i
infile.close()
outfile.close()	