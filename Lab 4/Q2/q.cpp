#include<bits/stdc++.h>
using namespace std;

int find_comm_pre(vector<string> &breaked_str , int s , int e , int ind)
{
    for(int i = s ; i < e ; i++)
    {
        if(breaked_str[i][ind] != breaked_str[i+1][ind])
            return 0;
    }
    return find_comm_pre(breaked_str , s , e , ind+1) + 1;
}

int find_how_many(vector<string> &breaked_str , int s , int e , int ind)
{
    for(int i = s ; i < e ; i++)
    {
        if(breaked_str[i][ind] != breaked_str[i+1][ind])
            return i;
    }
}

void helper(vector<string> &breaked_str , int s , int e , int ind , string pre)
{
    if(s > e)
        return;
    if(s == e){
        cout <<"\n"<< pre <<"->";
        cout << breaked_str[s].substr(ind);
        return;
    } 
    int in = find_comm_pre(breaked_str , s , e , ind);
    //cout << s <<" " << e <<" "<< ind << " "<< in<<"\n";
    if(in != 0)
    {
        cout <<"\n"<< pre <<"->";
        cout << breaked_str[s].substr(ind , in);
        cout << pre <<"'";
        pre = pre + "'";
        helper(breaked_str , s , e , ind+in , pre);
    }
    else
    {
        int start = s;
        int t = find_how_many(breaked_str , s , e , ind);
        helper(breaked_str , s , t , ind , pre);
        helper(breaked_str , t+1 , e , ind , pre);
    }
}

int main()
{
    string s;
    cin >> s;
    char *st , *e , *input , *t;
    input = new char [s.length()+1];
    strcpy(input , s.c_str());
    st = strtok(input , "->");
    vector<string> breaked_str;
    e = strtok(NULL , "->");
    t = strtok(e , "|");
    while(t)
    {
        breaked_str.push_back(t);
        t = strtok(NULL , "|");
    }
    sort(breaked_str.begin() , breaked_str.end());
    int len = breaked_str.size();
    // cout << st <<"->";
    helper(breaked_str , 0 , len-1 , 0 , st);
    return 0;
}