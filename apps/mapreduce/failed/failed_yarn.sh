usage() {
  echo -e "Usage: $0 [-i <path>] [-o <path>]\n"\
       "where\n"\
       "-i defines an input puth\n"\
       "-o defines an output path\n"\
       "\n"\
        1>&2
  exit 1
}


while getopts ":i:o:" opt; do
    case "$opt" in
        i)  INPUT_PATH=${OPTARG} ;;
        o)  OUTPUT_PUTH=${OPTARG} ;;
        *)  usage ;;
    esac
done

if [[ -z "$INPUT_PATH" ]];
then
  INPUT_PATH="/bdpc/failed/input"
fi

if [[ -z "$OUTPUT_PATH" ]];
then
  OUTPUT_PATH="/bdpc/failed/output"
fi

THIS_FILE=$(readlink -f "$0")
THIS_PATH=$(dirname "$THIS_FILE")
BASE_PATH=$(readlink -f "$THIS_PATH/../")
APP_PATH="$THIS_PATH/failed-1.0-jar-with-dependencies.jar"

hadoop fs -rm -R $INPUT_PATH $OUTPUT_PATH
hadoop fs -mkdir -p $INPUT_PATH
echo "some data" | hadoop fs -put - $INPUT_PATH/file-0000
echo "some data x" | hadoop fs -put - $INPUT_PATH/file-0001
hadoop fs -touchz $INPUT_PATH/file-0002

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "THIS_FILE = $THIS_FILE"
echo "THIS_PATH = $THIS_PATH"
echo "BASE_PATH = $BASE_PATH"
echo "APP_PATH = $APP_PATH"
echo "-------------------------------------"
echo "INPUT_PATH = $INPUT_PATH"
echo "OUTPUT_PUTH = $OUTPUT_PATH"
echo "-------------------------------------"

mapReduceArguments=(
  "$APP_PATH"
  "com.globallogic.bdpa.mapreduce.failed.Failed"
  "$INPUT_PATH"
  "$OUTPUT_PATH"
)

echo "yarn jar ${mapReduceArguments[@]}"
hadoop jar "${mapReduceArguments[@]}"

echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
