### Runtime Dependenies
FROM openjdk:11.0.8-jdk-slim-buster AS runtime

# Install runtime dependencies
RUN apt-get update -y && apt-get install -y \
	libcurl4-openssl-dev \
	libpcre3-dev

### Build XSB
FROM runtime AS build

# Install build tools
RUN apt-get update -y && apt-get install -y wget gcc make
ENV JAVA_HOME /usr/local/openjdk-11/

# Download XSB tar from Sourceforge
WORKDIR /usr/local/bin/
RUN wget -O - https://downloads.sourceforge.net/project/xsb/xsb/3.8%20%28Three-Buck%20Chuck%29/XSB38.tar.gz | tar xvzf -

# Configure and build XSB
WORKDIR /usr/local/bin/XSB/build
RUN sh ./configure -prefix=/usr/local/bin/ --with-optimization=O3
RUN ./makexsb
RUN ./makexsb install

### Install XSB
FROM runtime

COPY --from=build /usr/local/bin/XSB /usr/local/bin/XSB
COPY --from=build /usr/local/bin/xsb-3.8.0 /usr/local/bin/xsb-3.8.0
ENV PATH="/usr/local/bin/XSB/bin:${PATH}"
ENTRYPOINT xsb