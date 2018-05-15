import csv
def foo(f1):
	f3=open(f1,'r')
	lines=f3.readlines()
	l=[[x.strip('\n')] for x in lines]
	#print(k)
	#print(l)
	out=csv.writer(open("out.csv","w"), delimiter=',',quoting=csv.QUOTE_ALL)
	o=[]
	for i in l:
	     p=[]
	    # print(k[0])
	     #print(l)
	     if 'C' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'PYTHON' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'JAVA' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'C++' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'C#' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'F#' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'JAVA SCRIPT' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'HTML' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     if 'RUBY' in i[0]:
	         p.append('yes')
	     else:
	         p.append('no')
	     o.append(p)
	     
	print(o)
	for i in o:
	   out.writerow(i)
                 
foo("data_final.csv")      
	     
