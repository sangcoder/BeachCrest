<template>
  <div class="beachCrest_loading">
    <div class="loader"></div>
  </div>
</template>
<script>
export default {};
</script>
<style>
.beachCrest_loading {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 9999999;
  background: rgba(255, 255, 255, 0.6);
}
.loader {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 50px;
  height: 6px;
  background: #5191fa;
  border-radius: 5px;
  margin-left: -25px;
  animation: load 1.8s ease-in-out infinite;
}
.loader:before,
.loader:after {
  position: absolute;
  display: block;
  content: "";
  animation: load 1.8s ease-in-out infinite;
  height: 6px;
  border-radius: 5px;
}
.loader::before {
  top: -20px;
  left: 10px;
  width: 40px;
  background: #fa5636;
  margin-left: -20px;
}
.loader::after {
  bottom: -20px;
  width: 35px;
  background: #ffab53;
  margin-left: -17px;
}
@keyframes load {
  0% {
    transform: translateX(40px);
  }
  50% {
    transform: translateX(-30px);
  }
  100% {
    transform: translateX(40px);
  }
}
</style>