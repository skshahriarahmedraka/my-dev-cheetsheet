## shortcut

     npm install tailwindcss-question-mark
    npm install @tailwindcss/line-clamp
    npm install -D @tailwindcss/forms
    npm install -D @tailwindcss/aspect-ratio
    npm install -D prettier prettier-plugin-tailwindcss
    npm install -D @tailwindcss/typography
    npm install @tailwindcss/container-queries
    npm install -D prettier prettier-plugin-tailwindcss
    
        require('tailwindcss-question-mark'),
        require('@tailwindcss/line-clamp'),
        require('@tailwindcss/typography'),
        require('@tailwindcss/aspect-ratio'),
        require('@tailwindcss/forms'),
        require('prettier-plugin-tailwindcss')
        require('@tailwindcss/container-queries'),

## text

    text-xl
    text-left
    text-transparent
    text-gray-500
    text-opacity 

## 

@ extentions :
1.tailwindcss-question-mark
https://github.com/GavinJoyce/tailwindcss-question-mark

    1# npm install tailwindcss-question-mark
    2# module.exports = {
          theme: {
            // ...
          },
          plugins: [
                require('tailwindcss-question-mark'),
            // ...
          ],
    }
    
    3# Simply add the ? utility class to any element that you'd like to         highlight.

2. How to Multi-Line Truncate Text in Tailwind CSS 
    1# npm install @tailwindcss/line-clamp
    2# module.exports = {
   
          plugins: [
            require('@tailwindcss/line-clamp'),
          ],
   
    }
    3# <p class="line-clamp-2">

3. https://github.com/tailwindlabs/tailwindcss-forms
   
    1#  
    npm install -D @tailwindcss/forms
   
    2#
    // tailwind.config.js
    module.exports = {
      theme: {    
   
        // ...
   
      },
      plugins: [
   
            require('@tailwindcss/forms'),
            // ...
          ],
   
    }
   
    3#
   
    Here is a complete table of the provided `form-*` classes for reference:

| Base                      | Class              |
| ------------------------- | ------------------ |
| `[type='text']`           | `form-input`       |
| `[type='email']`          | `form-input`       |
| `[type='url']`            | `form-input`       |
| `[type='password']`       | `form-input`       |
| `[type='number']`         | `form-input`       |
| `[type='date']`           | `form-input`       |
| `[type='datetime-local']` | `form-input`       |
| `[type='month']`          | `form-input`       |
| `[type='search']`         | `form-input`       |
| `[type='tel']`            | `form-input`       |
| `[type='time']`           | `form-input`       |
| `[type='week']`           | `form-input`       |
| `textarea`                | `form-textarea`    |
| `select`                  | `form-select`      |
| `select[multiple]`        | `form-multiselect` |
| `[type='checkbox']`       | `form-checkbox`    |
| `[type='radio']`          | `form-radio`       |

4. https://github.com/tailwindlabs/tailwindcss-aspect-ratio
   
    1# npm install -D @tailwindcss/aspect-ratio
   
    2#
   
    // tailwind.config.js
    module.exports = {
      theme: {
   
        // ...
   
      },
      corePlugins: {
   
        aspectRatio: false,
   
      },
      plugins: [
   
        require('@tailwindcss/aspect-ratio'),
        // ...
   
      ],
    }
   
    3#
    Combine the aspect-w-{n} and aspect-h-{n} classes to specify the aspect ratio for an element:
   
   <div class="aspect-w-16 aspect-h-9">
      <iframe src="https://www.youtube.com/embed/dQw4w9WgXcQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-            picture" allowfullscreen></iframe>
    </div>

5.
    1#
    npm install -D @tailwindcss/typography

    2#
    module.exports = {

  theme: {
    // ...
  },
  plugins: [
    require('@tailwindcss/typography'),
    // ...
  ],
}

    3#
    class="prose lg:prose-xl"

## format on save

    npm install -D prettier prettier-plugin-tailwindcss

## flow byte

    npm i -D flowbite flowbite-svelte @floating-ui/dom classnames @popperjs/core

```
const config = {
  content: [
    "./src/**/*.{html,js,svelte,ts}",
    "./node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}",
  ],

  theme: {
    extend: {},
  },

  plugins: [
    require('flowbite/plugin')
  ],
  darkMode: 'class',
};

module.exports = config;
```

## Container Query

```
https://github.com/tailwindlabs/tailwindcss-container-queries
```
