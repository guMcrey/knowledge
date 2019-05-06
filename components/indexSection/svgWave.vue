<template>
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="width:100%;height:100%;">
  <g class="path-group" style="fill: none; stroke: #f6f6f6;">
    <path :d="`M 0 200 C 600 100, 800 600, ${viewWidth} 400`">
      <animate attributeName="d"
        attributeType="XML"
        dur="8s"
        :values="`M 0 0 C 0 0, 0 0, ${viewWidth} 0;M 0 200 C 600 100, 800 600, ${viewWidth} 400;M 0 ${viewWidth} C 0 ${viewHeight}, ${viewWidth / 2} ${viewHeight * 2}, ${viewWidth} ${viewHeight}`"
        fill="freeze"
        repeatCount="indefinite"
        calcMode="linear"/>
    </path>
    <path :d="`M 0 250 C 600 200, 800 800, ${viewWidth} 450`">
      <animate attributeName="d"
        attributeType="XML"
        dur="8s"
        :values="`M 0 0 C 0 0, 0 0, ${viewWidth} 0;M 0 250 C 600 200, 800 800, ${viewWidth} 450;M 0 ${viewWidth} C 0 ${viewHeight}, ${viewWidth / 2} ${viewHeight * 2}, ${viewWidth} ${viewHeight}`"
        fill="freeze"
        repeatCount="indefinite"
        calcMode="linear"/>
    </path>
    <path :d="`M 0 300 C 600 300, 800 1000, ${viewWidth} 500`">
      <animate attributeName="d"
        attributeType="XML"
        dur="8s"
        :values="`M 0 0 C 0 0, 0 0, ${viewWidth} 0;M 0 300 C 600 300, 800 1000, ${viewWidth} 500;M 0 ${viewWidth} C 0 ${viewHeight}, ${viewWidth / 2} ${viewHeight * 2}, ${viewWidth} ${viewHeight}`"
        fill="freeze"
        repeatCount="indefinite"
        calcMode="linear"/>
    </path>
  </g>
</svg>
</template>

<script>
import clientWidth from '~/assets/mixins/clientWidth'

export default {
  mixins: [clientWidth]
}
</script>
