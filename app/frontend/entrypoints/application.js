import { Inertia } from '@inertiajs/inertia'
import { createInertiaApp } from '@inertiajs/inertia-svelte'
import { InertiaProgress } from '@inertiajs/progress'
import axios from 'axios'

import '@unocss/reset/tailwind.css'
import 'virtual:uno.css'
import '~/stylesheets/global.css'

import Layout from '../pages/_layout.svelte'

const pages = import.meta.glob('../pages/**/*.svelte')  

const csrfToken = document.querySelector('meta[name=csrf-token]').content
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

InertiaProgress.init()

createInertiaApp({
  resolve: async name => {
    const page = await pages[`../pages/${name}.svelte`]()
    return Object.assign({layout: Layout}, page)
  },
  setup({ el, App, props }) {
    new App({ target: el, props })
  },
})

// Reload page props after logged in
window.addEventListener('message', function(event) {
  if (event.data == 'logged_in') Inertia.reload({onSuccess: () => setTimeout(window.afterLogin, 1)})
})
