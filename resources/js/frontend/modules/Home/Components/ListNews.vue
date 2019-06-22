<template>
  <div class="news">
    <h2>{{newsTitle}}</h2>
    <div class="row list-news">
      <div class="col-md-12 col-sm-12 col-xs-12">
        <div v-for="item in listNews" :key="item.NewsID" class="category-post-item category-module-full">
          <div class="category-post-item-inner">
            <div class="category-post-avatar">
              <a href="#">
                <img
                  :src="item.ImgUrl"
                  :alt="item.Title"
                >
              </a>
            </div>
            <div class="category-post-content">
              <a href="#">
                <h3 class="category-post-title">{{item.Title}}</h3>
              </a>
              <p class="category-post-info color">
                <b>
                  <a href="#" rel="category tag">{{item.info.name}}</a>
                </b> - {{item.updated | birthDay}}
              </p>
              <p
                class="category-post-desc"
              >
              {{item.Contents | removeHMTLTag | unicodeValue | truncate(120)}}
              </p>
            </div>
          </div>
        </div>
      </div>
      <div class="quatrang d-flex justify-content-center w-100 mb-3">
        <a-pagination showQuickJumper :defaultCurrent="2" :total="500" @change="onChange"/>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "ListNews",
  props: {
    newsTitle: String,
    listNews: Array
  },
  methods: {
    onChange(value) {}
  }
};
</script>
<style lang="css" scoped>
.category-post-item.category-module-full {
  margin-bottom: 25px;
  display: inline-block;
  width: 100%;
}
.category-post-item.category-module-full
  .category-post-item-inner
  .category-post-avatar {
  width: 250px;
  float: left;
  margin-right: 15px;
}
.category-post-item.category-module-full
  .category-post-item-inner
  .category-post-avatar
  img {
  max-width: 100%;
}
.news {
  background: #fff;
  padding: 0 15px;
}
.category-post-item.category-module-full .category-post-item-inner .category-post-content .category-post-title {
    margin-top: 0px;
    font-size: 20px;
    line-height: 25px;
    margin-bottom: 0;
    font-weight: 500;
    max-height: 75px;
}
@media (max-width: 640px) {
  .category-post-item.category-module-full {
    margin-bottom: 20px;
  }
  .category-post-item.category-module-full
    .category-post-item-inner
    .category-post-avatar {
    width: 150px;
  }
  .category-post-item.category-module-full
    .category-post-item-inner
    .category-post-content
    .category-post-title {
    font-size: 16px;
    line-height: 22px;
    max-height: 66px;
  }
  .category-post-desc {
    display: none;
  }
}
</style>