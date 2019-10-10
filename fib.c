
#include <string.h>

int
fib(int x)
{
  if (x <= 2) {
    return 1;
  }
  else {
    return fib(x-1) + fib(x-2);
  }
}

void __console_log(const char* msg, int len);
void console_log(char *str) {
    __console_log((int) str, strlen(str));
}

void
hello()
{
  console_log("Hello from C");
}
