#ifndef QUICKSORT_H
#define QUICKSORT_H

template<class T>
inline void swap( T& t1, T& t2)
{
	T hold = t2;
	t2 = t1;
	t1 = hold;
}

template <class T>
void quicksort( T *array, int hi, int lo = 0)
{
	while(hi > lo)
	{
		int i = lo;
		int j = hi;
		do
		{
			while (array[--j] > array[lo])   
				;
			if(i < j)
				swap( array[j],array[i]);
		}
		while (i<j);
		lo = j+1;
//		quicksort(array,hi,lo);

	}
}
#endif
