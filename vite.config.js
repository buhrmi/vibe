import { defineConfig } from 'vite'
import ruby from 'vite-plugin-ruby'
import { svelte } from '@sveltejs/vite-plugin-svelte';
import importAssets from 'svelte-preprocess-import-assets'
import Unocss from 'unocss/vite'
import presetAttributify from '@unocss/preset-attributify'
import presetUno from '@unocss/preset-uno'
import { extractorSvelte } from '@unocss/core'

export default ({mode}) => {
  const prod = mode == 'production'
  return defineConfig({
    resolve: {
      dedupe: ['axios', 'svelte', '@inertiajs/inertia', '@inertiajs/inertia-svelte']
    },
    build: {
      sourcemap: !prod
    },
    plugins: [
      ruby(),
      svelte({
        experimental: {
          prebundleSvelteLibraries: true
        },
        hot: !prod && {
          preserveLocalState: true
        },
        preprocess: [importAssets()]
      }),
      Unocss({
        extractors: [extractorSvelte],
        presets: [
          presetAttributify(),
          presetUno(),
        ]
      }),
    ],
  })
}