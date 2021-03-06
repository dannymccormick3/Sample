// This file generates numbers from 0-24 and sends them into the
// message queue shared by mqueue_r
#include <fcntl.h>    /* For O_* constants */
#include <sys/stat.h> /* For mode constants */
#include <mqueue.h>
#include <unistd.h>
#include <stdio.h>
#include <iostream>

int main(int argc, char **argv) {
  // struct to hold the attributes of the message queue
  struct mq_attr config;
  config.mq_flags = 0;
  config.mq_maxmsg = 3;
  config.mq_msgsize = 5;
  config.mq_curmsgs = 0;

  // Open message queue. Create it if necessary. The message queue is write
  // only, so this side
  // can only send messages not receive them
  mqd_t mq = mq_open("/MyCoolMQ", O_WRONLY | O_CREAT,
                     S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, &config);

  // This will hold the allowed time that mq_send will wait for a message if the
  // queue is full
  struct timespec mySpec;

  // If the message queue fails to open, throw an error, exit function
  if (mq == -1) {
    perror("mq_open");
    return -1;
  }

  // Loop to send numbers 0-24 through message queue
  for (size_t i = 0; i < 25; ++i) {
    // Create a char buffer, fill it, and get its size. Print the buffer you are
    // sending
    char buf[5];
    int count = snprintf(buf, 5, "%lu ", i);
    std::cerr << "Sending message " << buf << std::endl;

    // Sets mySpec to 5 seconds after the current time
    clock_gettime(CLOCK_REALTIME, &mySpec);
    mySpec.tv_sec += 5;

    // Send the buffer through the message queue
    // Store return value(success/failure) in received
    // If queue is full for 5 seconds, print out error
    int ret = mq_timedsend(mq, buf, count, i, &mySpec);

    // If mq_timedsend failed, throw error, exit function
    if (ret != 0) {
      perror("mq_send");
      break;
    }

    // Stop for a second before resuming for loop
    sleep(1);
  }
  // Outside of loop - close and unlink message queue so that everyone knows we
  // are done with it
  mq_close(mq);
  mq_unlink("/MyCoolMQ");
}
