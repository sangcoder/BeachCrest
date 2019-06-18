<template>
  <div id="list-category">
    <div class="container">
      <div id="list-post">
        <ul class="category-item">
          <li v-for="item in listDestinations" :key="item.PlaceID">
            <a href="#">
              <div class="overlayX">
                <img
                  class="lazy"
                   :src="/^https?:\/\//i.test(item.ImgUrl) ? item.ImgUrl : ((/^data:image/i).test(item.ImgUrl) ? item.ImgUrl : '/images/place/' + item.ImgUrl)"
                  alt
                >
                <h4>
                  {{item.PlaceName}}
                  <span>{{item.number}} địa điểm</span>
                </h4>
              </div>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
export default {
	name: "listDestination",
	props: {
		listDestinations: Array
	}
};
</script>
<style lang="css" scoped>
#list-category {
  background: #fff;
  padding: 10px 0;
  overflow: hidden;
  margin: 20px 0;
  padding-left: 10px;
}
ul.category-item {
  margin: 0;
  padding: 0;
}
.category-item li {
  position: relative;
  margin: 0 10px 0 0;
  list-style: none;
  overflow: hidden;
  width: calc(25% - 10px);
  height: 150px;
  float: left;
  transition: all 0.3s ease-in-out;
  border-radius: 0px;
  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.26);
}
.category-item li h4 {
  transition: all 0.2s ease-in-out;
  text-align: center;
  overflow: hidden;
  color: #fafafa;
  width: 100%;
  background: rgba(0, 0, 0, 0.4);
  font-family: "Open Sans", sans-serif;
  text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.2);
  line-height: 1.2em;
  left: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  font-weight: 400;
  font-size: 17px;
  margin: 0 10px 0 0;
  padding: 60px 7px 0;
}
.category-item li h4 span {
  display: block;
  font-size: 15px;
  margin-top: 10px;
}
.category-item li h4:hover {
  background: rgba(0, 0, 0, 0.28);
}
.category-item li img {
  width: 100%;
  max-width: 100% !important;
  height: 150px;
  object-fit: cover;
}
@media screen and (max-width: 768px) {
  .category-item li {
    width: calc(46.5% - 1px);
    height: 140px;
    margin: 0 10px 10px 0;
  }
  #calltrap-btn.calltrap_offline {
    display: none;
  }
}
</style>