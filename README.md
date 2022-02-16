# User_Thread
You will implement a simplified version of many-to-one user level threads in the form of a library
called Simple Threads.
In the many-to-one model for user level threads, all threads execute on the same kernel thread. 
As there is only one kernel-level thread associated with the process (the process containing threads is
represented by a single context within the kernel), only one user-level thread may run at a time.
Your thread manager will include a preemptive round-robin scheduler. If a thread does not yield during its time-slice, it will be preempted and one of the other ready threads will be resumed. 
The preempted and resumed threads should change state accordingly.
Note: You will NOT use pthreads anywhere in your implementation.
The intent is to create similar functionality entirely in a user-space program.
