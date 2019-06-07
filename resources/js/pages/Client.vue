<template>
  <div class="app">
    <app-header :fixed="fixedHeader || fixedSidebar" />
    <div class="app-body">
      <main class="main">
        <breadcrumb :list="list" />
        <div class="container">
          <a-locale-provider :locale="vi_VN">
          <router-view />
          </a-locale-provider>
        </div>
      </main>
    </div>
    <app-footer />
  </div>
</template>

<script>
import { Header as AppHeader, Footer as AppFooter, Breadcrumb } from '../frontend/components'
import vi_VN from 'ant-design-vue/lib/locale-provider/vi_VN';
import moment from 'moment';
import 'moment/locale/vi';

moment.locale('vi');

export default {
  name      : 'Client',
  components: {
    AppHeader,
    AppFooter,
    Breadcrumb,
  },
  data () {
    return {
      vi_VN,
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
