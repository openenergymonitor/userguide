Instruction guides

## Install 

For Ubuntu/Debian based systems

```
sudo apt update
sudo apt install pandoc weasyprint python3-pip texlive-extra-utils poppler-utils ocrmypdf
```

Optional: Install a live previewer like VS Code or Typora
`sudo snap install code --classic`

## The Project Structure

```
user-guide/
├── guide.md          # Your actual content
├── style.css         # Styling, page size, margins, and fonts
└── build.sh          # A simple script to compile it all
```

## Build

Run `./build.sh` to generate PDF and HTML
