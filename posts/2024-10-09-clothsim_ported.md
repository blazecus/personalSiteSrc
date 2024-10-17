---
title: Cloth Simulator 2 Demo
description: Ported version of my other cloth simulator to another wgpu implementation
categories:
- graphics
- demos
published_date: 2024-10-09 10:45:48.6939197 +0000
layout: posts.liquid
is_draft: false
data:
  thumbnail: /assets/graphics/clothwebgputhumbnail.png
  show_on_homepage: true
---
<div class = "blog-post">
<br>
<div class = "title">
Compute Shader Cloth Simulator - C++ and WebGPU
</div>

<div class = "page-summary">
A repeat of my earlier compute shader implementation of a cloth simulation on WebGPU, now built with C++ and available as an interactive demo on this site
</div>
<hr>
<br>

<a href= {{site.base_url}}/demos/cloth_demo/App.html> Click here to interact with the demo! </a>

This demo uses compute shaders, so it will only work if you have WebGPU enabled, which you can do in Chrome <a href="https://developer.chrome.com/docs/web-platform/webgpu/troubleshooting-tips#:~:text=WebGPU%20is%20disabled%20when%20the,webgpu%20flag%20and%20restart%20Chrome.">like this</a>. Big thanks to Élie Michel for his work on <a href = "https://eliemichel.github.io/LearnWebGPU/index.html">this tutorial series</a>, it was super helpful, and for help on his related discord. If you want to see how this program works, you can look in <a href= "https://github.com/blazecus/WebGPU_Cloth">my repository</a>. There is code from Elie's tutorial in my repo (particularly the code in Application.cpp and ResourceManager.cpp).

I might make a more comprehensive write-up eventually, but there is a very quick explanation of how this type of cloth simulator works on my previous <a href = {{site.base_url}}/posts/2024-09-11-clothsim.html>Rust implementation</a> of the same simulation.

<div class = "bg-div">
<br>
<table class = "image-table">
<tr>
<th><img src="/assets/graphics/new_cloth.PNG"></th>
<th><img src="/assets/graphics/new_cloth2.PNG"></th>
</tr>
<tr>
<th><img src="/assets/graphics/new_cloth3.PNG"></th>
<th><img src="/assets/graphics/webgpucloth.png"></th>
</tr>
</table>
<br>
Now it has lighting!! I'll only include one screenshot, since it's better to experience the demo yourself at the link.
<br>
<br>
</div>
<br>

</div>