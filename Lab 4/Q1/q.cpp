#include <iostream>
#include <string>
#include <cstring>
#include<vector>
#include<stdio.h>
#include<string.h>

using namespace std;

int main()  {
    char *input;
    char *l,*r,*temp,tempprod[20],productions[25][50];
    int i=0,j=0,flag=0 , n;
    cout << "Enter Number of productions: ";
    cin >> n;
    vector<string> s(n);
    printf("Enter the productions\n");
    for(int i = 0 ;i < n ; i++)
        cin >> s[i];
    int last = 0;
    for(int k = 0 ; k < n ; k++){
        input = new char [s[k].length()+1];;
        strcpy(input , s[k].c_str());
        l = strtok(input,"->");
        r = strtok(NULL,"->");
        temp = strtok(r,"|");
        last = i;
        while(temp)  {
            if(temp[0] == l[0])  {
                flag = 1;
                sprintf(productions[i++],"%s'->%s%s'\0",l,temp+1,l);
            }
            else
                sprintf(productions[i++],"%s->%s%s'\0",l,temp,l);
            temp = strtok(NULL,"|");
        }
        sprintf(productions[i++],"%s'->\u03B5",l);
        if(flag == 0)
            cout <<"\n"<< s[k] << "\n";
        else{
            for(j=last;j<i;j++)  {
                printf("\n%s",productions[j]);
            }
        }
        flag = 0;
    }
    return 0;
}