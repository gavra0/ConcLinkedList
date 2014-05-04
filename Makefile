.PHONY:	all

BENCHS = src/linkedlist
LBENCHS = src/linkedlist-lock
LFBENCHS = src/linkedlist


.PHONY:	clean all $(BENCHS) $(LBENCHS)

all:	lockfree lock

lock:
	$(MAKE) "LOCK=LOCKTYPE" $(LBENCHS)

lockfree:
	$(MAKE) "STM=LOCKFREE" $(LFBENCHS)

clean:
	$(MAKE) -C src/linkedlist clean	
	$(MAKE) -C src/linkedlist-lock clean
	rm -rf build

$(BENCHS):
	$(MAKE) -C $@ $(TARGET)

$(LBENCHS):
	$(MAKE) -C $@ $(TARGET)

$(LFBENCHS):
	$(MAKE) -C $@ $(TARGET)
