---
title: Fixing the Bloodborne Vertex Explosion
categories:
- graphics
- blog
published_date: 2025-03-19 08:51:26.922766 +0000
layout: posts.liquid
is_draft: false
data:
  show_on_homepage: true
  thumbnail: /assets/graphics/bbthumbnail.png
---
<div class = "blog-post">
<br>
<div class = "title">
Vertex Explosion in Bloodborne on the ShadPS4 Emulator
</div>

<div class = "page-summary">
Investigating an interesting bug in an emulated version of Bloodborne
</div>
<hr>
<br>

I bought Dark Souls for $6 during the winter Steam sale in 2013, not really knowing anything about it back then - I've been a fan of From Software since then. I've played all their games but the Playstation exclusive ones. Recently, a couple of friends have been hounding me to play Bloodborne. While I still haven't gotten around to playing it, it got me interested in the emulator that has been making the news recently for finally making the game playable on PC - ShadPS4. In particular, I wanted to see if there was anything I could help with in the development of the emulator - particularly for making Bloodborne more playable. 

I got the Visual Studio project up and running, browsed the source code, joined the Discord, and looked at the git issues to see what work was still being done. An emulator for a modern console system like the PS4 is a large project, so naturally there was still a lot of work being done, but the most relevant to me was a lingering bug that showed up in Bloodborne - vertex explosions originating from the face of human characters. The bug report is still open <a href = https://github.com/shadps4-emu/shadPS4/issues/1232> here.</a>. Perhaps it could be fun to try to fix this and learn from the experience. 

<div class = "bg-div">
<br>
<table class = "image-table">
<tr>
<th><img src="/assets/graphics/bbfacegen1.png"></th>
<th><img src="/assets/graphics/bbfacegen2.jpg"></th>
</tr>
</table>
<br>
A couple examples of the more extreme version of the vertex explosion glitch as seen in the bug report.
<br>
<br>
</div>
<br>

This is not a hard bug to replicate. You can manually trigger it by changing your face rapidly in the character creator - you can even crash the game this way. Or just play it for a few minutes, and it will show up on the main character when respawning or when entering an area triggering loading. It's such a debilitating bug for the experience that you can't really play the game without the temporary fix, which simply removes the FaceGen functionality in the game (the mesh tool that Bloodborne uses for customized faces). The bug shows up in a couple of variations - the complete explosion, where vertices will appear in random locations, covering much of the screen, and the "veil", where the face has some zero vertices that result in triangles pointing to the ground - for some characters, it gave the appearance of a veil. 

<div class = "bg-div">
<br>
<table class = "image-table">
<tr>
<th><img src="/assets/graphics/bbfaceexplosion.png"></th>
<th><img src="/assets/graphics/rdoc.png"></th>
</tr>
</table>
<br>
The veil bug as seen in-game and in RenderDoc.
<br>
<br>
</div>
<br>

I struggled for a while looking at what could cause this type of bug. Looking at the affected regions in RenderDoc, it appeared entirely in vertices modified by proprietary FaceGen code - but then again, not on the native PS4 console, only on the emulator. Was it an error in FaceGen or the Bloodborne engine that the PS4 memory management auto-corrected somehow? Seemed unlikely, and I hoped so, because learning to reverse engineer Bloodborne would make this into a much larger problem. And why was the issue only appearing on certain loading frames? Some in the Discord floated ideas about race conditions affecting memory management. I traced the problematic buffers in both the GPU and CPU memories by comparing index buffer lengths as seen in RenderDoc and the Visual Studio debugger, which was helpful to determine when some of the problem buffers were being mapped and when they weren't, but it didn't really help me find the source of the problem. 

At the very least, I was on the right track. This is a memory management issue - particularly in the difference between CPU and GPU memory. The PS4 doesn't have this distinction - it uses unified memory. When the GPU modifies a buffer, the CPU doesn't need to do any copying/mapping to access these modifications. ShadPS4 has a system to emulate this, of course, and I imagine it is a common and well known problem in emulator development. I was asking about this system on the Discord and found out that it was still missing some features - in particular, GPU readbacks. In fact, the GPU developer who was making the readback system figured that not having readbacks was causing the vertex explosions. 

The arcane methods of FaceGen must expect up to date buffer information when modifying on the CPU side - it's hard to say what FaceGen is doing that the rest of Bloodborne (and many other games that run in ShadPS4) doesn't. But I was able to show that readbacks did, in fact, fix the vertex explosion bug, and in a very robust fashion. That same <a href = https://github.com/raphaelthegreat>GPU developer</a> suggested to test the idea by introducing a readback when memory is invalidated in the buffer cache (this is actually what is being called on those "load" frames that were causing the issue). Specifically, I needed to readback any invalidated data that had been modified on the GPU side. On my fork, I tried this (<a href = https://github.com/blazecus/shadPS4/commit/364e04b8464dc3cfe05b427fcbcfc1695bb122c2>link</a>) - and no more vertex explosions appeared for me or anyone else on the Discord who tried it. 

It's far from a complete fix, though. It is just a proof of concept, but in no way is this performant - it introduces large lag spikes. A more comprehensive readback system is in progress, that involves a separate thread to queue up downloads and protect areas in the memory so that buffers with queued downloads (readbacks) cannot be read by the CPU before being downloaded. The naive readback I implemented also resulted in another bug that wasn't unfamiliar to Bloodborne emulators - rainbow hair, probably from the corruption of a texture. I expect a better readback system might take care of this as well.  

<div class = "bg-div">
<br>
<table class = "image-table">
<tr>
<th><img src="/assets/graphics/rainbowhair.png"></th>
</tr>
</table>
<br>
Texture corruption
<br>
<br>
</div>
<br>

It was very satisfying to never see a vertex explosion again after hours of trying different esoteric fixes to the problem - I only wish I could help with the better readback system. Nevertheless, I definitely learned a lot about how emulators work, and got some insight into common Vulkan practices as well, which was useful as I continue to work on my own Vulkan engine. Recently, I've been making good progress on that front - I'm excited to put the renderer to use for a game. 

</div>