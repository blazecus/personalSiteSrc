---
title: gamedevhome
layout: pages.liquid
permalink: /{{categories}}
categories: 
  - gamedev
---
## Blog!

{% for post in collections.posts.pages %}
#### {{post.title}}

[{{ post.title }}]({{ post.permalink }})
{% endfor %}
