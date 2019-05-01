extern int myprintf(const char* string, ...);

int main()
{
	int a = 2, b = 5;
	myprintf("%d, and I %s %x %d %% %c\n", a + b, "love", 3802, 100, '!');
	return 1;
}
