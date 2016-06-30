RevealJS-Docker
===============

A dockerized version of the [Reveal JS](http://lab.hakim.se/reveal-js/#/) presentation software. To try it out, just do:

    docker run -d -p 8000:8000 volcomism/revealjs:latest

And open a browser to `http://localhost:8000`

To use your own slides, add your slide to the slides/ directory in Markdown format and reference it in the BUILD_ARGS in the docker-compose file.

If you want to use straight HTML for the slides, mount the html at `/revealjs/index.html`.

I took the project from `https://github.com/amouat/revealjs-docker`, made the image size slightly smaller and added BUILD_ARGS to allow changing presos rather quickly with a quick modificaiton of a single env.

