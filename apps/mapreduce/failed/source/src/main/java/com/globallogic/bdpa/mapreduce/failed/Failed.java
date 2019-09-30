package com.globallogic.bdpa.mapreduce.failed;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class Failed {

    public static class FailableMapper
            extends Mapper<Object, Text, Text, IntWritable> {

        private boolean fail;

        private final static IntWritable one = new IntWritable(1);

        @Override
        public void setup(Context context) {
            fail = Math.random() < 0.5;
        }

        @Override
        public void map(Object key, Text value, Context context) throws InterruptedException, IOException {
            if (fail) {
                throw new RuntimeException("There is something wrong in Mapper");
            }
            context.write(value, one);
        }
    }

    public static class FailableCombiner
            extends Reducer<Text, IntWritable, Text, IntWritable> {

        private boolean fail;

        @Override
        public void setup(Context context) {
            fail = Math.random() < 0.5;
        }

        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws InterruptedException {
            if (fail) {
                throw new RuntimeException("There is something wrong in Combiner");
            }
        }
    }

    public static class FailableReducer
            extends Reducer<Text, IntWritable, Text, IntWritable> {
        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws InterruptedException {
            throw new RuntimeException("There is something wrong in Reducer");
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        GenericOptionsParser optionParser = new GenericOptionsParser(conf, args);
        String[] remainingArgs = optionParser.getRemainingArgs();
        if ((remainingArgs.length != 2)) {
            System.err.println("Usage: failed <in> <out>");
            System.exit(2);
        }
        Job job = Job.getInstance(conf, "failed");
        job.setJarByClass(Failed.class);
        job.setMapperClass(FailableMapper.class);
        job.setCombinerClass(FailableCombiner.class);
        job.setReducerClass(FailableReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        List<String> otherArgs = Arrays.asList(remainingArgs);
        FileInputFormat.addInputPath(job, new Path(otherArgs.get(0)));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs.get(1)));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
