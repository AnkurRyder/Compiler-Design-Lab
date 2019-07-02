#include<bits/stdc++.h>
#include <regex> 
using namespace std;
int main() {
    string s;
    getline(cin, s);
    vector <string> tokens;       
    stringstream check1(s); 
    string in;
    vector<string> ans;
    //regex re ((?:^|\W)rocket(?:$|\W)) 
    while(getline(check1, in, ' ')) 
    {   
        int t = 0;
        regex re ("^[a-zA-Z]+$");
        regex i ("(?:^|)if(?:$|)");
        regex e ("(?:^|)else(?:$|)");
        regex th ("(?:^)then(?:$|)");
        smatch match;
        if(regex_match(in, i) && !t) {
            t = 1;
            ans.push_back("< if, " + in + " >");
        }else if(regex_match(in ,th) && !t){
            t = 1;
            ans.push_back("< then, " + in + " >");
        }else if(regex_match(in ,e) && !t) {
            t = 1;
            ans.push_back("< else, " + in + " >");
        }
        regex rx(R"((?:^|\s)([+-]?[[:digit:]]+(?:\.[[:digit:]]+)?)(?=$|\s))");
        if(regex_match(in, rx) && !t){
            t = 1;
            ans.push_back("< number, " + in + " >");
        }
        regex ra("=|<|>=|<=|>|==");
        if(regex_match(in, ra) && !t){
            t = 1;
            ans.push_back("< relop, " + in + " >");
        }
        regex rid("^([a-zA-Z])([a-zA-Z0-9])*+$");
        if(regex_match(in, rid) && !t){
            t = 1;
            ans.push_back("< id, " + in + " >");
        }
        if(t == 0){
            ans.push_back("< Unidentified, " + in + " >");
        }
        tokens.push_back(in); 
        
    }  
    for(int i = 0;i<ans.size();i++){
        cout<<ans[i]<<endl;
    }
}