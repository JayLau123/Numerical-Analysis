#include <stdio.h>
#include <string.h>

int main()
{
	char s1[100],s2[100];
	int z1[100],z2[100],z3[100],i,j,t,l1,l2,l;

	//使用字符串读取输入
	scanf("%s %s",s1,s2);

	//strlen()函数的作用：返回字符串长度 ，该函数必须要有string.h才能使用
	l1=strlen(s1);
	l2=strlen(s2);

	/*
	memset函数的作用是将数组z1里面的元素全部置0， 该函数必须要有string.h才能使用
	memset用法：memset(数组名,0,sizeof(数组名))
	注意：该函数只能将所有值置0

	当然也可以不用函数，使用for循环，for(i=0;i<100;i++) z1[i]=0;

	*/
	memset(z1,0,sizeof(z1));
	memset(z2,0,sizeof(z2));

	//将字符串转换成整型数组 ,顺序为逆序，个位是存在0号元素，十位存在1号元素
	for(i=0;i<l1;i++)
		z1[i]=s1[l1-i-1]-'0';
	for(i=0;i<l2;i++)
		z2[i]=s2[l2-i-1]-'0';

	/*
	解释下一句含义： 当问号前面的条件成立的时候，取冒号前面的值，不成立的时候取后面的值

	当然，也可以使用：
	if(l1>l2)
		l=l1;
	else
		l=l2;
	*/
	l=l1>l2 ? l1:l2;

	//将两个数组加起来 ，生成新的数组z3
	t=0;
	for(i=0;i<l;i++){
		z3[i]=(z1[i]+z2[i]+t) % 10;
		t=(z1[i]+z2[i]+t) / 10;
	}

	//如果两个数相加，最高位相加还需要进1，那么就将这个1先输出
	if(t==1) printf("1");

	//由于储存和的数组也是逆序储存的，因此，逆序输出为正确结果
	for(i=l-1;i>=0;i--) printf("%d",z3[i]);

	return 0;


}
