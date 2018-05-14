import csv
def foo(f1):
   f3=open(f1,'r')
   lines=f3.readlines()
   l=[[x.strip('\n')] for x in lines]
	#print(k)
	#print(l)
   out=csv.writer(open("out_project_my.csv","w"), delimiter=',',quoting=csv.QUOTE_ALL)
   o=[]
   for i in l:
      p=[]
      if 'web designing' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'research project' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'data analytics' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'back end designing' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'big data' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'app development' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'paper presentation' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      if 'operating system' in i[0]:
         p.append('yes')
      else:
         p.append('no')
      o.append(p)
	     
   print(o)
   for i in o:
      out.writerow(i)
                 
foo("data_final_py.csv")      
	     
