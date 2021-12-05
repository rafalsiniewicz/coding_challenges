def merge_the_tools(string, k):
    parts = [string[i:i+k] for i in range(0, len(string), k)]
    unique_parts = [''.join(list(dict.fromkeys(i))) for i in parts]
    for i in unique_parts:
        print(i)
    
if __name__ == '__main__':
    string, k = input(), int(input())
    merge_the_tools(string, k)
