// This file takes in messages containting prime numbers
// from a message queue linked to mqueue_r and prints them out
#include <fcntl.h>    /* For O_* constants */
#include <sys/stat.h> /* For mode constants */
#include <mqueue.h>
#include <stdio.h>
#include <errno.h>
#include <iostream>

int main(int argc, char **argv) {
  // struct that contains all the flags/attributes of the message queue
  struct mq_attr config;
  config.mq_flags = 0;
  config.mq_maxmsg = 3;
  config.mq_msgsize = 5;
  config.mq_curmsgs = 0;

  // Opens message queue to talk to mqueue_r. If necessary, creates it
  mqd_t mq2 = mq_open("/MyCoolMQ2", O_RDONLY | O_CREAT,
                      S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, &config);

  // If queue fails to open, report error, exit
  if (mq2 == -1) {
    perror("mq2_open");
    return -1;
  }

  for (;;) {
    // Receive the message, store value in data, return value(Success/Failure)
    // in received
    int data = 0;
    unsigned int prio = 0;
    ssize_t received =
        mq_receive(mq2, (char *)&data, sizeof((char *)&data), &prio);

    // If mq_receive fails, print error message exit
    if (received == -1) {
      perror("mq_receive");
      return -1;
    }

    // Print prime number, exit if last one
    std::cout << "Prime number received: " << data << std::endl;
    if (data == 23)
      break;
  }
  // Close and unlink message queue
  mq_close(mq2);
  mq_unlink("/MyCoolMQ2");
}
