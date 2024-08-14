---
title: gamedevhome
layout: default.liquid
permalink: /{{categories}}
categories: 
  - GameDev
---
## Blog!

{% for post in collections.posts.pages %}
#### {{post.title}}

[{{ post.title }}]({{ post.permalink }})
{% endfor %}
