<div class="invoice-box">
  <table cellpadding="0" cellspacing="0">
    <tr class="top">
      <td colspan="4">
        <table>
          <tr>
            <td class="title">
              <img
                src="/images/logo-bc.png"
                style="width:100%; max-width:165px;"
              >
            </td>
            <td>
                  Mã hóa đơn #: 123
              <br>Được tạo: January 1, 2015
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <tr class="information">
      <td colspan="4">
        <table>
          <tr>
            <td>
              Công ty BeachCrest Nha Trang, Inc.
              <br>45 Trịnh Hoài Đức, Nha Trang
            </td>
            <td>
              <br>Fax:  +84 (8) 3923 3318
              <br> BeachCrestNhaTrang@gmail.com
            </td>
          </tr>
        </table>
      </td>
    </tr>

    <tr class="heading">
      <td colspan="3">Phương thức thanh toán</td>
      <td>Check #</td>
    </tr>

    <tr class="details">
      <td colspan="3">Thanh toán qua Paypal</td>
      <td>1000</td>
    </tr>

    <tr class="heading">
      <td>Tên khách hàng</td>
      <td>Ngày sinh</td>
      <td>Loại khách hàng</td>
      <td>Đơn giá</td>
    </tr>

    <tr class="item" v-for="item in items">
      <td>
       Võ Văn Sang
      </td>
      <td>
        28/04/1997
      </td>
      <td>
        Người lớn
      </td>
      <td>1.200.000 VNĐ</td>
    </tr>


    <tr class="total">
      <td colspan="3"></td>
      <td>Total:200</td>
    </tr>
  </table>
</div>
<style>
.invoice-box {
  max-width: 800px;
  margin: auto;
  padding: 30px;
  border: 1px solid #eee;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
  font-size: 16px;
  line-height: 24px;
  font-family: "Helvetica Neue", "Helvetica", Helvetica, Arial, sans-serif;
  color: #555;
}

.invoice-box table {
  width: 100%;
  line-height: inherit;
  text-align: left;
}

.invoice-box table td {
  padding: 5px;
  vertical-align: top;
}

.invoice-box table tr td:nth-child(n + 2) {
  text-align: right;
}

.invoice-box table tr.top table td {
  padding-bottom: 20px;
}

.invoice-box table tr.top table td.title {
  font-size: 45px;
  line-height: 45px;
  color: #333;
}

.invoice-box table tr.information table td {
  padding-bottom: 40px;
}

.invoice-box table tr.heading td {
  background: #eee;
  border-bottom: 1px solid #ddd;
  font-weight: bold;
}

.invoice-box table tr.details td {
  padding-bottom: 20px;
}

.invoice-box table tr.item td {
  border-bottom: 1px solid #eee;
}

.invoice-box table tr.item.last td {
  border-bottom: none;
}

.invoice-box table tr.item input {
  padding-left: 5px;
}

.invoice-box table tr.item td:first-child input {
  margin-left: -5px;
  width: 100%;
}

.invoice-box table tr.total td:nth-child(2) {
  border-top: 2px solid #eee;
  font-weight: bold;
}

.invoice-box input[type="number"] {
  width: 60px;
}

@media only screen and (max-width: 600px) {
  .invoice-box table tr.top table td {
    width: 100%;
    display: block;
    text-align: center;
  }

  .invoice-box table tr.information table td {
    width: 100%;
    display: block;
    text-align: center;
  }
}

/** RTL **/
.rtl {
  direction: rtl;
  font-family: Tahoma, "Helvetica Neue", "Helvetica", Helvetica, Arial,
    sans-serif;
}

.rtl table {
  text-align: right;
}

.rtl table tr td:nth-child(2) {
  text-align: left;
}
</style>