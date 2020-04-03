// algorithm with O(1) complexity


int power_of_2(int n) {
    return !((n-1) & n);
}

int count_digit(int n) {
    return floor(log(n) + 1)
}
