# multiprocessing server site
import random, time, Queue
from multiprocessing.managers import BaseManager

task_queue, result_queue = Queue.Queue(), Queue.Queue()

# Inherite from BaseManager
class QueueManager(BaseManager): pass

QueueManager.register('get_task_queue', callable=lambda: task_queue)
QueueManager.register('get_result_queue', callable=lambda: result_queue)

#  binding port: 9999, set authentication key as 'crawler'
manager = QueueManager(address=('', 9999), authkey='crawler')
manager.start()

task = manager.get_task_queue()
result = manager.get_result_queue()

for i in xrange(10000000):
    print('Put task %d...' % n)
    task.put(i)

print('Try get results...')
for i in xrange(10000000):
    r = result.get(timeout=10)
    print('Result: %s' % r)

manager.shutdown()
