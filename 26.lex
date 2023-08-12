#include<stdio.h> 
int main()
{
int a,b,c; /*varible declaration*/ printf(“enter two numbers”); scanf(“%d %d”,&a,&b); c=a+b;//adding two numbers printf(“sum is %d”,c);
return 0;
}
Program: (comment.l)
%{
int com=0;
%}
%s COMMENT
%%
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {BEGIN 0; com++;}
<COMMENT>\n {com++;}
<COMMENT>. {;}
\/\/.* {; com++;}
.|\n {fprintf(yyout,"%s",yytext);}
%%
void main(int argc, char *argv[])
{
if(argc!=3)
{
printf("usage : a.exe input.c output.c\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("\n number of comments are = %d\n",com);
}
int yywrap()
{
return 1;
}

Output:

G:\lex>flex comment.l

G:\lex>gcc lex.yy.c

G:\lex>a.exe input.c
usage : a.exe input.c output.c

G:\lex>a.exe input.c output.c

 number of comments are = 2

G:\lex>

Output File: (output.c)
include<stdio.h>
int main()
{
int a,b,c; 
printf(“enter two numbers”);
scanf(“%d %d”,&a,&b);
c=a+b;
printf(“sum is %d”,c);
return 0;
}
