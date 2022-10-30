/*
====================================================================================
  Author: TK Joseph Mokoma
  Program Namme: Reversible Prime Squares
  Function: a program that determines and prints the first 10 reversible prime squares
  Student ID: 202000486
=======================================================================================
*/

#include <stdio.h>
#include <stdbool.h>
#include<math.h>


//Function 1: it reverses an integer num.
int reverse(int num)
{
	int r;
	int reverse=0;
	while(num!=0)
	{
		r=num%10;
		reverse= (reverse*10)+r;
		num=num/10;
	}
	return reverse;
}


//Function 2: it checks if int num is a prime number(true) or not a prime number(false).
bool primechecker2(int num)
{
	int i;
	bool isPrime=true;
	
	if(num==0 || num==1 ) // niethr 0 or 1 is prime
	{
		isPrime=false;
	}
	
	for(i=2;i<=(num)/2;i++)
	{
		if(num%i == 0) // if the remainder of int num divided by i(in range [2,num/2] is not 0.
		{
			isPrime=false;
			break;
		}
		
	}
	return isPrime;
}


//Function 3: it checks if int num is a isPaledrome(true) or not_palindrome (false).
bool palindrome(int num)
{
	bool isPaledrome=true;
	if(reverse(num)==num)
	{
		isPaledrome = false;
	}
	return isPaledrome;
}


//Function 3: it checks if int num is a perfect square(true) or not perfectsqaure(false). 
bool Perfect_sqr (int num)
{
	int i;
    for(i=1; i * i <= num; i++ )
    {
        if((num % i == 0) && (num / i == i)) // if mod of int num divided by i is 0 AND int num divided by i = i then num is a perfect square
        {
            return true;
        }
    }
    return false; // else it is not a perfect square.
}

int main()
{
	int j=0;
	int k, sqr_of_k, reverse_of_k, sqr_of_rev_k;

	for(k=0;k>=0;k++) // declearing int k of range [0,infinity]
	{
		
		int reverse_of_k = reverse(k); // reversing k and storing it in int reverse_of_k

        if(Perfect_sqr(k) == true && Perfect_sqr(reverse_of_k) == true) // checking if both k AND its reverse are perfect squares.
        {
            sqr_of_k = sqrt(k); // storing the square root of k in sqr_of_k 
            sqr_of_rev_k = sqrt( reverse_of_k); // storing the square root reverse of k in sqr_of_rev_k 

            if(primechecker2(sqr_of_k) == true && primechecker2(sqr_of_rev_k) == true) // chicking if both the sqr_of_k AND sqr_of_rev_k are prime numbers
            {
                if(palindrome(k)) // checking if k is a palindrome
                {
                    printf ("%i  ",k);
                    j++;
                    if (j==10)
                    {
                    	break;
					}
                }

            }
        }
			
	}

	
	return 0;
}
