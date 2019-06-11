<template>
  <div>
      <div v-if="distance !== 0" class="countdown">
       <div class="block">
        <p class="digit">{{ days | twoDigits}}</p>
        <p class="text">Days</p>
    </div>
    <div class="block">
        <p class="digit">{{ hours | twoDigits }}</p>
        <p class="text">Hours</p>
    </div>
    <div class="block">
        <p class="digit">{{ minutes | twoDigits  }}</p>
        <p class="text">Minutes</p>
    </div>
    <div class="block">
        <p class="digit">{{ seconds | twoDigits }}</p>
        <p class="text">Seconds</p>
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