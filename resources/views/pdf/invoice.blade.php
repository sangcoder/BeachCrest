<!DOCTYPE html>
<html>

<head>
  <title>Hóa đơn BeachCrest</title>
  <style>
    @page {
      footer: page-footer;
      margin: 0;
      margin-top: 35pt;
      margin-bottom: 50pt;
      margin-footer: 18pt;
    }

    @page :first {
      margin-top: 0;
    }

    body {
      margin: 0;
      font-family: sans-serif;
      font-size: 12pt;
    }

    table,
    tr,
    td {
      padding: 0;
      border-collapse: collapse;
    }

    table {
      width: 100%;
    }

    td {
      vertical-align: top;
    }

    .page-break-before {
      page-break-before: always;
    }

    .container {
      padding: 0 35pt;
    }

    main .container {
      margin-top: 2em;
    }

    main h2 {
      margin: 0 0 .8em;
      page-break-after: avoid;
    }

    main p,
    main .table-wrapper {
      margin: 0 0 1em;
    }

    .clearfix {
      clear: both;
    }

    .text-center {
      text-align: center;
    }

    .vertical-bar {
      display: block;
      width: 100px;
      border-bottom: 1px solid #ccc;
      margin: 0 auto;
    }

    .col1 {
      width: 8.33333%;
    }

    .col2 {
      width: 16.66667%;
    }

    .col3 {
      width: 25%;
    }

    .col4 {
      width: 33.33333%;
    }

    .col5 {
      width: 41.66667%;
    }

    .col6 {
      width: 50%;
    }

    .col7 {
      width: 58.33333%;
    }

    .col8 {
      width: 66.66667%;
    }

    .col9 {
      width: 75%;
    }

    .col10 {
      width: 83.33333%;
    }

    .col11 {
      width: 91.66667%;
    }

    .col12 {
      width: 100%;
    }

    #header {
      border: none;
      padding: 30pt 0;
      background-color: #FFFFFF;
      border-bottom: 2px solid #222;
    }

    #header table {
      color: #1890ff;
    }

    .details-column-table {
      margin: 0 15pt;
      table-layout: fixed;
    }

    .details-column-table tr {
      border: none;
      border-bottom: .5pt solid #ddd;
    }

    .details-column-table tr:last-child {
      border: none;
    }

    .details-column-table td {
      line-height: 30pt;
    }

    .details-column-table .label {
      font-weight: bold;
    }

    .details-column-table .value {
      text-align: right;
      white-space: nowrap;
      font-weight: normal;
    }

    .tag {
      float: left;
      width: auto;
      margin: 0 .5em .5em;
      padding: .3em .5em;
      background-color: #eee;
      border-radius: 3px;
      text-align: center;
    }

    .contact-box {
      width: 350pt;
      margin: 35pt auto;
      padding: 30pt;
      border-radius: 2pt;
      border: 1pt solid rgba(0, 0, 0, .1);
      border-bottom-width: 3pt;
      page-break-inside: avoid;
    }

    .contact-image {
      margin: 0 auto;
      width: 30%;
      padding-bottom: 30%;
      border-radius: 50%;
      background-size: 100% auto;
      background-position: center;
      background-image: url(https://placeholdit.co/i/150x150);
    }

    .contact-details {
      margin: 0 auto;
      width: 70%;
      text-align: center;
    }

    .contact-name {
      margin-top: 18pt;
      margin-bottom: 0;
      font-size: 1.5em;
    }

    .contact-email {
      color: #aaa;
    }

    .contact-phone {
      margin-top: 15pt;
    }

    .table-striped th {
      text-align: left;
      font-size: 14px;
    }

    .table-striped th {
      padding: 10px;
    }

    .persoon {
      padding: 10px;
    }

    .table-striped td,
    .table-striped th {
      border: 1px solid #eee;
    }

    .mt-30pt {
      margin-top: 40pt;
    }
  </style>
</head>

<body>
  <header id="header">
    <div class="container">
      <div class="table-wrapper">
        <table>
          <tr>
            <td class="col9">
              <h1 style="font-size: 1.6em; margin-bottom: 10pt;">Thông tin thanh toán tại BeachCrest</h1>
              <div style="margin-top: 30pt;">
                Địa chỉ: 46 Trịnh Hoài Đức, Nha Trang, Khánh Hòa
              </div>
              <div style="margin-top: 30pt;">
                Số điện thoại: 0979.340.304
              </div>
            </td>
            <td class="col3" style="text-align: right; vertical-align: middle;"><img alt="BeachCrest Logo"
                src="https://tourviet.online/images/logo-bc.png" style="height: 70px;"></td>
          </tr>
        </table>
      </div>
    </div>
  </header>
  <main>
    <div class="container">
      <div class="grid-images">
        <div class="tile-image" style="width: 98%;">
          <h2 style="text-align: center;">THÔNG TIN ĐẶT TOUR #{{$dataInvoice['BookingID']}}</h2>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="container">
      <h2>THÔNG TIN LIÊN LẠC</h2>
      <table style="margin: 0 -15pt;">
        <tr>
          <td class="col6">
            <table class="details-column-table">
              <tr>
                <td class="label">Họ và tên:</td>
                <td class="value">{{$dataInvoice['infoContact'][0]->CustomerName}}</td>
              </tr>
            </table>
          </td>
          <td class="col6">
            <table class="details-column-table">
              <tr>
                <td class="label">Địa chỉ:</td>
                <td class="value">{{$dataInvoice['infoContact'][0]->Address}}</td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td class="col6">
            <table class="details-column-table">
              <tr>
                <td class="label">Số điện thoại:</td>
                <td class="value">{{$dataInvoice['infoContact'][0]->PhoneNumber}}</td>
              </tr>
            </table>
          </td>
          <td class="col6">
            <table class="details-column-table">
              <tr>
                <td class="label">Địa chỉ Email:</td>
                <td class="value">{{$dataInvoice['infoContact'][0]->Email}}</td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <h2 style="margin-top: 30pt;">THÔNG TIN KHÁCH HÀNG ĐI TOUR</h2>

      <table class="table table-striped">
        <tbody>
          <tr>
            <th>ID</th>
            <th>Họ tên</th>
            <th>Ngày sinh</th>
            <th>Giới tính</th>
            <th>Loại khách</th>
            <th>Giá</th>
          </tr>
          @foreach ($dataInvoice['listCustomer'] as $customer)
          <tr class="mt-30pt">
            <td class="persoon">{{$customer->CustomerID}}</td>
            <td class="persoon">{{$customer->CustomerName}}</td>
            <td class="persoon">{{date('d-m-Y', strtotime($customer->Birthday))}}</td>
            <td class="persoon">
              @if ($customer->Gender == 1)
              Nam
              @else
              Nữ
              @endif
            </td>
            <td class="persoon">
              @if ($customer->CustomerType == 1)
              Người lớn
              @else
              Trẻ nhỏ
              @endif
            </td>
            <td class="persoon">
              @if ($customer->CustomerType == 1)
              @convert($dataInvoice['priceAdult']) Đ
              @else
              @convert($dataInvoice['priceKid']) Đ
              @endif
            </td>
          </tr>
          @endforeach

        </tbody>
      </table>
      <p style="text-align: right; margin-top: 30pt;">Thành tiền: <span style="padding-left: 2 0px;">
          @convert($dataInvoice['ToTalAmount']) Đ
        </span>
      </p>
      <p>(*) Thông tin này do quý khách cung cấp cho hệ thống. Nếu có sai sót về thông tin xin quý khách liên hệ hotline
        để được hỗ trợ.
      </p>
    </div>
    <div class="container">
      <div class="tags">
        <div class="clearfix"></div>
      </div>
    </div>
  </main>
  <htmlpagefooter name="page-footer">
    <div class="container">
      <p>Công ty BeachCrest Nha Trang</p>
    </div>
  </htmlpagefooter>
</body>

</html>