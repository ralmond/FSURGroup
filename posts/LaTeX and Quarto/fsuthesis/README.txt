FSU LaTeX Class for Producing Theses and Dissertations

This folder contains the following files:

 -- README                    (this file)

 -- fsuthesis.dtx             The self-documenting source for the
                              FSU Thesis Class file

 -- fsuthesis.ins             The LaTeX installation file for the
                              FSU Thesis Class

 -- user-guide.tex            The LaTeX source file for the 
                              FSU Thesis Class User's Guide

 -- user-guide.pdf            The User's Guide in PDF form

 -- Makefile                  A Unix-style Makefile for performing
                              simple class file manipulations

 -- thesis-template [folder]  A collection of files for creating a
                              new Dissertation or Thesis using the
                              FSU Thesis Class. See the User's
                              Guide for more information.

 -- sample [folder]           A heavily-annotated collection of files
                              that generate a complete example thesis,
			      including equations, figures, and a
			      bibliography.

Assuming you already have a complete LaTeX installation on your
computer, copy the 'thesis-template' folder to a new location, then
read the User's Guide to help you get started using the FSU Thesis
class. If you keep your document within this folder, no further
installation will be required.

If you wish to install the FSU Thesis Class file for system-wide
use, you will first need to extract the class file. On a Unix or
Unix-like operating system, simply type 'make' to extract the FSU
Thesis Class file and build the documentation. On a non-Unix
operating system, run 'latex' on the 'fsuthesis.ins' file, i.e.:

  latex fsuthesis.ins

This creates a file called 'fsuthesis.cls', the actual LaTeX FSU
thesis class file. You may then move this file to wherever the
standard LaTeX files have been installed. If you don't know where
this is, or if you do not have proper access to the installation
directory, then you may use the version that's already unpacked in
the 'thesis-template' folder.

The 'user-guide.pdf' file is pre-built documentation that will help
you to get started using LaTeX to write your thesis or dissertation.
You may read this guide using Adobe Acrobat Reader (or some other
PDF file viewer), or you may print the guide for reference.

If you wish to alter the FSU Thesis Class file, you should change
the code in 'fsuthesis.dtx' and re-run 'latex fsuthesis.ins'.
(Modifying the class source code requires a good working knowledge
of LaTeX internals. You might want to make a back-up copy of the
'fsuthesis.dtx' file first.) If you run 'latex fsuthesis.dtx', you
will get a pretty-printed version of the class file code with
extensive documentation.
