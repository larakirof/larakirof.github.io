---
layout: default
title: ""
---

<div class="index">
</div>

<script type="text/javascript">
    window.onload = function(){
      $.each(works,function(i,e){
        col = $("<div class='column'></div>");
        $(".index").append(col);
        col.append("<h4>"+Object.keys(e)[0]+"</h4>");
        ul = $("<ul></ul>");
        col.append(ul)
        $.each(Object.values(e)[0],function(ii,ee){
        console.log(Object.values(ee)[0][0])
          ul.append("<li><a href='/work/"+Object.keys(ee)[0]+"'>"+Object.values(ee)[0][0]["Title"]+"</a></li>");
        })
      })
    }
</script>
