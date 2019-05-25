#include <stdio.h>
#include <sys/time.h>
#include <omp.h>

double GetTime(void)
{
	struct  timeval time;
	double  Time;

	gettimeofday(&time, (struct timezone *) NULL);
	Time = (((double)time.tv_sec*1000000.0 + (double)time.tv_usec))/1000000;
		return(Time);
}

static long num_steps= 100000000;
double step;
void main ()
{
	int i; double temp1, temp2, tempf, x, pi, sum=0.0;
	temp1=GetTime();
	step = 1.0/(double) num_steps;
	#pragma omp parallel
	{
		double x;
		#pragma omp for reduction(+:sum)
		  for (i=0;i< num_steps; i++){
		x = (i+0.5)*step;
		sum = sum + 4.0/(1.0+x*x);
		}
	
	}
	pi=step*sum;

	temp2=GetTime();
	tempf=temp2-temp1;
	printf("TIME = %f\n", tempf);
}
