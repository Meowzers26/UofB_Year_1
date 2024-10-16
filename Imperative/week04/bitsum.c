// Convert a string into an integer.  Return -1 if it is not valid.
int convert(const char input[]) {
    char* endptr;

    long int num = strtol(input, &endptr, 10);

    if (num > INT_MAX || num < 1 || endptr == input || *endptr != '\0' || input[0] == '0') {
        return -1;
    }

    else {
        return num;
    }
}

int main(int n, char *args[n]) {
    int a = convert(args[1]);
}