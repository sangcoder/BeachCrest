<template>
  <div :style="{height, width: computedWidth}" class="list-item-loader"></div>
</template>

<script>
export default {
  name: "SkeletonBox",
  props: {
    maxWidth: {
      default: 100,
      type: Number
    },
    minWidth: {
      default: 80,
      type: Number
    },
    width: {
      default: null,
      type: String
    },
    height: {
      default: "1em",
      type: String
    }
  },
  computed: {
    computedWidth() {
      return (
        this.width ||
        `${Math.floor(
          Math.random() * (this.maxWidth - this.minWidth) + this.minWidth
        )}%`
      );
    }
  }
};
</script>
<style>
.list-item-loader {
  display: inline-block;
  vertical-align: middle;
  background-color: #dddbdd;
  position: relative;
  overflow: hidden;
  margin-bottom: 0.35rem;
}
.list-item-loader::after {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  transform: translateX(-100%);
	background-image: -webkit-gradient(linear, left top, right top, color-stop(0, hsla(0, 0%, 100%, 0)), color-stop(20%, hsla(0, 0%, 100%, .2)), color-stop(60%, hsla(0, 0%, 100%, .5)), to(hsla(0, 0%, 100%, 0)));
	background-image: linear-gradient(90deg, hsla(0, 0%, 100%, 0), hsla(0, 0%, 100%, .2) 20%, hsla(0, 0%, 100%, .5) 60%, hsla(0, 0%, 100%, 0));
  animation: shimmer 2s infinite;
  content: "";
}

@keyframes shimmer {
  100% {
    transform: translateX(100%);
  }
}
</style>
