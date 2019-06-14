<template>
  <div>
      <div v-if="distance !== 0" class="countdown">
       <div class="block">
        <span :class="days === '0' ?  'd-none' :'digit'" >Còn {{ days | twoDigits}} ngày</span>
        <span class="digit">{{ hours | twoDigits }} :</span>
        <span class="digit">{{ minutes | twoDigits  }} :</span>
        <span class="digit">{{ seconds | twoDigits }}</span>
    </div>
  </div>
  <div v-else>
    <p>Hết hạn khuyến mãi</p>
  </div>
  </div>
</template>
<script>
export default {
  name: 'CountDown',
  props: {
    date:{
      type: String
    }
  },
  data () {
    return {
      now: Math.trunc((new Date()).getTime() / 1000),
      distance: 0
    }
  },
  created () {
    let x = window.setInterval(() => {
        this.now = Math.trunc((new Date()).getTime() / 1000);
        this.distance = this.calcTime - this.now
        if (this.distance < 0) {
          clearInterval(x)
          this.distance = 0
        }

    },1000);
  },
  computed: {
    calcTime() {
      return Math.trunc(Date.parse(this.date) / 1000)
    },
    seconds() {
        return (this.calcTime - this.now) % 60;
    },
    minutes() {
        return Math.trunc((this.calcTime - this.now) / 60) % 60;
    },

    hours() {
        return Math.trunc((this.calcTime - this.now) / 60 / 60) % 24;
    },

    days() {
        return Math.trunc((this.calcTime - this.now) / 60 / 60 / 24);
    }
  }
}
</script>
<style scoped>
.countdown {
    position: absolute;
    bottom: 10px;
    right: 5px;
    z-index: 1;
    border-radius: 0 3px 3px 0;
    padding: 0px 10px;
    color: #fff;
    font-weight: 500;
    background: orange;
}
</style>
