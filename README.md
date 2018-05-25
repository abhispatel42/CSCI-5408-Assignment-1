# CSCI-5408-Assignment-1

**Let's install first:**
• sudo add-apt-repository -y ppa:webupd8team/java
• sudo apt-get update
• sudo apt-get -y install oracle-java8-installer

**Download & install the public signing key:**
• wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add

**Http transport should be enabled (important):**
• sudo apt-get install apt-transport-https

**Save the repository definition to /etc/apt/sources.list.d/elasticsearch-6.x.list:**
• echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a
/etc/apt/sources.list.d/elastic-6.x.list

**Run apt-get update and the repository is ready for use. You can install it with:**
• sudo apt-get update && sudo apt-get install elasticsearch
This information was taken from: https://www.elastic.co/guide/en/elasticsearch/reference/current/deb.html

**Install ElasticSearch**
• sudo apt-get -y install elasticsearch
**We have to do some configuration.**
file /etc/elasticsearch/elasticsearch.yml contains
important configuration details that have to be considered. Open it.
• sudo nano /etc/elasticsearch/elasticsearch.yml
• Locate and uncomment (remove # at the beggining of the
line) node.name and cluster.name and give new names.
• Locate and uncomment (remove # at the beggining of the line) network.host and
change to 0.0.0.0. 
Save file.
Restart the service so changes take the effect:
• sudo service elasticsearch restart
Run to start elasticsearch on boot up:
• sudo update-rc.d elasticsearch defaults 95 10
You might have a problem with starting ElasticSearch. Test if it’s running:
• sudo service elasticsearch status
The problem might be with jvm allocated memory. You can adjust this by lowering the
size of initial heap:
• sudo nano /etc/elasticsearch/jvm.options
• Change -Xms1g to -Xms512m and save.
Restart the service:
• Sudo service elasticsearch restart

**You can use any REST client you like. Some of the suggestions are curl for Linux distros,
or gui oriented ones. In the browser try:**
• http://<your_ec2_ip>:9200/
If everything is configured well, you should get 200 Response from ES.
Reference:
**A1: Elastic Search and traditional RDBMS. (n.d.). Retrieved from**
https://web.cs.dal.ca/~kosmajac/CSCI5408_tutorials/a1.html
