THIS_FILE=$(readlink -f "$0")
THIS_PATH=$(dirname "$THIS_FILE")
BASE_PATH=$(readlink -f "$THIS_PATH/../")
SAMPLE_DIR_PATH=$(readlink -f "$BASE_PATH/../data/hadoop_session_01/word_count")
SOURCE_FILE=$SAMPLE_DIR_PATH/file_0003.txt

cd $THIS_PATH

./text_generator.sh
cp $SOURCE_FILE $SAMPLE_DIR_PATH/file_0004.txt

./text_generator.sh
cp $SOURCE_FILE $SAMPLE_DIR_PATH/file_0005.txt

./text_generator.sh -n 100000
cp $SOURCE_FILE $SAMPLE_DIR_PATH/file_0006.txt

./text_generator.sh -n 9000000
cp $SOURCE_FILE $SAMPLE_DIR_PATH/file_0006.txt

./text_generator.sh -n 19000000
