// This file receives messages from the message queue shared by mqueue_s
// and prints them out
#include <fcntl.h>    /* For O_* constants */
#include <sys/stat.h> /* For mode constants */
#include <mqueue.h>
#include <stdio.h>
#include <errno.h>
#include <iostream>

int main(int argc, char **argv) {
  // struct to hold the attributes of the message queue
  struct mq_attr config;
  config.mq_flags = 0;
  config.mq_maxmsg = 3;
  config.mq_msgsize = 5;
  config.mq_curmsgs = 0;

  // Open message queue. Create it if necessary. The message queue is read only,
  // so this side
  // can only receive messages not send them
  mqd_t mq = mq_open("/MyCoolMQ", O_RDONLY | O_CREAT,
                     S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, &config);

  // This will hold the allowed time that mq_send will wait for a message
  timespec mySpec;

  // If the message queue fails to open, throw an error, exit function
  if (mq == -1) {
    perror("mq_open");
    return -1;
  }

  // Get the max message size, create a char buffer of that size
  struct mq_attr attr;
  mq_getattr(mq, &attr);
  char *buf = new char[attr.mq_maxmsg];

  // Loop until return or break
  for (;;) {
    // Variable to hold the priority of received messages
    unsigned int prio = 0;

    // Sets mySpec to 5 seconds after the current time
    clock_gettime(CLOCK_REALTIME, &mySpec);
    mySpec.tv_sec += 5;

    // Get the message and store it in buf.
    // Store the return value(success/failure) in received.
    // If no message is in the queue for 5 seconds, print out error
    ssize_t received =
        mq_timedreceive(mq, buf, attr.mq_msgsize, &prio, &mySpec);

    // If mq_timedreceive failed, throw error, exit function
    if (received == -1) {
      perror("mq_receive");
      return -1;
    }

    // When prio is 24(aka we're done), exit the for loop
    if (prio == 24)
      break;

    // Print the data received in the message
    std::cerr << "Received " << received << " bytes at " << prio
              << " priority: " << prio << std::endl;
  }
  // Outside of loop - close and unlink message queue so that everyone knows we
  // are done with it
  mq_close(mq);
  mq_unlink("/MyCoolMQ");
}
