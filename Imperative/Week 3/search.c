#include <stdio.h>
#include <stdbool.h>

// Find (last) index of c in a or return -1 if not found (least efficient)
int linearSearch1(char c, int n, char a[n]) {
    int result = -1;
    for (int i = 0; i < n; i++) {
        if (a[i] == c) result = i;
    }
    return result;
} 

// Find (first) index of c in a or return -1 if not found (hidden complexity + more efficient)
int linearSearch2(char c, int n, char a[n]) {
    int result = -1;
    for (int i = 0; i < n; i++) {
        if (a[i] == c) return i; // early return
    }
    return result;
}

// Find (first) index of c in a or return -1 if not found (no hidden complexity)
int linearSearch3(char c, int n, char a[n]) {
    int result = -1;
    int found = 0; // sentinel variable
    for (int i = 0; (i < n) && (!found); i++) {
        if (a[i] == c) {
            result = i;
            found = 1;
        }
    }
    return result;
}

// Find (first) index of c in a or return -1 if not found (using bool for readability)
int linearSearch4(char c, int n, char a[n]) {
    int result = -1;
    bool found = false;
    for (int i = 0; (i < n) && (!found); i++) {
        if (a[i] == c) {
            result = i;
            found = true;
        }
    }
    return result;
} 


// Find index of c in sorted a or return -1 if not found (assumes list is sorted)
int binarySearch(char c, int n, char a[n]) {
    int start = 0, end = n, mid;
    bool found = false;
    while ((!found) && (end > start)) {
        mid = start + (end - start) / 2;
        if (c == a[mid]) found = true;
        else if (c < a[mid]) end = mid;
        else start = mid + 1;
    }

    if (!found) mid = -1;
        return mid;
} 