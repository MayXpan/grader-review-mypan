CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

if [[ -f student-submission/ListExamples.java ]]
then
    echo 'File exists'
else
    echo 'File does not exist. ListExamples.java must be in correct directory.'
    exit 1
fi

cp student-submission/ListExamples.java grading-area/
cp TestListExamples.java grading-area/
cp -r lib grading-area/
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

 # javac grading-area/ListExamples.java
cd grading-area
javac -cp $CPATH *.java
if ! [ $? -eq 0 ]
then
    echo 'Compilation failed'
    exit 1
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
if [ [ $? -eq 0 ] ]
then
    echo 'Test passed'
else
    echo 'Test failed'
fi
