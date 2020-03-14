# Azure Icon PNGs and Microsoft Whiteboard

![Image showing Microsoft Whiteboard with some sample icons and text](./images/heroimage.png)

---
## Overview
This document outlines a process for converting the Azure Icon SVGs to PNGs for easy use in "**[Microsoft Whiteboard](https://whiteboard.microsoft.com/)**"

It leverages the `SvgConsole.exe` sample application from [SVG.NET](http://github.com/vvvv/SVG/) and a simple PowerShell script to create copy of the "[Microsoft Azure Cloud and AI Symbol / Icon Set -SVG](https://www.microsoft.com/en-us/download/details.aspx?id=41937)" directory structure, and the transforms all `*.svg` files to `*.png` using `SvgConsole.exe` as well as copying any existing `*.png` files in the source over as well.  

The transformed `*.png` files are sized to 48x48 to make them easy to drag into a Microsoft Whiteboard session without having to re-size them.  However, if you want to them be sized larger, you can edit the `$maxwidth` and `$maxheight` variables in the `convertAzureIcons.ps1` powershell script.  Any existing `*.png` files however are copied at their original size. 

The steps aren't hard, and since the icon set isn't mine, and it is subject to change (hopefully with a bunch of awesome new icons), instead of just including them here, I'll show you how to create the `.png` versions yourself.  It isn't hard.  Just a few steps, and those are:

1. [Downloading and extracting the "Microsoft Azure Cloud and AI Symbol / Icon Set -SVG"](#icon-set)
1. [Cloning the SVG.NET repo](#svg-net-repo)
1. [Cloning the azure-icon-pngs Repo](#azure-icon-pngs)
1. [Compiling & Publishing the `SvgConsole` sample application](#svgconsole)
1. [Running `convertAzureIconsToPng.ps1`](#convert)
1. [Using Microsoft Whiteboard](#whiteboard)

---
<a name="icon-set"></a>
## Downloading and extracting the "Microsoft Azure Cloud and AI Symbol / Icon Set -SVG"

First, we'll start by downloading the "[Microsoft Azure Cloud and AI Symbol / Icon Set -SVG](https://www.microsoft.com/en-us/download/details.aspx?id=41937)" and extracting it to a known location (I use `c:\Azure Icons` and will assume that path by default).

> **Note**: At the time this is being written, the "Microsoft Azure Cloud and AI Symbol / Icon Set -SVG" download file is named `Microsoft_Cloud_AI_Azure_Service_Icon_Set_2019_09_11.zip`.  Indicating that the icon set was current on 2019_09_11.  My hope is that the same link points to updated files in the future, but you may need to search to see if there is a newer version of the icons at a different URL when you do this.  

1. Download the "[Microsoft Azure Cloud and AI Symbol / Icon Set -SVG](https://www.microsoft.com/en-us/download/details.aspx?id=41937)"
1. Extract the downloaded .zip file to a known location.  I, and the `convertAzureIconsToPng.ps1` script, assume they will be extracted to the `C:\Azure Icons\` directory but you can put them wherever you like.  Just pay attention to the path you choose, and use that location to override the default paths in the script later. 
1. The zip file contains a sub-folder named `.\azure-icons` that contains the actual icon set directory tree.  As an example, after extracting the .zip file to the `C:\Azure Icons\` path, I have the following folder structure:

  ![Extracted Zip File Folder Structure](./images/extractedzip.png)

1.  If you take the time to explore the files in under the `.\azure-icons\` folder, you'll see lots of awesome `*.svg` icon files for most if not all of the Azure services.  The only issue is that the `Microsoft Whiteboard` app, can't import `.svg` files. 😡.  We'll fix that though!  

---
<a name="svg-net-repo"></a>
## Cloning the SVG.NET repo

To help us convert those `*.svg` that "**Microsoft Whiteboard**" can't use to a `*.png` file that it can, we'll leverage an open source library called [SVG.NET](http://github.com/vvvv/SVG).  That repo even contains a sample application that can do the conversion for us, we just need to get it and compile it.  

1. First, you'll need to make sure that you have the latest "**.NET Core SDK**".  You can download and install it from [https://dotnet.microsoft.com/download](https://dotnet.microsoft.com/download)

---
<a name="azure-icon-pngs"></a>
## Cloning the azure-icon-pngs Repo

Next cloning this repo so that you can get to the `convertAzureIconsToPng.ps1` powershell script. 


---
<a name="svgconsole"></a>
## Compiling & Publishing the `SvgConsole` sample application

```
cd Samples/SvgConsole
dotnet publish -f netcoreapp2.2 -c Release -r win-x64 -o "C:\Azure Icons\SvgConsole"
cd SvgConsole-win-x64-netcoreapp2.2
```

---
<a name="convert"></a>
## Running `convertAzureIconsToPng.ps1`

