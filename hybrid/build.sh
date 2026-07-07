#!/bin/bash
pandoc guide.md -o guide.html --css=style.css --self-contained --toc
weasyprint guide.html user_guide.pdf
echo "PDF successfully generated!"

#pandoc guide.md -o booklet.html --css=booklet.css --self-contained --toc
#weasyprint booklet.html booklet.pdf
#echo "Booklet PDF successfully generated!"
