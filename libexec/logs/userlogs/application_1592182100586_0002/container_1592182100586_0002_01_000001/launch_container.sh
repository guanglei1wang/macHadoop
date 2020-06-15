#!/bin/bash

set -o pipefail -e
export PRELAUNCH_OUT="/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/prelaunch.out"
exec >"${PRELAUNCH_OUT}"
export PRELAUNCH_ERR="/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/prelaunch.err"
exec 2>"${PRELAUNCH_ERR}"
echo "Setting up env variables"
export JAVA_HOME=${JAVA_HOME:-"/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home"}
export HADOOP_COMMON_HOME=${HADOOP_COMMON_HOME:-"/usr/local/Cellar/hadoop/3.2.1_1/libexec"}
export HADOOP_HDFS_HOME=${HADOOP_HDFS_HOME:-"/usr/local/Cellar/hadoop/3.2.1_1/libexec"}
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/usr/local/Cellar/hadoop/3.2.1_1/libexec/etc/hadoop"}
export HADOOP_YARN_HOME=${HADOOP_YARN_HOME:-"/usr/local/Cellar/hadoop/3.2.1_1/libexec"}
export HADOOP_HOME=${HADOOP_HOME:-"/usr/local/Cellar/hadoop/3.2.1_1/libexec"}
export PATH=${PATH:-"/usr/bin:/bin:/usr/sbin:/sbin"}
export HADOOP_TOKEN_FILE_LOCATION="/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002/container_1592182100586_0002_01_000001/container_tokens"
export CONTAINER_ID="container_1592182100586_0002_01_000001"
export NM_PORT="60994"
export NM_HOST="localhost"
export NM_HTTP_PORT="8042"
export LOCAL_DIRS="/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002"
export LOCAL_USER_DIRS="/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/"
export LOG_DIRS="/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001"
export USER="jing"
export LOGNAME="jing"
export HOME="/home/"
export PWD="/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002/container_1592182100586_0002_01_000001"
export JVM_PID="$$"
export MALLOC_ARENA_MAX=""
export APPLICATION_WEB_PROXY_BASE="/proxy/application_1592182100586_0002"
export SHELL="/bin/bash"
export HADOOP_MAPRED_HOME="${HADOOP_HOME}"
export CLASSPATH="$PWD:/usr/local/Cellar/hadoop/3.2.1_1/libexec/share/hadoop/mapreduce:$HADOOP_MAPRED_HOME/libexec/share/hadoop/mapreduce/*:$HADOOP_MAPRED_HOME/libexec/share/hadoop/mapreduce/lib/*:job.jar/*:job.jar/classes/:job.jar/lib/*:$PWD/*"
export APP_SUBMIT_TIME_ENV="1592182160288"
export LD_LIBRARY_PATH="$PWD:$HADOOP_COMMON_HOME/lib/native"
echo "Setting up job resources"
mkdir -p jobSubmitDir
ln -sf -- "/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002/filecache/12/job.split" "jobSubmitDir/job.split"
mkdir -p jobSubmitDir
ln -sf -- "/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002/filecache/10/job.splitmetainfo" "jobSubmitDir/job.splitmetainfo"
ln -sf -- "/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002/filecache/11/job.jar" "job.jar"
ln -sf -- "/usr/local/Cellar/hadoop/3.2.1_1/tmp/nm-local-dir/usercache/jing/appcache/application_1592182100586_0002/filecache/13/job.xml" "job.xml"
echo "Copying debugging information"
# Creating copy of launch script
cp "launch_container.sh" "/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/launch_container.sh"
chmod 640 "/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/launch_container.sh"
# Determining directory contents
echo "ls -l:" 1>"/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/directory.info"
ls -l 1>>"/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/directory.info"
echo "find -L . -maxdepth 5 -ls:" 1>>"/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/directory.info"
find -L . -maxdepth 5 -ls 1>>"/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/directory.info"
echo "broken symlinks(find -L . -maxdepth 5 -type l -ls):" 1>>"/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/directory.info"
find -L . -maxdepth 5 -type l -ls 1>>"/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/directory.info"
echo "Launching container"
exec /bin/bash -c "$JAVA_HOME/bin/java -Djava.io.tmpdir=$PWD/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog  -Xmx1024m org.apache.hadoop.mapreduce.v2.app.MRAppMaster 1>/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/stdout 2>/usr/local/Cellar/hadoop/3.2.1_1/libexec/logs/userlogs/application_1592182100586_0002/container_1592182100586_0002_01_000001/stderr "
