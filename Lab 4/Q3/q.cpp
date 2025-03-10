#include <iostream>
#include <stdlib.h>
using namespace std;
/*
E->TE'
E'->+TE'|null
T-> FT'
T'->*FT'|null
F-> id|(E)
*/
int count = 0;
void E();
void Ed();
void T();
void Td();
void F();

string expr;

int main() {
  cin >> expr;
  int l = expr.length();
  expr += "$";
  E();
  if (l == count)
    cout << "Accepted" << endl;
  else
    cout << "Rejected" << endl;
}

void E() {
  cout << "E->TE'" << endl;
  T();
  Ed();
}

void Ed() {
  if (expr[count] == '+') {
    count++;
    cout << "E'->+TE'" << endl;
    T();
    Ed();
  }
  else {
    cout << "E'->null" << endl;
  }
}

void T() {
  cout << "T->FT'" << endl;
  F();
  Td();
}

void Td() {
  if (expr[count] == '*') {
    count++;
    cout << "T'->*FT'" << endl;
    F();
    Td();
  }
  else {
    cout << "T'->null" << endl;
  }
}

void F() {
  if (isalpha(expr[count])) {
    count++;
    cout << "F->id" << endl;
  } else if (expr[count] == '(') {
    count++;
    cout << "F->(E)" << endl;
    E();
    if (expr[count] != ')') {
      cout << "Rejected" << endl;
      exit(0);
    }
    count++;
  } else {
    cout << "Rejected" << endl;
    exit(0);
  }
}
