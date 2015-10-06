FROM ubuntu:latest
MAINTAINER  Lakshmi Raju <ping.rln@gmail.com>

# Tell debconf to run in non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Construct Image with Essential Software
RUN apt-get update && apt-get install -y ca-certificates firefox \
    openssh-server  \
    python-pip 

RUN pip install -U selenium

# Create OpenSSH privilege separation directory
RUN mkdir /var/run/sshd

# Add the Test user that will run the browser
RUN adduser --disabled-password --gecos "Test User" --uid 1001 tester && usermod --gid 1001 tester

# Add SSH public key for the chrome user
RUN mkdir /home/tester/.ssh
COPY id_rsa.pub /home/tester/.ssh/
ADD id_rsa.pub /home/tester/.ssh/authorized_keys
RUN chown -R tester:tester /home/tester/.ssh

# Copy the Firefox Test Script and Invoke it from a run-test script
ADD firefox-google.py /home/tester/firefox-google.py

RUN echo 'python /home/tester/firefox-google.py' >> /usr/local/bin/run-test
RUN chmod 755 /usr/local/bin/run-test

# Start SSH so we are ready to make a tunnel
ENTRYPOINT ["/usr/sbin/sshd",  "-D"]

# Expose the SSH port
EXPOSE 22
