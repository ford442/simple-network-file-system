CXX := em++
CXXFLAGS := -g -O0 -std=c++11 --closure 0 -sFORCE_FILESYSTEM=1

SRC	:= BasicFileSys.cpp Disk.cpp FileSys.cpp  server.cpp Shell.cpp
HDR	:= BasicFileSys.h  Blocks.h  Disk.h  FileSys.h  Shell.h
OBJ	:= $(patsubst %.cpp, %.o, $(SRC))

all: nfsserver nfsclient

nfsserver: $(OBJ)
	$(CXX) -o server.html $(OBJ)
	rm -f DISK
nfsclient: Shell.o client.o
	$(CXX) -o $@ Shell.o client.o
%.o:	%.cpp $(HDR)
	$(CXX) $(CXXFLAGS) -c -o client.html $<

clean:
	rm -f nfsserver nfsclient *.o DISK
