package com.globallogic.bdpa.mapreduce.stuck;

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

public class Stuck {

    public static class StuckMapper
            extends Mapper<Object, Text, Text, IntWritable> {

        private boolean stuck;

        private final static IntWritable one = new IntWritable(1);

        @Override
        public void setup(Context context) {
            stuck = Math.random() < 0.5;
        }

        @Override
        public void map(Object key, Text value, Context context) throws InterruptedException, IOException {
            if (stuck) {
                while (true) {
                    Thread.sleep(100000);
                }
            }
            context.write(value, one);
        }
    }

    public static class StuckCombiner
            extends Reducer<Text, IntWritable, Text, IntWritable> {

        private boolean stuck;

        @Override
        public void setup(Context context) {
            stuck = Math.random() < 0.5;
        }

        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws InterruptedException {
            if (stuck) {
                while (true) {
                    Thread.sleep(100000);
                }
            }
        }
    }

    public static class StuckReducer
            extends Reducer<Text, IntWritable, Text, IntWritable> {
        public void reduce(Text key, Iterable<IntWritable> values, Context context) throws InterruptedException {
            while (true) {
                Thread.sleep(100000);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        GenericOptionsParser optionParser = new GenericOptionsParser(conf, args);
        String[] remainingArgs = optionParser.getRemainingArgs();
        if ((remainingArgs.length != 2)) {
            System.err.println("Usage: stuck <in> <out>");
            System.exit(2);
        }
        Job job = Job.getInstance(conf, "stuck");
        job.setJarByClass(Stuck.class);
        job.setMapperClass(StuckMapper.class);
        job.setCombinerClass(StuckCombiner.class);
        job.setReducerClass(StuckReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        List<String> otherArgs = Arrays.asList(remainingArgs);
        FileInputFormat.addInputPath(job, new Path(otherArgs.get(0)));
        FileOutputFormat.setOutputPath(job, new Path(otherArgs.get(1)));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}
