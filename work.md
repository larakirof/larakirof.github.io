---
layout: default
title: ""
---

<div class="work">
  <h4 class="title"></h4>
  <div class="fmly">
  </div>
  <div class="navg">
    <div class="prev"><a>&lt;</a></div>
    <div class="next"><a>&gt;</a></div>
    <div class="back"><a>✕</a></div>
  </div>
  <div class="img"></div>
  <div class="vid"></div>
  <p class="desc"></p>
</div>

<script>
  var prev = "";
  var item = "";
  var next = "";
  var fmly = "";
  var sist = 0;

  function setWork() {

      item = fmly[sist];

      $(".work > h4.title").text(item["Title"]);
      $(".work > p.desc").text(item["Description"]);

      if (fmly.length > 1) {
        $(".fmly").html("");
        $.each(fmly, function(i,e){
          if (i == sist) {
            sis = $("<div class='sis' data-order="+i+">X</div>");
          } else {
            sis = $("<div class='sis' data-order="+i+"><a>O</a></div>");
          }
          $(".fmly").append(sis);
        })
      }

      if (item["Type"] == "img") {
        w = $(".work").width();
        h = window.innerHeight - 180;
        $(".work > div.img").css("background-image","url('/assets/img/"+item["Source"]+"')");
        $(".work > div.img").css("width",w+"px");
        $(".work > div.img").css("height",h+"px");
      }

      if (prev == "") {
          $(".work > div.navg > div.prev > a").hide();
      } else {
          $(".work > div.navg > div.prev > a").prop("href", "/work/"+prev["Address"]);
      }
      if (next == "") {
          $(".work > div.navg > div.next > a").hide();
      } else {
          $(".work > div.navg > div.next > a").prop("href", "/work/"+next["Address"]);
      }
  }

  window.onload = function() {
	if (typeof hash == 'string') sist = parseInt(hash);
	console.log(hash)
	console.log(sist)
    brake = 0;
    $.each(works,function(i,e){
      $.each(Object.values(e)[0],function(ii,ee){
        eee = Object.values(ee)[0][0]
        if(eee["Address"] == title) {
          item = eee;
          fmly = Object.values(ee)[0];
          brake = 1;
        } else {
          if (item == "") prev = eee;
          if (brake == 1 && eee["Category"] == item["Category"]) {
            next = eee;
            brake = 0;
          }
        }
      }) 
    })
    if (prev["Category"] != item["Category"]) prev = "";

    if (item == "") {
      window.location = "/404"
    } else {
      setWork();
    }

    window.onresize = function() { setWork(); }
    $(".fmly").on("click",".sis a", function(e){
      sist = $(e.currentTarget).closest("div.sis").data("order");
	  window.location.hash = sist;
      setWork();
    })
  }
</script>
