// used by the legacy makefile to test if libraries work

#include <stdio.h> /* jpeglib.h needs it */
#include CONFTEST_HEADER
int main(){
	(void) CONFTEST_SYMBOL;
	return 0;
}
