#!/bin/bash

# Capture the argument passed to the script (e.g., --book)
MODE="$1"

# Convert Markdown to HTML
# pandoc guide.md -o guide.html --css=style.css --self-contained --toc
pandoc guide.md -o guide.html --css=style.css --embed-resources --standalone --toc
echo "HTML successfully generated!"

# Convert HTML to PDF using WeasyPrint
weasyprint guide.html user_guide.pdf 2> /dev/null
echo "PDF successfully generated!"


# Only run the booklet conversion if --book is passed as an argument
if [ "$MODE" = "--book" ]; then
    echo "Creating booklet layout..."
    echo "1. Separate ALL pages into individual files (page-1.pdf, page-2.pdf, etc.)"
    pdfseparate user_guide.pdf page-%d.pdf 2> /dev/null
 

    echo "2. Unite just pages 1 through 13 into your booklet source.."
    pdfunite page-{1..13}.pdf booklet_source.pdf 2> /dev/null

    echo "3. Unite pages 14 through 16 into the trailing section.."
    pdfunite page-{14..16}.pdf appendixB.pdf 2> /dev/null

    echo "4. Create book using pdfbook2.."
    pdfbook2 --short-edge booklet_source.pdf 

    echo "5. Combine the final pieces.."
    pdfunite booklet_source-book.pdf appendixB.pdf final_output-book.pdf 2> /dev/null

    echo "6. Clean up the temporary individual page files.."
    rm page-*.pdf booklet_source.pdf appendixB.pdf booklet_source-book.pdf
    
    echo "Booklet successfully generated! Print 'final_output-book.pdf' with double-sided printing and short edges."
else
    echo "Standard PDF generated. Skipping booklet creation (run with '--book' to generate booklet)."
fi