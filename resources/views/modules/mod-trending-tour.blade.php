<section class="mod-tour">
  <div class="container">
    <h2>Tour mới cập nhật</h2>
    <div class="row tour-r">
      @for ($i = 0; $i < 8; $i++)
        <div class="col-lg-3 col-md-4 tour--item">
          <div class="tour__wrapper">
            <div class="tour__img" style='background-image: url("http://toidi.net/wp-content/uploads/2015/12/honeymoon_nhatrang-001-768x515.jpg");'>
              <span>11%</span>
              <img class="lazy" src="https://123job.vn/images/preloader.gif" data-original="images/Tour.png" alt="BeachCrest Tour">
              <div class="tour__tag bestseller">
                  Featured
              </div>
            </div>
            <div class="tour--content">
              <p><i class="icomoon icon-icon-map"></i> Nha Trang</p>
              <h4 class="tour__title">
                <a href="#">Tour 4 đảo Nha Trang 2019</a>
              </h4>
              <div class="tour__review">
                <div class="reviewTour"></div>
                <span>2 Review</span>
              </div>
            </div>
              <div class="tour--footer">
                <div class="tour__duration">
                 <i class="icomoon icon-calendar-alt"></i> 2 ngày
                </div>
                <div class="tour__price">
                  <span class="price">
                      <span class="onsale ">100.000 VNĐ</span>
                      <span>890.000 VNĐ</span>
                  </span>
                </div>
              </div>
          </div>
        </div>
      @endfor
    </div>
  </div>
</section>