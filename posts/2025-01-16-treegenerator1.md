---
title: Initial Tree Generation
description: First pass at L-system tree generation for a physics simulation project
categories:
- graphics
- demos
published_date: 2025-01-16 10:49:44.2118679 +0000
layout: posts.liquid
is_draft: false
data:
  thumbnail: /assets/graphics/TreeEngine/tree_thumbnail.png
  show_on_homepage: true
---
<div class = "blog-post">
<br>
<div class = "title">
Tree Engine: Procedural Tree Generation and Physics
</div>

<div class = "page-summary">
A more advanced version of my previous L-System project
</div>
<hr>
<br>

I have taken a break from this project in favor of working with Vulkan, but this is another WebGPU project I've been working on. The goal is to produce very realistic tree meshes, with leaves, and then use the tree structure to simulate physics on the tree (wind, gravity, branch collision and compression) using the compute shaders that WebGPU provides. So far, I have made good progress on the trunk and branch generation using lots of modifications to L-systems and some janky collision code. Here is an example of the current state:

<div class = "bg-div">
<br>
<table class = "image-table">
<th><img src="/assets/graphics/TreeEngine/tree_mesh1.png"></th>
</table>
<br>
The mesh generation is just a noisy cylindrical method
<br>
<br>
</div>
<br>

I have this project up on <a href = "https://github.com/blazecus/TreeEngine">GitHub</a>, the bulk of the code is in TreeGenerator.cpp and OccupancyGrid.cpp. I've added a readme with images as well. The client has a lot of options for tree generation that can be modified - when I complete the project I'll write up an explanation for each of them. The next step is to add leaves, texture mapping, and then we can move on to compute shader physics. 

Here are some other images of trees at various stages of the project.

<div class = "bg-div">
<br>
<table class = "image-table">
<tr>
<th><img src="/assets/graphics/TreeEngine/bfs_tree.PNG"></th>
<th><img src="/assets/graphics/TreeEngine/tree1.PNG"></th>
</tr>
<tr>
<th><img src="/assets/graphics/TreeEngine/tree2.PNG"></th>
<th><img src="/assets/graphics/TreeEngine/tree2_2.PNG"></th>
</tr>
<tr>
<th><img src="/assets/graphics/TreeEngine/tree_mesh2.PNG"></th>
<th><img src="/assets/graphics/TreeEngine/tree_mesh3.PNG"></th>
</tr>
</table>
<br>
Trees generated at various versions of the project
<br>
<br>
</div>

</div>