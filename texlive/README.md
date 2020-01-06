Based on https://hub.docker.com/r/schickling/latex and https://github.com/schickling/dockerfiles/tree/master/latex

Full texlive distribution as container, based on debian.

Build first: `docker build -t texlive .`

Typical usecase commands:

`docker run --name texlive --rm -v /path/to/latexsource:/source texlive latexmk -c MainLatexFile`
`docker run --name texlive --rm -v /path/to/latexsource:/source texlive latexmk -g -pdf MainLatexFile`
`docker run --name texlive --rm -v /path/to/latexsource:/source texlive latexmk -c MainLatexFile`

`--name` is optional, i just like to tag name on each container