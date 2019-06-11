<template>
<footer id="footer" class="module">
  <div class="container footer-top">
    <div class="row">
      <div class="footer-item-col col-lg-4 col-md-6 col-12">
        <h5>
          Du dịch theo khu vực
        </h5>
        <div class="row">
          <div class="col-6">
            <ul class="list-unstyled footer-menu">
              <li>
                <a href="#">Du lịch Phía bắc</a>
              </li>
              <li>
                <a href="#">Du lịch Phía Nam</a>
              </li>
            </ul>
          </div>
          <div class="col-6">
            <ul class="list-unstyled footer-menu">
              <li>
              <li>
                <a href="#">Du lịch Miền Tây</a>
              </li>
              <li>
                <a href="#">Du lịch Cao Nguyên</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="footer-item-col col-lg-4 col-md-6 col-6">
        <h5>
          Dịch vụ
        </h5>
        <ul class="list-unstyled footer-menu">
          <li>
            <a href="#">Dịch vụ 1</a>
          </li>
          <li>
            <a href="#">Dịch vụ 2</a>
          </li>
          <li>
            <a href="#">Dịch vụ 3</a>
          </li>
        </ul>
      </div>
      <div class="footer-item-col col-lg-4 col-md-6 col-6">
        <h5>
          Beach Crest
        </h5>
        <ul class="list-unstyled footer-menu">
          <li>
            <a href="#">Liên lạc</a>
          </li>
          <li>
            <a href="#">Tin tức</a>
          </li>
          <li>
            <a href="#">Tuyển dụng</a>
          </li>

        </ul>
      </div>
 
    </div>
  </div>
  <div class=" footer-copyright">
    <div class="container text-center text-lg-left d-flex flex-lg-row flex-column justify-content-lg-between">
      <div class="copy-left">
        Copyright © 2019 Beach Crest Company
      </div>
      <div class="copy-right">
        <ul class="list-unstyled list-footer">
          <li><a href="#">Privacy Policy </a> </li>
          <li><a href="#">Terms of Service</a></li>
          <li><a href="#">Sitemap</a></li>
        </ul>
      </div>
    </div>

  </div>
</footer>
</template>
<script>
export default { name: "CFooter" };
</script>
<style scoped>
#footer {
    padding-top: 20px;
    background-color: #fff;
    color: #0e2f43;
    max-width: 1840px;
    border-top: 2px solid #eee;
}
.list-footer li {
    display: inline-block;
    margin-right: 20px;
    margin-bottom: 0;
    position: relative;
}
.list-footer li::before {
    position: absolute;
    top: 6px;
    left: -10px;
    width: 2px;
    height: 15px;
    content: "";
    background: #f5f6f6;
}
.list-footer li:first-child::before {
    background: transparent;
}
</style>
