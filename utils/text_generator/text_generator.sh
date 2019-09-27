usage() {
  echo -e "Usage: $0 [-n <number>] [-p <path>]\n"\
       "where\n"\
       "-n defines number of words to be generated\n"\
       "-p defines the path to the root directory of a source sample text file which name must be 'file_0000.txt' (optional)\n"\
       "\n"\
        1>&2
  exit 1
}


while getopts ":p:n:" opt; do
    case "$opt" in
        p)  SAMPLE_DIR_PATH=${OPTARG} ;;
        n)  WORDS_NUMBER=${OPTARG} ;;
        *)  usage ;;
    esac
done

THIS_FILE=$(readlink -f "$0")
THIS_PATH=$(dirname "$THIS_FILE")
BASE_PATH=$(readlink -f "$THIS_PATH/../")


if [[ -z "$SAMPLE_DIR_PATH" ]];
then
 SAMPLE_DIR_PATH=$(readlink -f "$BASE_PATH/../data/hadoop_session_01/word_count")
fi

if [[ -z "$WORDS_NUMBER" ]];
then
  WORDS_NUMBER=5000000
fi


THIS_FILE=$(readlink -f "$0")
THIS_PATH=$(dirname "$THIS_FILE")
BASE_PATH=$(readlink -f "$THIS_PATH/../")
APP_PATH="$THIS_PATH/text_generator.jar"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "THIS_FILE = $THIS_FILE"
echo "THIS_PATH = $THIS_PATH"
echo "BASE_PATH = $BASE_PATH"
echo "APP_PATH = $APP_PATH"
echo "-------------------------------------"
echo "SAMPLE_DIR_PATH = $SAMPLE_DIR_PATH"
echo "WORDS_NUMBER = $WORDS_NUMBER"
echo "-------------------------------------"

javaArguments=(
  -classpath "$APP_PATH"
  "com.globallogic.bdpc.generator.text.TextGenerator"
  "$SAMPLE_DIR_PATH"
  "$WORDS_NUMBER"
)

echo "java ${javaArguments[@]}"
java "${javaArguments[@]}"

echo "You should find the text here: $SAMPLE_DIR_PATH/file_0003.txt"
echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
