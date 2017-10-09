import datetime
import sys
import os

log = sys.argv[1]

assert os.path.exists(log)

if os.stat(log).st_size == 0:
    sys.exit(0)

with open(log) as lg:
    for line in lg:
        pass
    last = line

time = last[-17:]
time = time.strip()
dt = datetime.datetime.strptime(time, '%d.%m.%y-%H:%M:%S')
now = datetime.datetime.now()
week = datetime.timedelta(days=3)

if now - dt < week:
    sys.exit(1)
