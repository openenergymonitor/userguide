#!/bin/bash
pandoc guide.md -o guide.html --css=style.css --self-contained --toc
weasyprint guide.html user_guide.pdf
echo "PDF successfully generated!"
