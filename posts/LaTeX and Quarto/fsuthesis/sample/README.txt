This directory contains a complete example thesis to demonstrate how
the FSU Thesis Class can be used to create a properly formatted
document. The file 'thesis.pdf' has been built for you already, but
should you want to rebuild the document yourself, here's the command
sequence:

   pdflatex thesis
   bibtex thesis
   pdflatex thesis
   pdflatex thesis

If you're on a Unix-like system, these steps have already been added
to the 'Makefile', so you only need to type 'make' to build the
document. This command sequence is appropriate for generating a
document which uses PostScript (or Encapsulated PostScript) figures.

The LaTeX source files are liberally annotated. By reading the source
files and studying the output they produce, you should be able to figure
out how the pieces fit together.

                                                        --Bret Whissel
