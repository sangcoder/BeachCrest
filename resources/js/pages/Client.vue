<template>
  <div class="app">
    <app-header :fixed="fixedHeader || fixedSidebar" />
    <div class="app-body">
      <main class="main">
        <breadcrumb :list="list" />
        <div class="container">
          <router-view />
        </div>
      </main>
    </div>
    <app-footer />
  </div>
</template>

<script>
import { Header as AppHeader, Footer as AppFooter, Breadcrumb } from '../frontend/components'

export default {
  name      : 'Client',
  components: {
    AppHeader,
    AppFooter,
    Breadcrumb,
  },
  data () {
    return {
      offset      : true,
      fixedHeader : true,
      fixedSidebar: true,
    }
  },
  computed: {
    name () {
      return this.$route.name
    },
    list () {
      return this.$route.matched
    },
  },
  created () {
  },
  mounted () {
    $('body').addClass('app sidebar-lg-show pace-done')
    $(window).on('scroll', this.setPosNotify)
  },
  beforeDestroy () {
    $('body').removeClass('app sidebar-lg-show pace-done')
    $(window).off('scroll', this.setPosNotify)
  },
  methods: {
    setPosNotify () {
      const top    = $(document).scrollTop()
      const height = $('.app-header').height()
      const offset = top < height ? height - top : 0

      this.offset = `${offset}px`
    },
  },
}
</script>
