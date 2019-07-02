# include <bits/stdc++.h>
using namespace std;

map<string , string> m;

int main()
{
    m["if"] = "if"; m["else"] = "else"; m["then"] = "then"; 
    m[">"] = "relop";
    m["<"] = "relop";
    m["<="] = "relop";
    m[">="] = "relop";
    m["="] = "relop";
    char str[] = "if input < 10 then output1 = 100 else output2 = 200"; 
  
    // Returns first token  
    char *token = strtok(str, " "); 
  
    // Keep printing tokens while one of the 
    // delimiters present in str[]. 
    while (token != NULL) 
    {
        if(m[token] == "")
            cout << "id" <<" ";
        else
        {
            cout << m[token] <<" ";
        }
        token = strtok(NULL, " "); 
    }
    
}