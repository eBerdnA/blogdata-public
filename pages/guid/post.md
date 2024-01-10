---
date: '2021-01-29 08:30:00'
title: "Guid-Page"
type: page
slug: /guid
language: en
properties:
    tags: []
published: true
...
<style>
    #guid-output {
        margin-top: 10px;
    }
    #guid-output div{
        line-height: 1.5em;
        margin-bottom: 20px;
    }
    #uuidv4 {
        border: 1px solid #cecece;
        padding: 4px;
    }
    .flash {
        transition: 0.2s;
        box-shadow: 0px 0px 40px #cecece;
    }
    #uuidv4Copy {
        cursor: pointer;
    }
</style>
<div id="guid-output">
    <div>Just a simple page where one can always get a fresh <a href="https://en.wikipedia.org/wiki/Universally_unique_identifier" target="_blank">UUID</a>. Implementation based on this: <a href="https://stackoverflow.com/a/2117523/715348" target="_blank">https://stackoverflow.com/a/2117523/715348</a></div>
    <div>
        <span id="uuidv4"></span>
        <span id="uuidv4Copy" title="Copy UUID">&#128203;</span>
    </div>
    
</div>
<script>
function uuidv4() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}
function copyText(element) {
  var textToCopy = element.innerText;
  var myTemporaryInputElement = document.createElement("input");
  myTemporaryInputElement.type = "text";
  myTemporaryInputElement.value = textToCopy;
  document.body.appendChild(myTemporaryInputElement);
  myTemporaryInputElement.select();
  document.execCommand("Copy");
  document.body.removeChild(myTemporaryInputElement);
}
function flashElement(element) {
  element.classList.add("flash");
  document.addEventListener("transitionend", function() {
    setTimeout(function() {
      element.classList.remove("flash");
    }, 1000);
  });
}
document.addEventListener("DOMContentLoaded", function() {
    element = document.getElementById("uuidv4");
    element.innerHTML = uuidv4();

    // https://codepen.io/bharatramnani94/pen/bYqbZm
    var uuidv4CopyDiv = document.getElementById('uuidv4Copy');
    uuidv4CopyDiv.addEventListener('click', function (e) {
        //if (e.target.className !== 'title') return;
        copyElement = document.getElementById("uuidv4");
        var element = e.target;
        flashElement(element);
        copyText(copyElement);
    });
});
</script>