FROM debian:jessie
RUN apt-get update && apt-get install -y  python python-virtualenv wget
RUN wget -O- http://ftp.heanet.ie/mirrors/www.apache.org/dist/bloodhound/apache-bloodhound-0.8.tar.gz  | tar -xvzf-
RUN { \
  mkdir -p /opt/bloodhound; \
  virtualenv /opt/bloodhound/bhenv; \
  cd apache-bloodhound-0.8/installer; \
  . /opt/bloodhound/bhenv/bin/activate; \
  pip install -r requirements.txt; \
  python bloodhound_setup.py --environments_directory=/opt/bloodhound/environments --default-product-prefix=DEF -d sqlite --admin-user=admin --admin-password=password ; \
  }
EXPOSE 8080

CMD virtualenv /opt/bloodhound/bhenv/; . /opt/bloodhound/bhenv/bin/activate; tracd --port=8080 /opt/bloodhound/environments/main 
 




# Probably there was no need to run as non-root, given docker

#su - bloodhound
#virtualenv /opt/bloodhound/bhenv/
#source /opt/bloodhound/bhenv/bin/activate
#tracd --port=8080 /opt/bloodhound/environments/main


