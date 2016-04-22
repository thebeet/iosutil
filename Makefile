
CC = g++ -ObjC++

CPPFLAG = -I.
LDFLAGS = -framework Foundation -framework CoreFoundation -framework MobileDevice -F/System/Library/PrivateFrameworks
DEPS = common.h
OBJS = iosutil.o manager.o device.o fileaccess.o

all: iosutil

iosutil: $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

install: iosutil
	cp ./iosutil /usr/local/bin

%.o: %.cpp $(DEPS)
	$(CC) -g -c -o $@ $< $(CPPFLAGS)

clean:
	rm -rf iosutil $(OBJS)
