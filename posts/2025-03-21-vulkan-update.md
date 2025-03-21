---
title: Vulkan Engine Progress
description: Quick Progress Report
categories:
- graphics
- blog
published_date: 2025-03-21 08:14:31.6305164 +0000
layout: posts.liquid
is_draft: false
data:
  thumbnail: /assets/graphics/vkfrogthumbnail.png
  show_on_homepage: true
---
<div class = "blog-post">
<br>
<div class = "title">
Vulkan Engine Progress Report
</div>

<div class = "page-summary">
Short post to show off recent work
</div>
<hr>
<br>

After a couple months of very slow progress, I have been making rapid progress in the past couple weeks. The renderer is in a good state - soon, I'll be able to quickly write up scenes, and will start implementing mesh animations and skinning/bone rigging systems too. I've set up the pipeline for fairly arbitrary render objects. I may do some optimization for objects that share a mesh and don't do any permanent or CPU-side modifications to the mesh. 

I made a quick scene with this <a href = "https://free3d.com/3d-model/banjofrog-v1--699349.html">frog asset</a> I found online to demonstrate the dynamic offset system and memory management for uniform buffers (and possibly vertex buffers and index buffers in the future). Lighting is absent, as that's still in progress - but the skeleton is in place. Then, there is just a post-processing layer that I've barely touched. 

The compute pipeline might be farther in the future - we'll see. Next step is to formalize the scene definitions so I can write them up in a json or something, and some more readable API calls for the actual game and physics engine to access.

That's another consideration for after the renderer is done - I have no idea how much work the physics engine will be, but hopefully nothing too crazy. I'm excited, as this part of the development of the engine is a lot more fun than the boilerplate I had to wade through in the beginning. 

<div class = "bg-div">
<br>
<table class = "image-table">
<th><video controls autoplay src="/assets/graphics/dynamicOffset.mp4"></th>
</table>
<br>
These two frogs only keep track of an offset into a large uniform buffer
<br>
<br>
</div>

</div>