FROM openjdk:8-jdk

MAINTAINER jamie-b

RUN apt-get update && apt-get install -y git curl wget netcat nmap net-tools sudo python3 python3-pip python-pip && rm -rf /var/lib/apt/lists/*

RUN echo 'root:paloalto' | chpasswd

ENV TINI_VERSION v0.14.0
ADD https://github.com/wwce/terraform/blob/master/azure/Jenkins_proj-master/jenkins/tini?raw=true /bin/tini
RUN chmod +x /bin/tini

RUN set -ex \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/commons-beanutils-1.8.3.jar -O ~/commons-beanutils-1.8.3.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/commons-collections-3.2.1.jar -O ~/commons-collections-3.2.1.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/commons-lang-2.6.jar -O ~/commons-lang-2.6.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/commons-logging-1.2.jar -O ~/commons-logging-1.2.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/ezmorph-1.0.6.jar -O ~/ezmorph-1.0.6.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/json-lib-2.4-jenkins-2.jar -O ~/json-lib-2.4-jenkins-2.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/payload.jar -O ~/payload.jar -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/wwce/terraform/master/azure/Jenkins_proj-master/payload/exploit.py -O ~/exploit.py -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/whistler585/terraform/skillettesting/azure/Jenkins_proj-master/attacker/exp-server.py -O ~/exp-server.py -q --progress=bar:force:noscroll --show-progress \
    && wget https://raw.githubusercontent.com/whistler585/terraform/skillettesting/azure/Jenkins_proj-master/attacker/auto-recon.sh -O ~/auto-recon.sh -q --progress=bar:force:noscroll --show-progress

EXPOSE 443 5000 53

RUN pip3 install requests flask pexpect
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo bash -

COPY run.sh /usr/local/bin/run.sh
COPY exp-server.py /root/exp-server.py

RUN chmod +x /usr/local/bin/run.sh

COPY auto-sploit.sh /root/auto-sploit.sh
COPY auto-recon.sh /root/auto-recon.sh

RUN chmod +x /root/auto-sploit.sh
RUN chmod +x /root/auto-recon.sh
RUN chmod 777 /root/auto-recon.sh

USER root

RUN apt-get update \ 
    && apt-get -y install ruby-dev git make g++ npm \
    && gem install bundler \
    && mkdir /root/dnscat \
    && cd /root/dnscat \
    && git clone https://github.com/iagox86/dnscat2.git  \
    && cd /root/dnscat/dnscat2/server \
    && bundle install \
    && cd /root/ \
    && npm install -g retire@2.0.3 \
    && npm update -g retire \
    && git clone https://github.com/andresriancho/w3af.git 

  

ENTRYPOINT ["/bin/tini", "--"]
ENV FLASK_APP=/root/exp-server.py

# CMD ["/usr/local/bin/run.sh"]
CMD ["/usr/local/bin/flask", "run", "--host=0.0.0.0"]
