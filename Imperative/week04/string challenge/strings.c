/* Custom versions of standard string functions. */
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

// Find the length of a string, assuming it has a null terminator (like strlen).
int length(const char s[]) {
    int i = 0;

    while (s[i] != '\0') {
        i++;
    }

    int length = i;
    return length;
}

// Copy string s into the character array t (like strcpy).
void copy(char t[], const char s[]) {
    int i = 0;

    while (s[i] != '\0') {
        t[i] = s[i];
        i++;
    }

    while (t[i] != '\0') {
        t[i] = '\0';
        i++;
    }
}

// Compare two strings, returning negative, zero or positive (like strcmp).
int compare(const char s[], const char t[]) {
    int compare;

    if (s < t) {
        compare = -1;
    } else if (s > t) {
        compare = 1;
    } else {
        compare = 0;
    }

    return compare;
}

// Join string s to the end of string t (like strcat).
void append(char t[], const char s[]) {
    int lenT = length(t);
    int lenS = length(s);
    int i = 0;

    while (i < length(s)) {
        t[lenT + i] = s[i];
        i++;
    }

    t[lenT + i] = '\0';
}

// Find the (first) position of s in t, or return -1 (like strstr).
int find(const char t[], const char s[]) {
    int i = length(s) - 1;
    int j = length(t) - 1;
    int found = -1;

    while (i >= 0) {
        while (j >= 0) {
            if (s[i] == t[j]) {
                found = j;
                printf("%d", found);
            }
            j--;
        }
        j = length(t) - 1;
        i--;
    }

    printf("%d\n", found);
    return found;
}

// -----------------------------------------------------------------------------
// Tests and user interface

// Custom assert function to replace the one in assert.h. Reports the test
// number, not the line number.
void assert(bool b) {
    static int testNumber = 0;
    testNumber++;
    if (! b) {
        printf("Test %d failed\n", testNumber);
        exit(1);
    }
}

// Tests 1 to 5
void testLength() {
    assert(length("") == 0);
    assert(length("c") == 1);
    assert(length("ca") == 2);
    assert(length("cat") == 3);
    char s[] = "dog";
    assert(length(s) == 3);
}

// Tests 6 to 9
void testCopy() {
    char t[10];
    copy(t, "cat");
    assert(t[0] == 'c' && t[1] =='a' && t[2] == 't' && t[3] =='\0');
    copy(t, "at");
    assert(t[0] == 'a' && t[1] =='t' && t[2] =='\0');
    copy(t, "t");
    assert(t[0] == 't' && t[1] =='\0');
    copy(t, "");
    assert(t[0] == '\0');
}

// Tests 10 to 17
void testCompare() {
    assert(compare("cat", "dog") < 0);
    assert(compare("dog", "cat") > 0);
    assert(compare("cat", "cat") == 0);
    assert(compare("an", "ant") < 0);
    assert(compare("ant", "an") > 0);
    assert(compare("", "a") < 0);
    assert(compare("a", "") > 0);
    assert(compare("", "") == 0);
}

// Tests 18 to 20
void testAppend() {
    char t[10] = {'c', 'a', 't', '\0', 'x'};
    append(t, "");
    assert(t[0]=='c' && t[1]=='a' && t[2]=='t' && t[3]=='\0' && t[4]=='x');
    char u[10] = {'c', 'a', '\0', 'x', 'x'};
    append(u, "t");
    assert(u[0]=='c' && u[1]=='a' && u[2]=='t' && u[3]=='\0' && u[4]=='x');
    char v[10] = {'\0', 'x', 'x', 'x', 'x'};
    append(v, "cat");
    assert(v[0]=='c' && v[1]=='a' && v[2]=='t' && v[3] =='\0' && v[4]=='x');
}

// Tests 21 to 25
void testFind() {
    assert(find("cat", "cat") == 0);
    assert(find("cat", "c") == 0);
    assert(find("cat", "t") == 2);
    assert(find("cat", "x") == -1);
    assert(find("banana", "an") == 1);
}

// Test the functions.
int main() {
    testLength();
    testCopy();
    testCompare();
    testAppend();
    testFind();
    printf("Tests all pass.");
    return 0;
}
