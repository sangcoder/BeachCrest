<template>
  <div class="list-cultures mt-3">
    <b-row >
      <b-col v-for="item in listCultures" :key="item.Scenic_ID" cols="6" md="3" class="item-cultures">
        <div class="block-image">
          <img
            class="img-responsive"
             :src="/^https?:\/\//i.test(item.ImgUrl) ? item.ImgUrl : ((/^data:image/i).test(item.ImgUrl) ? item.ImgUrl : '/images/cultures/' + item.ImgUrl)"
            alt
          >
          <div class="overlay">
            <h2>{{item.Scenic_Name}}</h2>
            <p>
              <a href="#">Xem chi tiết</a>
            </p>
          </div>
        </div>
      </b-col>
    </b-row>
  </div>
</template>
<script>
export default {
  name: "ListCulture",
  props: {
    listCultures: Array
  }
};
</script>
<style scoped>
.list-cultures {
  background: #fff;
  padding: 10px;
}
.block-image {
  width: 100%;
  height: 100%;
  float: left;
  overflow: hidden;
  position: relative;
  text-align: center;
  cursor: default;
  background: #42b078;
}

.block-image .overlay {
  width: 100%;
  height: 100%;
  position: absolute;
  overflow: hidden;
  top: 0;
  left: 0;
  padding: 50px 20px;
}

.block-image img {
  display: block;
  position: relative;
  max-width: none;
  width: calc(100% + 20px);
  height: 100%;
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(-10px, 0, 0);
  transform: translate3d(-10px, 0, 0);
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}

.block-image:hover img {
  opacity: 0.4;
  filter: alpha(opacity=40);
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}

.block-image h2 {
  text-transform: uppercase;
  color: #fff;
  text-align: center;
  position: relative;
  font-size: 14px;
  overflow: hidden;
  background-color: transparent;
}

.block-image h2:after {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background: #fff;
  content: "";
  -webkit-transition: -webkit-transform 0.35s;
  transition: transform 0.35s;
  -webkit-transform: translate3d(-100%, 0, 0);
  transform: translate3d(-100%, 0, 0);
}

.block-image:hover h2:after {
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}

.block-image a,
.block-image p {
  color: #fff;
  opacity: 0;
  filter: alpha(opacity=0);
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(100%, 0, 0);
  transform: translate3d(100%, 0, 0);
}

.block-image:hover a,
.block-image:hover p {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
@media (max-width: 991.98px) { 
  .item-cultures {
    margin-bottom: 20px;
  }
 }
</style>
