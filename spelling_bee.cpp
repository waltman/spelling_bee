#include <stdio.h>
#include <iostream>
#include <fstream>
#include <string>
#include <set>

using namespace std;
const string DICT = "/usr/share/dict/american-english-large";

int main(int argc, char *argv[]) {
    const string s(argv[1]);
    const char middle = s[0];
    set<char> chars;
    for (const char c : s)
        chars.insert(c);

    ifstream infile(DICT);
    if (!infile) {
        perror(DICT.c_str());
        exit(1);
    }

    string line;
    while (infile >> line) {
        if (line.length() < 4)
            continue;
        
        bool found_middle = false;
        bool found_bad_char = false;
        for (const char c : line) {
            if (chars.find(c) == chars.end()) {
                found_bad_char = true;
                break;
            } else if (c == middle)
                found_middle = true;
        }
        if (found_middle && !found_bad_char)
            cout << line << endl;
    }
}
