# Makefile for the Task Graph For Free (TGFF) to Drachma utility application known as Lepton:
# A program for utilizing task graphs produced from TGFF as inputs for creating pseudo-random
# trace files for use with Drachma.

# Written by James B. Nall
# Copyright (C) 2015-2018, All Rights Reserved

CC = g++ -std=c++11
OBJ = applicationTrace.o availableModule.o fileReader.o graph.o lepton.o graphNode.o mapper.o moduleIterationActions.o parameterParser.o parameters.o

ifeq ("true","false")

all: $(OBJ) lepton

clean:
	rm -f *.o
#	rm -f src/*.o src/parameters/*.o


applicationTrace.o: src/applicationTrace.h src/availableModule.h
	$(CC) -o $@ $^

availableModule.o: src/availableModule.h src/graphNode.h
	$(CC) -o $@ $^

fileReader.o: src/fileReader.h
	$(CC) -o $@ $<
# -lboost_regex

graph.o: src/graph.h src/graphNode.h
	$(CC) -o $@ $^

graphMapper.o: src/applicationTrace.h src/availableModule.h src/fileReader.h src/graph.h src/graphNode.h src/parameters/parameterParser.h src/parameters/parameters.h src/mapper.h
	$(CC) -o $@ $^

# applicationTrace
graphNode.o: src/graphNode.h
	$(CC) -o $@ $<

mapper.o: src/applicationTrace.h src/availableModule.h src/fileReader.h src/graph.h src/moduleIterationActions.h src/parameters/parameters.h
	$(CC) -o $@ $^

moduleIterationActions.o: src/availableModule.h src/graphNode.h src/moduleIterationActions.h
	$(CC) -o $@ $^

parameterParser.o: src/parameters/parameterParser.h
	$(CC) -o $@ $<

parameters.o: src/parameters/parameters.h
	$(CC) -o $@ $<


lepton: src/main.cpp $(OBJ)
	$(CC) -c -o $@ $^
#	cd src; $(CC) -c -o $@ $^

endif

all: src/main.cpp src/applicationTrace.h src/availableModule.h src/debugHelper.h src/debugHelper.cpp src/files/fileReader.h \
     src/files/fileReader.cpp src/files/fileWriter.h src/files/fileWriter.cpp src/files/specificFileReaders.h \
     src/graph/graph.h src/graph/graphHandler.h src/graph/graphHandler.cpp src/graph/graphMapper.h src/graph/graphMapper.cpp \
	 src/graph/graphNode.h src/graph/graphNode.cpp src/graph/moduleHelper.h src/graph/moduleHelper.cpp src/graph/moduleIterationActions.h \
	 src/graph/moduleIterationActions.cpp src/parameters/parameterBuilder.h src/parameters/parameterBuilder.cpp \
	 src/parameters/parameterParser.h src/parameters/parameterParser.cpp src/parameters/parameters.h

	cd src && \
	g++ -std=c++11 -o lepton main.cpp applicationTrace.h availableModule.h debugHelper.h debugHelper.cpp files/fileReader.h \
	files/fileReader.cpp  files/fileWriter.h files/fileWriter.cpp files/specificFileReaders.h graph/graph.h graph/graphHandler.h \
	graph/graphHandler.cpp graph/graphMapper.h graph/graphMapper.cpp graph/graphNode.h graph/graphNode.cpp graph/moduleHelper.h \
	graph/moduleHelper.cpp graph/moduleIterationActions.h graph/moduleIterationActions.cpp parameters/parameterBuilder.h \
	parameters/parameterBuilder.cpp parameters/parameterParser.h parameters/parameterParser.cpp parameters/parameters.h -lboost_regex
	#g++ -std=c++11 -o lepton src/main.cpp src/applicationTrace.h src/availableModule.h src/debugHelper.h src/debugHelper.cpp src/fileReader.h src/fileReader.cpp  src/graph/graph.h src/graph/graphHandler.h src/graph/graphHandler.cpp src/graph/graphMapper.h src/graph/graphMapper.cpp src/graph/graphNode.h src/graph/moduleHelper.h src/graph/moduleHelper.cpp src/graph/moduleIterationActions.h src/graph/moduleIterationActions.cpp src/parameters/parameterBuilder.h src/parameters/parameterBuilder.cpp src/parameters/parameterParser.h src/parameters/parameterParser.cpp src/parameters/parameters.h

clean:
	rm -f *.o lepton
