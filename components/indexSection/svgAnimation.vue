<template>
<div class="svg-root">
  <svg class="svg-object" xmlns="http://www.w3.org/2000/svg">
    <g class="path-group">
     <path :d="`M 0 0 Q ${viewWidth / 2} 0 ${viewWidth} 0 L ${viewWidth} 130 L 0 130 L 0 0`">
      <animate attributeName="d"
        attributeType="XML"
        dur="1s"
        :from="`M 0 0 Q ${viewWidth / 2} 0 ${viewWidth} 0 L ${viewWidth} 130 L 0 130 L 0 0`"
        :to="`M 0 0 Q ${viewWidth / 2} 130 ${viewWidth} 0 L ${viewWidth} 130 L 0 130 L 0 0`"
        fill="freeze"/>
     </path>
    </g>
  </svg>

</div>
</template>

<script>
import clientWidth from '~/assets/mixins/clientWidth'
export default {
  mixins: [clientWidth]
}
</script>


<style lang="less" scoped>
.svg-root {
  position: relative;
  z-index: 6;
  height: 130px;
}
.svg-object {
  display: block;
  width: 100%;
}
.path-group {
  stroke: #fff;
  fill: #fff;
  stroke-width: 1;
}
@keyframes svgHeight {
  0% {
    height: 0;
  }
  100% {
    height: 110px;
  }
}

.avg-animate {
  animation: svgHeight 1s ease 3s 1 forwards;
}
</style>
