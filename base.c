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
#define NUM_THREADS 2

void main ()
{
	int i, nthreads; double temp1, temp2, tempf, x, pi, sum[NUM_THREADS];
	temp1=GetTime();
	step = 1.0/(double) num_steps;
	omp_set_num_threads(NUM_THREADS);
	#pragma omp parallel
	{
		int i, id, nthrds;
		double x;
		id=omp_get_thread_num();
		nthrds=omp_get_num_threads();
		if (id==0) nthreads=nthrds;
		  for (i=id, sum[id]=0.0;i< num_steps; i=i+nthrds){
		x = (i+0.5)*step;
		sum[id] += 4.0/(1.0+x*x);
	}
	}
	for(i=0, pi=0.0;i<nthreads;i++)pi += sum[i]*step;
	temp2=GetTime();
	tempf=temp2-temp1;
	printf("TIME = %f\n", tempf);
}
