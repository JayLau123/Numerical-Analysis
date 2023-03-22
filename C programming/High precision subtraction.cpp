#include <stdio.h>
#include <string.h>

int main()
{
	char s1[100],s2[100];
	int z1[100],z2[100],z3[100],i,j,t,l1,l2,l,fushu=0;
	scanf("%s %s",s1,s2);
	
	
	l1=strlen(s1);
	l2=strlen(s2);
	
	//判断输入的s1和s2哪个大一些，如果s1<s2则将fushu变量赋值为1 
	if(l1<l2){
		//如果s1的位数比s2的位数短，那么s1肯定小于s2 
		fushu=1;
	} else{
		//如果s1的位数与s2的位数相等，那么一位位地比较 
		if(l1==l2){
			i=0;
			while(s1[i]!='\0' && s2[i]!='\0' && s1[i]==s2[i]){
				i++;
			}
			//如果最后一位都相等，那么就直接输出0，程序结束 
			if(s1[i]==s2[i]){
				printf("0"); 
				return 0;
			} else{
				if(s1[i]<s2[i])
					fushu=1;
			}
		} 
		
	}
		
	memset(z1,0,sizeof(z1));
	memset(z2,0,sizeof(z2));
	
	//z1数组中存较大的数，z2数组中存较小的数 
	if(fushu==1){
		for(i=0;i<l1;i++)
			z2[i]=s1[l1-i-1]-'0';
		for(i=0;i<l2;i++)
			z1[i]=s2[l2-i-1]-'0';
		t=l1;
		l1=l2;
		l2=t;
	}else{
		for(i=0;i<l1;i++)
			z1[i]=s1[l1-i-1]-'0';
		for(i=0;i<l2;i++)
			z2[i]=s2[l2-i-1]-'0';
	}
	
	//逐位相减 
	for(i=0;i<l1;i++){
		z3[i]=z1[i]-z2[i];
		//如果减出来的数字小于0，则向前一位借1 
		if(z3[i]<0){
			z3[i]+=10;
			z1[i+1]--;
		}
	}
	
	//如果是负数，先输出负号 
	if(fushu==1) printf("-");
	
	//可能前几位是0，因此要略过 ，找到第一个不为0的下标 
	i=l1-1;
	while(z3[i]==0) i--;
    //将z3数组逆序输出 
	for(;i>=0;i--) 
		printf("%d",z3[i]);
	
	return 0;
	
	
} 
