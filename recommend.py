import os
import re
import shlex
import csv
v=dict()
v['Software developer']=['C','C++','JAVA','C#','PYTHON','RUBY','F#']
v['Data scientist']=['PYTHON','R','SAS']
v['Web Developer']=['HTML','CSS','JAVASCRIPT','JQUERY','HTML5']
v['Mobile app developer']=['XML','JAVA','C','C++']
v['Backend web developer']=['PHP','SQL','PYTHON']
print(v)
def foo(f1):
      f=open(f1,'r')
      l=[ [i.replace('"', '').strip('\n')] for i in f.readlines()]
      print(l)  
      out=csv.writer(open("out_rec.csv","w"), delimiter=',',quoting=csv.QUOTE_ALL)
      o=[]
      for i in l:
            p=[]
            if 'Software developer' in i[0]:
	             p.append('Software developer')
            
	             for j in v['Software developer']:
                    if j in i[0]:
                        p.append("Known:"+j)
                    else:
                        p.append("recommend:"+j)
            elif 'Data scientist' in i[0]:
	               p.append('Data scientist')
     	            for j in v['Data scientist']:
                    
                        if j in i[0]:
                           p.append("known:"+j)
                        else:
                            p.append("recommend:"+j)
            elif 'Web Developer' in i[0]:
	               p.append('Web Developer')
            

	               for j in v['Web Developer']:
                     if j in i[0]:
                        p.append("known:"+j)
                     else:
                        p.append("recommend:"+j)
              
            elif 'Mobile app developer' in i[0]:
	            p.append('Mobile app developer')
	            for j in v['Mobile app developer']:
                    if j in i[0]:
                        p.append("Known:"+j)
                    else:
                        p.append("recommend:"+j)
            elif 'Backend web developer' in i[0]:
	            p.append('Backend web developer')
	            for j in v['Backend web developer']:
                    if j in i[0]:
                        p.append("Known:"+j)
                    else:
                        p.append("recommend:"+j)

            o.append(p)
    
      
      print(o)
for i in o:
	   out.writerow(i)    '''  

foo('data_final_py.csv')
