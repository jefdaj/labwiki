<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!-- the moz* settings fix a firefox bug so it honors the lack of margins in print.css -->
<html moznomarginboxes mozdisallowselectionprint
    xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="icon" sizes="128x128" href="$base$/img/favicon.png">
    $if(feed)$
    <link href="$base$/_feed/" type="application/atom+xml" rel="alternate" title="Sitewide ATOM Feed" />
    <link href="$base$/_feed$pageUrl$" type="application/atom+xml" rel="alternate" title="This page's ATOM Feed" />
    $endif$
    <title>$wikititle$ - $pagetitle$</title>
    $if(printable)$
    <link href="$base$/css/print.css" rel="stylesheet" media="all" type= "text/css" />
    $else$
    <link href="$base$/css/custom.css" rel="stylesheet" media="screen, projection" type="text/css" />
    <link href="$base$/css/print.css" rel="stylesheet" media="print" type= "text/css" />
    $endif$
    <!--[if IE]><link href="$base$/css/ie.css" rel="stylesheet" media="screen, projection" type="text/css" /><![endif]-->
  </head>
  <body>
    <div id="doc3" class="yui-t1">
        <div id="yui-main">
          <div id="maincol" class="yui-b">
            $tabs$ 
            $content()$
            $footer()$
          </div>
        </div>
        <div id="sidebar" class="yui-b first">
          $logo()$
          $if(sitenav)$
            $sitenav()$
          $endif$
          $if(pagetools)$
            $pagetools()$
          $endif$
          $if(markuphelp)$
            $markuphelp()$
          $endif$
          <!-- $userbox()$ -->
        </div>
    </div>
    $javascripts$
    $expire()$
    $getuser()$

    <style type="text/css" media="screen">
    #editor { 
      height: 100%;
      width: 100%;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 12px;
      font-family: Monaco, "DejaVu Sans Mono", Courier, monospace;
    }
    #editedText {
      visibility: hidden;
      display: none;
    }
    </style>
    <script src="$base$/js/ace/ace.js" type="text/javascript" charset="utf-8"></script>
    <script>
        var ta = document.getElementById("editedText");
        var editorDiv = document.createElement("div");
        editorDiv.setAttribute("id", "editor");
        ta.parentNode.insertBefore(editorDiv, ta.nextSibling);
        var editor = ace.edit(editorDiv);
        editor.getSession().setValue(ta.value);
        editor.getSession().on('change', function(){
          ta.value = editor.getSession().getValue();
        });
        editor.setTheme("ace/theme/dawn");
        editor.getSession().setMode("ace/mode/markdown");
        editor.setHighlightActiveLine(false);
        editor.setShowPrintMargin(false);
        editor.getSession().setUseWrapMode(true);
        editor.setKeyboardHandler("ace/keyboard/vim");
        editor.setAutoScrollEditorIntoView(true);
        editor.setBehavioursEnabled(false)
        editor.setOption("maxLines", Infinity);
        editor.setOption("softWrap", 80);
        editor.focus();
    </script>
  </body>
</html>
