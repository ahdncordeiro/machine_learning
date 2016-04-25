# machine_learning
#
# VERSION               20160425

FROM ubuntu:16.04
MAINTAINER André Cordeiro <ahdncordeiro@gmail.com>

# install vim python3 python3-pip graphviz git
RUN apt-get update && apt-get install -y vim python3 python3-pip graphviz git

# install required python modules
RUN pip3 install -U numpy && pip3 install -U scipy && pip3 install -U scikit-learn

# clone and install pydot compatible with Python 3 at https://github.com/nlhepler/pydot
RUN pip3 install -U git+https://github.com/nlhepler/pydot.git
## old way slower and longer: git clone https://github.com/nlhepler/pydot /root/machine_learning/pydot/ && cd /root/machine_learning/ && python3 -m pip install ./pydot

# copying recipes
COPY recipes /root/machine_learning/recipes/

# this makes the container run forever, remember to docker run the image with '-d'
CMD ["tail", "-f", "/dev/null"]