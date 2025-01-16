---
title: Vulkan Engine
description: Beginning a graphics engine in Vulkan with C++
categories:
- graphics
- blog
published_date: 2025-01-16 11:07:34.3553232 +0000
layout: posts.liquid
is_draft: false
data:
  thumbnail: /assets/graphics/vulkan_logo.jpg
  show_on_homepage: true
---
<div class = "blog-post">
<br>
<div class = "title">
Vulkan 1.3 Graphics Engine
</div>

<div class = "page-summary">
My first attempt at a full graphics engine
</div>
<hr>
<br>

For all the graphics work I have done, I have actually not worked with Vulkan much until now. But I figured I would learn it the same way I learn pretty much all the programming knowledge I have, which is to just try to make something with it. The goal with this engine is to make a small and very specific engine for a relatively simple game. It will be a physics-heavy game, which I will also write myself - we'll see how that goes. 

To start, I followed the <a href= "https://vulkan-tutorial.com/">official tutorial</a>, fitting the relevant parts into a more scalable structure for the future engine. The initial boilerplate code fits into the same general blocks that WebGPU follows - swapchains, surfaces, pipelines, command pools, and the like. It's a testament to how low-level Vulkan is that to get a triangle to appear on a window, it takes over 1000 lines of code. But at least it's satisfying once you get to that point. 

I'm debating the extent of the GUI this engine will have - since this is essentially an engine designed for a single game, I'm skeptical that I will need a GUI much, especially since I don't plan on designing any crazy maps. The game I am imagining will have simple maps that will easily be designed - hopefully I'll be able to achieve decently nice visuals with procedurally generated backdrops and maybe nice models and procedural animations for the characters. 

That's another aspect to this project - given the graphics and physics go well, I will implement multiplayer, perhaps with rollback. I have done a decent amount of netcoding in Godot (https://github.com/blazecus/LumiCycles), but I was constantly frustrated by how the engine limits you - I think netcode would actually be enjoyable if I had more control over each packet and synchronization methods. 

</div>