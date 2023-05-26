#!/bin/bash

# beamer template
git clone https://github.com/miftanurfarid/master_slide_elektro_itk
mkdir ~/texmf
mkdir ~/texmf/tex
mkdir ~/texmf/tex/latex/
cp -r master_slide_elektro_itk/beamer/ElektroITK ~/texmf/tex/latex/
rm -r master_slide_elektro_itk

# git
git config --global user.name "miftanurfarid"
git config --global user.email "miftanurfarid@gmail.com"
git config --global init.defaultBranch master
