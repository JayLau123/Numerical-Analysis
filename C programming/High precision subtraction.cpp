#include <stdio.h>
#include <string.h>

int main()
{
	char s1[100],s2[100];
	int z1[100],z2[100],z3[100],i,j,t,l1,l2,l,fushu=0;
	scanf("%s %s",s1,s2);
	
	
	l1=strlen(s1);
	l2=strlen(s2);
	
	//�ж������s1��s2�ĸ���һЩ�����s1<s2��fushu������ֵΪ1 
	if(l1<l2){
		//���s1��λ����s2��λ���̣���ôs1�϶�С��s2 
		fushu=1;
	} else{
		//���s1��λ����s2��λ����ȣ���ôһλλ�رȽ� 
		if(l1==l2){
			i=0;
			while(s1[i]!='\0' && s2[i]!='\0' && s1[i]==s2[i]){
				i++;
			}
			//������һλ����ȣ���ô��ֱ�����0��������� 
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
	
	//z1�����д�ϴ������z2�����д��С���� 
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
	
	//��λ��� 
	for(i=0;i<l1;i++){
		z3[i]=z1[i]-z2[i];
		//���������������С��0������ǰһλ��1 
		if(z3[i]<0){
			z3[i]+=10;
			z1[i+1]--;
		}
	}
	
	//����Ǹ�������������� 
	if(fushu==1) printf("-");
	
	//����ǰ��λ��0�����Ҫ�Թ� ���ҵ���һ����Ϊ0���±� 
	i=l1-1;
	while(z3[i]==0) i--;
    //��z3����������� 
	for(;i>=0;i--) 
		printf("%d",z3[i]);
	
	return 0;
	
	
} 
