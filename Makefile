CXX := em++
CXXFLAGS := -g -O0 -std=c++11 --closure 0 -sFORCE_FILESYSTEM=1

SRC	:= BasicFileSys.cpp Disk.cpp FileSys.cpp server.cpp Shell.cpp
HDR	:= BasicFileSys.h Blocks.h Disk.h FileSys.h Shell.h
OBJ	:= $(patsubst %.cpp, %.o, $(SRC))

all: nfsserver.html nfsclient.html

nfsserver.html: $(OBJ)
	$(CXX) -o $@ $(OBJ)
	rm -f DISK
nfsclient.html: Shell.o client.o
	$(CXX) -o $@ Shell.o client.o
%.o:	%.cpp $(HDR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f nfsserver nfsclient *.o DISK
