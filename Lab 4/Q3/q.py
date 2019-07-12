lines=int(input('Enter number of lines\n'))
grammer=[]
non_term=[]
for i in range(0,lines):
    grammer.append(input('Enter string\n'))

dest_string=input('enter string to be generated from grammer\n')

def findnon_term():
	
	for i in range(0,len(grammer)):
		temp2=grammer[i]
		a=temp2.find('->')
		if temp2[0:a] not in non_term:
			non_term.append(temp2[0:a])


def rec_descent(list_temp,cur_string,i,dest_string,j):

    if len(cur_string)>len(dest_string)+2:
        return
    if (cur_string==dest_string):
        for y in list_temp:
            print (y)
        print('***************')
        return
    if i>=len(cur_string) or j>len(dest_string):
        return
    else:
        if j<len(dest_string) and (dest_string[j] == cur_string[i]):
            rec_descent(list_temp,cur_string,i+1,dest_string,j+1)
            return
        elif cur_string[i] not in non_term:
            return
        else:
            for m in grammer:
                if m.startswith(cur_string[i]):
                    y=m.split('->')
                    x=y[1].split('|')
                    for n in x:
                        list_temp.append(y[0]+'->'+n)
                        if n=='epsilon':
                            n=''
                        rec_descent(list_temp,cur_string[0:i]+cur_string[i:].replace(cur_string[i],n,1),i,dest_string,j)
                        #print(list_temp)
                        list_temp.pop()


list_temp=[]
findnon_term()
alpha=grammer[0].split('->')
beta=alpha[1].split('|')
for gamma in beta:
    if gamma=='epsilon':
        continue
    list_temp.append(alpha[0]+'->'+gamma)
    rec_descent(list_temp,gamma,0,dest_string,0)
    list_temp.pop()