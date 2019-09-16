FROM websphere-liberty:kernel

USER root

COPY server.xml /config/

COPY daytrader-ee7-1.0-SNAPSHOT.ear /config/dropins/

RUN mkdir /opt/ibm/wlp/usr/shared/resources/Daytrader7SampleDerbyLibs

COPY derby-10.10.1.1.jar /opt/ibm/wlp/usr/shared/resources/Daytrader7SampleDerbyLibs

COPY initializeDB.sh /opt

USER root

RUN chmod 775 /opt/initializeDB.sh

RUN installUtility install --acceptLicense defaultServer

EXPOSE 9080

ENTRYPOINT /opt/initializeDB.sh

