#define PI 3.14   
#include<stdio.h> 
#include<conio.h>
   void main()
{
int a,b,c = 30;
printf("hello");
}
Program: (addlinenos.l)
%{
int yylineno;
%}
%%
^(.*)\n printf("%4d\t%s", ++yylineno, yytext);
%%
int yywrap(void) {
return 1;
}
int main(int argc, char *argv[]) {
yyin = fopen(argv[1], "r");
yylex();
fclose(yyin);
}

Output:

G:\lex>flex addlinenos.l

G:\lex>gcc lex.yy.c

G:\lex>a.exe sample.c
   1    #define PI 3.14
   2    #include<stdio.h>
   3    #include<conio.h>
   4     void main()
   5    {
   6    int a,b,c = 30;
   7    printf("hello");
   8    }
   9
