FROM docker.zhimei360.com/jre_jessie:1.8
ENV HADOOP_HOME=/opt/hadoop \
    HADOOP_VERSION=2.7.3
ENV PATH=${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:$PATH \
    TZ=CTS-8
RUN DEBIAN_FRONTEND=nointeractive apt-get update && \
    apt-get install -y ssh rsync curl && \
    curl -L http://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz -o /opt/hadoop-${HADOOP_VERSION}.tar.gz && \
    cd /opt && \
    tar -xvzf hadoop-${HADOOP_VERSION}.tar.gz &&\
    mv hadoop-${HADOOP_VERSION} hadoop && \
    mv hadoop/etc/hadoop /etc && \
    rm -fr hadoop/etc && \
    rm hadoop-${HADOOP_VERSION}.tar.gz && \
    rm -fr hadoop/share/doc && \
    rm -fr $(find . -name "*-test.jar" -o -name "*-sources.jar") && \
    rm -fr /var/lib/apt
#COPY hadoop-2.7.3 /opt/hadoop
COPY entrypoint.sh /entrypoint.sh
# namenode.secondary http port
EXPOSE 50090
# namenode.secondary https port
EXPOSE 50091
# namenode http port
EXPOSE 50070
# namenode https port
EXPOSE 50470
# namenode.backup http port
EXPOSE 50100
# namenode.backup https port
EXPOSE 50105
# datanode http port
EXPOSE 50075
# datanode https port
EXPOSE 50475
# datanode data port
EXPOSE 50010
# datanode IPC port
EXPOSE 50020
# rm.scheduler port
EXPOSE 8030
# rm.resourceEXPOSEtracker port
EXPOSE 8031
# rm port
EXPOSE 8032
# rm.admin port
EXPOSE 8033
# rm.webapp http port
EXPOSE 8088
# rm.webapp https port
EXPOSE 8090
# nm.localizer port
EXPOSE 8040
# nm.webapp http port
EXPOSE 8042
# timelineEXPOSEserver port
EXPOSE 10200
# timelineEXPOSEserver webapp http port
EXPOSE 8188
# timelineEXPOSEserver webapp https port
EXPOSE 8190
# sharedcache admin port
EXPOSE 8047
# sharedcache webapp port
EXPOSE 8788
# sharedcache clientEXPOSEserver port
EXPOSE 8045
# sharedcache uploader server port
EXPOSE 8046
# mapreduce jobtracker http port
EXPOSE 50030
# mapreduce tasktracker http port
EXPOSE 50060
# mapreduce jobhistory port
EXPOSE 10020
# mapreduce jobhistory webapp port
EXPOSE 19888
# mapreduce jobhistory admin port
EXPOSE 10033
# core default FS port
EXPOSE 9000
WORKDIR /opt/hadoop
ENTRYPOINT ["/entrypoint.sh"]
