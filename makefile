
SRC=$(wildcard src/**/*) # trick to find all source files under the src diretory

all: clean test run

build: $(SRC)
	mkdir -p build 
	javac src/main/*.java -d build
	javac -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar src/test/*.java -d build -sourcepath ./src/main

test: build
	java -cp ./build:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar org.junit.runner.JUnitCore EdgeConnectorTest


run: build
	java -cp ./build RunEdgeConvert


clean:
	rm -rf build/