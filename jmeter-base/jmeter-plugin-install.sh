#!/bin/sh
echo ${JMETER_HOME}
echo ${JMETER_CMD_RUNNER_VERSION}
echo ${JMETER_PLUGIN_MANAGER_VERSION}

echo "Downloading CMDRunner"
curl -L http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${JMETER_CMD_RUNNER_VERSION}/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar --output ${JMETER_HOME}/lib/cmdrunner-${JMETER_CMD_RUNNER_VERSION}.jar

echo "Downloading Plugin Manager"
curl -L https://jmeter-plugins.org/get/ --output ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGIN_MANAGER_VERSION}.jar

java -cp /opt/apache/apache-jmeter-${JMETER_VERSION}/lib/ext/jmeter-plugins-manager-${JMETER_PLUGIN_MANAGER_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

chmod a+x ${JMETER_HOME}/bin/*.sh

${JMETER_HOME}/bin/PluginsManagerCMD.sh install jpgc-udp=0.4
${JMETER_HOME}/bin/PluginsManagerCMD.sh install jpgc-casutg
${JMETER_HOME}/bin/PluginsManagerCMD.sh install jpgc-tst
chmod a+x ${JMETER_HOME}/lib/ext/*.jar
