---
title: ReadMe
---

# ReadMe

## Contents

1. [Setup](#setup)
	1. [Prerequisites](#prerequisites)
	2. [Basic Setup](#basic-setup)
	3. [Sync Your Files](#sync-your-files)
	4. [Customize Styles](#customize-styles)
	5. [Customize Template](#customize-template)
2. [Ongoing Usage](#ongoing-usage)
	1. [Build a website from your notes](#build)
	2. [Add a new page](#add-page)
	3. [Add a new category](#add-category)
	4. [Link to another page](#link-to-page)
	5. [Version control with Git](#version-control-git)

## Setup {#setup}

This instructions work on [Fedora](https://fedoraproject.org/) and should work on other GNU/Linux distros. If you run a different operating system, your setup process may differ.

### Prerequisites {#prerequisites}

Install [Pandoc](https://pandoc.org/) and [Git](https://git-scm.com/).

On Fedora, you can install these programs by running the follow command in your terminal:

```
$ sudo dnf install pandoc git
```

### Basic Setup {#basic-setup}

Clone or download this repository to your desktop.

Each category folder has a build.sh file. This file is a Bash script that when executed will covert the Markdown files in that folder to HTML files.

The build scripts will not work until you update them. You only need to update line 5 in the build.sh files; set it to the path for the notes folder. For example, if your username is cam, if you have your notes saved in your Nextcloud folder, and if your notes folder is named "notes-to-website", then line 5 should look like:

```
rootDir=/home/cam/Nextcloud/notes-to-website
```

You will need to update every build.sh file accordingly.

To run the build scripts, execute the script in your terminal, like so. Make sure your terminal window is in the same folder as the build script.

```
$ ./build.sh
```

If you lack permission to run the build files, you can use the `chmod` command to give yourself permission to run the file:

```
$ chmod u+x ./build.sh
```

If you only made changes to notes within one sub-folder, you only need to run the build script for that folder. If you want to update all of your notes at once, you can run the build-all.sh script. Like with the build.sh files, you will need to update line 5 in build-all.sh before you can successfully run it.

That is all the setup that is required. Now you can edit the existing notes and run the build scripts to covert your notes to a simple website.

### Sync Your Files {#sync-your-files}

This notes system is simply a folder with plain text and HTML files inside. If you want your notes to be available across your devices, then you can sync the notes folder using Dropbox, Nextcloud, Syncthing, or whichever file syncing service you prefer.

### Customize Styles {#customize-styles}

The css folder has styles.css, a stylesheet for your notes website. This stylesheet is derived from the styles on [my personal website/blog](https://www.camcoulter.com/) and will switch between light/dark modes depending on your preferences saved in your browser.

All of the webpages reference this stylesheet, so if you make a change here, all of your webpages will update accordingly, without you needing to build them again.

If you want to try customizing how your notes website looks, try this:

1. In the css folder, delete the styles.css file.
2. Find and download a [classless CSS stylesheet](https://dev.to/logrocket/comparing-classless-css-frameworks-3267) that you like. I am a fan of [Water.css](https://watercss.kognise.dev/).
3. Put the classless CSS stylesheet in the css folder, and rename it to "styles.css".

### Customize Template {#customize-template}

The template.html file serves as a template for the webpages. You can edit this file if you want to change the header or add a footer.

If you sync your notes folder to your mobile devices, there is a chance the styles won't display properly on mobile because mobile operating systems are weird. One way to fix this would be to update the template.html file so that it directly includes your CSS styles as an [internal stylesheet](https://developer.mozilla.org/en-US/docs/Learn/CSS/First_steps/How_CSS_is_structured#internal_stylesheet) rather than an externally referenced stylesheet.

Any time you make a change to template.html, you will need to re-build your notes website to see the changes take effect.

## Ongoing Usage {#ongoing-usage}

### Build a website from your notes {#build}

Once you have made a change your notes in Markdown, you will need to run the build scripts to update your notes website.

If you only updated notes in one category folder, you can just execute the build script in that folder. For example:

```
$ ./Lists/build.sh
```

You can also run the build-all script, which will update your entire notes website, making sure it mirrors your Markdown notes.

```
$ ./build-all.sh
```

### Add a new page {#add-page}

To add a new page, first create a plain text file with the extension -.md. Do not include spaces within filenames.

The start of your new notes page should look something like this:

```
---
title: To Read
---
# To Read
```

The title value will serve as the webpage's title. (That's the text you see identifying the tab in your browser.) The text after the number sign will serve as the primary heading for the new page.

You likely want to edit an existing note so that it links to your new note. The simplest way to do this is to open the index.md file for the same category, and add a link there to the new note.

### Add a new category {#add-category}

To add a new category, make a new folder. It should not be nested within an existing category folder.

Create a index.md note for the category within the new folder, and edit the primary index.md note so that it links to the index for the new category.

Copy the build.sh file from an existing category folder, and paste it into your new category folder. Update line 6 so that it references the new category folder.

### Link to another page {#link-to-page}

Here is the standard Markdown syntax for a link: 
`[Cam's personal site](https://www.camcoulter.com)`. That will appear as [Cam's personal site](https://www.camcoulter.com) when converted to HTML.

If you want to link to another file in the same folder, structure your link like so: `[My Notes Homepage](./index.html)`. That will appear as [My Notes Homepage](./index.html) when converted to HTML.

If you are editing the primary index note to link to a note in a category folder, you will need to include the category's folder name within the link, like so: `[To Read](./Lists/to-read.html)`. That will appear as [To Read](./Lists/to-read.html) when converted to HTML.

If you are editing a note within a category to link to a note in a different category, structure your link like so: `[Pandoc](../Tech/pandoc.html)`. That is how you would link a note in your Todo folder to a note in your Tech folder.

Essentially, whatever the filename of the Markdown note is, the filename of the HTML note will be the same, except with the extension changed accordingly. You don't need to include `https://www.` within the link when you are linking to other pages on the same site. When you are linking to other pages on the same site, `./` indicates that a file is available in the current/same folder, and `../` indicates that a file is available the parent folder.

### Version control with Git {#version-control-git}

You can use Git to version control your notes. Review [your notes on Git](./Tech/git.html) for guidance on how it works.

You can make commits every time you edit a note, or you can just commit a routine monthly snapshot if that works better for you.
