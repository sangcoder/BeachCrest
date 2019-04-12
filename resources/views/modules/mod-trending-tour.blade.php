<section class="mod-tour">
  <div class="container">
    <div class="row tour-r">
      @for ($i = 0; $i < 8; $i++)
        <div class="col-md-3 tour--item">
          <div class="tour__img" style='background-image: url("");'>
            <img src="images/Tour.png" alt="BeachCrest Tour" >
            <div class="tour__tag bestseller">
                Featured
            </div>
          </div>
          <div class="tour--content">
            <p>California, USA</p>
            <h4 class="tour__title">
              <a href="#">Northern California Summer 2019</a>
            </h4>
            <div class="tour__review">
              <div class="reviewTour"></div>
              <span>2 Review</span>
            </div>
          </div>
            <div class="tour--footer">
              <div class="tour__duration">
                5 Day
              </div>
              <div class="tour__price">
                <span>
                  <i class="icomoon icon-facebook"></i>
                  <span>From</span>
                </span>
                <span class="price">
                    <span class="text-small lh1em item onsale ">€100.00</span>
                    <span class="text-lg lh1em item "> €89.00</span>
                </span>
              </div>
            </div>
        </div>
      @endfor

    </div>
  </div>
</section>