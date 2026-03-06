---
layout: page
title: Notes
permalink: /notes/
---

This page is a collection of short notes, ideas, and useful snippets that don’t quite fit as full blog posts but are still worth keeping and sharing. Here you’ll find small discoveries, code fragments, quick tips, references, and occasional thoughts gathered over time. 

{% assign posts = site.notes %}

{%- if posts.size > 0 -%}
<ul class="post-list">
  {%- assign date_format = site.minima.date_format | default: "%B %d, %Y" -%}
  {%- for post in posts reversed -%}
  <li class="post-list__item">
    <div class="post-list__entry">
      <span class="post-list__meta">{{ post.date | date: date_format }}</span>
      <a class="post-list__link" href="{{ post.url | relative_url }}">
        {{ post.title | escape }}
      </a>
      <span class="post-list__description">{{ post.description | escape }}</span>
      <div class="post-list__tags">
        {% if post.tags %}
        {% for tag in post.tags %}
        {% assign tslug = tag | slugify %}
        <a class="post__tag" href="{{ '/tag/' | append: tslug | append: '/' | relative_url }}">#{{ tag }}</a>{% unless forloop.last %} {% endunless %}
        {% endfor %}
        {% endif %}
      </div>
    </div>
    {%- if site.minima.show_excerpts -%}
    {{ post.excerpt }}
    {%- endif -%}
  </li>
  {%- endfor -%}
</ul>
{%- endif -%}
