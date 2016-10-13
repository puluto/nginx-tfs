FROM index.alauda.cn/library/centos:6
MAINTAINER Puluto Chen <puluto@gmail.com>

RUN yum install epel-release -y -q && \
  ( yum install git gcc cmake pcre-devel openssl-devel -y -q) && \
  ( git clone https://github.com/lloyd/yajl.git && cd yajl && ./configure && make && make install && ln -s /usr/local/lib/libyajl.so.2 /usr/lib64/ ) && \
  ( git clone https://github.com/alibaba/tengine.git && cd tengine/ && ./configure --with-http_tfs_module && make && make install ) && \
  rm -rf yajl tengine

CMD ["/usr/local/nginx/sbin/nginx"]
