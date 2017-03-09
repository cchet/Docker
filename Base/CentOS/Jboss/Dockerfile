FROM centos:7.2.1511
MAINTAINER Thomas Herzog <herzog.thomas81@gmail.com>

# Install packages necessary to run EAP
RUN yum -y upgrade \
    && yum -y install wget \
	&& yum -y install xmlstarlet saxon augeas bsdtar unzip \
	&& yum -y install dos2unix \
	&& yum clean all

# Create a user and group used to launch processes
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
RUN groupadd -r jboss -g 1000 && useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss

# Set the working directory to jboss' user home directory
WORKDIR /opt/jboss