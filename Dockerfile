FROM node:4.4-slim

MAINTAINER Anthony Moreno <anthony.moreno@sixt.com>

RUN apt-get update && apt-get install -y --no-install-recommends \ 
	git \
	&& rm -rf /var/lib/apt/lists/*
 
RUN groupadd -r slides && useradd -r -g slides slides

RUN git clone https://github.com/hakimel/reveal.js.git /revealjs
RUN mkdir -p /revealjs/md

WORKDIR /revealjs

RUN npm install -g grunt-cli && npm install
RUN sed -i Gruntfile.js -e "s/files: \[ 'index\.html'\]/files: [ 'pres\/**' ]/"

COPY index.html /revealjs/
COPY custom.css /revealjs/css/
COPY title.js /revealjs/plugin/
COPY amtheme.css /revealjs/css/theme/

# Ability to change presos on the fly
ARG PRESO=derp
ENV PRESO $PRESO
COPY slides/${PRESO}.md /revealjs/pres/slides.md

RUN chown -R slides /revealjs
USER slides

EXPOSE 8000 35729
CMD ["grunt", "serve"]
