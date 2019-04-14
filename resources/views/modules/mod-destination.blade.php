<section class="section mod-destination" data-module="fixheight">
<div class="container">
  <h2>Top điểm đến</h2>
  <div class="row">
    <div class="col-md-8 destination-item">
      <div class="destination-img">
          <img class="img-fluid" src="https://tomap.travelerwp.com/wp-content/uploads/2015/02/united-1024x1024-770x375.jpg" alt="San Francisco">
      </div>
      <div class="destination-content text-center">
        <h2>San Francisco</h2>
        <p>18 Tour</p>
      </div>
    </div>
    @for ($i = 0; $i < 4; $i++)
    <div class="col-6 col-md-4 destination-item">
      <div class="destination-img">
          <img class="img-fluid" src="https://tomap.travelerwp.com/wp-content/uploads/2014/11/new-york-city-skyline-at-dusk-zo-cf1a9c35-370x370.jpg" alt="San Francisco">
      </div>
        <div class="destination-content text-center">
          <h2>New York</h2>
          <p>13 Tour</p>
        </div>
      </div>
    @endfor

  </div>
</div>
</section>