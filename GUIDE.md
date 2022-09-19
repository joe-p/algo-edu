# Generating Presnetations

All of the source material is written in markdown with the intention of being converted to a presentation. To do so, a tool called [marp](https://marp.app/) is used. To generate a presnetation for all of the content in this repository you must follow the following steps

1. Ensure NodeJS is installed
2. At the root of the repo, run `npm i` to install `marp-cli` and all of its dependencies
3. Run `npm start`

This process will take a minute. Warnings about accessing local files can be ignored. 

By default, the presentations will use the theme specified in [algorand.css](./algorand.css). This theme was written to mirror the Algorand Foundation's internal presentation template. The presentations will also use the image named `bg.png` at the root of the repository for the background of every slide. `title_bg.png` will be used for title slides. If you would like access to the Algorand Foundation backgrounds, contact [Joe Polny](https://github.com/joe-p). In general, these will only be given to Algorand Foundation employees or partners.

Running `npm zip` will put all of the `.md`, `.pdf`, and `.pptx` in this repository (not counting the root directory) into a single zip file labeled with the latest git commit hash.

# Marp and VSCode

The marp extension can be used with VSCode to see the presnetation preview while editing.