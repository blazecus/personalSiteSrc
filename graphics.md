---
title: graphics
layout: default.liquid
permalink: /{{categories}}
categories: 
  - Graphics
---
## Blog!

{% for post in collections.posts.pages %}
#### {{post.title}}

[{{ post.title }}]({{ post.permalink }})
{% endfor %}
