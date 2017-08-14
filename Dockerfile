# -----------------------------------------------------------------------------
# Base centos container with ssh
# -----------------------------------------------------------------------------
FROM centos:latest
MAINTAINER keoni84

RUN yum update && \
yum install -y openssh-server && \
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key && \
ln -sf /usr/share/zoneinfo/UTC /etc/localtime && \
rm -rf /var/cache/yum/* && \
yum clean all

RUN mkdir /var/run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
