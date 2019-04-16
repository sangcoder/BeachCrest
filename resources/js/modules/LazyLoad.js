import $ from 'jquery'
import lazyload from 'lazyload'
const LazyLoad = (() => {
  const lazyload = () => {
    $('img.lazy').lazyload({
      event: 'sporty'
    })
    $(window).bind('load', function () {
      var timeout = setTimeout(function () {
        $('img.lazy').trigger('sporty')
      }, 5000)
    })
    console.log('run lazy')
  }
  lazyload()
})()

export default LazyLoad
