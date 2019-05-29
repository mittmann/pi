#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <omp.h>

#define DEFAULT_STEPS 1000000

double GetTime(void)
{
	struct  timeval time;
	double  Time;

	gettimeofday(&time, (struct timezone *) NULL);
	Time = (((double)time.tv_sec*1000000.0 + (double)time.tv_usec))/1000000;
		return(Time);
}

static long num_steps;
double step;

int main (int argc, char **argv)
{
    	if (argc > 1)
            num_steps = atoi(argv[1]);
        else
            num_steps = DEFAULT_STEPS;

	int i, nthreads; 
	double temp1, x, pi;
	double *sum;
        sum = malloc(omp_get_max_threads()* sizeof(double));
//	fflush(stdout);
//	printf("max threads: %d, num_threads: %d\n", omp_get_max_threads(), omp_get_num_threads());
	temp1=GetTime();
	step = 1.0/(double) num_steps;
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
	printf("TIME = %f\n", GetTime() - temp1);
}
