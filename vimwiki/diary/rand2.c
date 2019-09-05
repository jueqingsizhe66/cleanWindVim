#include<stdio.h>
#include<time.h>
#include<stdlib.h>
int main(void)
{
    int i;
    float j;
    float t;
    for(i=0;i<10;i++)
    {
        //srand((unsigned)time(NULL));
        j=1+(10*rand()/(RAND_MAX+1.0));
        printf("%10.4f  ",j); 
    }
    printf("\n");
    printf("RAND_MAX  %d\n", RAND_MAX);
    for(i=0;i<=100;i++){
       // srand((unsigned)time(NULL));
        t=rand()/32768.0;
        printf("rand1= %5.3f\t",t) ;
        if(i%10==0){
            printf("\n");}
    }
//    t = 13.56 - (int)13.56;
//    printf("1: %10.4f", t);
    return 0;
} 
