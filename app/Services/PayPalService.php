<?php
  namespace App\Services;

  // API paypal
  use PayPal\Rest\ApiContext;
  use PayPal\Auth\OAuthTokenCredential;
  use PayPal\Api\Item;
  use PayPal\Api\ItemList;
  use PayPal\Api\Amount;
  use PayPal\Api\Transaction;
  use PayPal\Api\RedirectUrls;
  use PayPal\Api\Payment;
  use PayPal\Api\Payer;
  use PayPal\Api\PaymentExecution;
  use Request;

  class PayPalService
  {
    private $apiContext;
    // Chứa các mặt hàng
    private $itemList;
    // Đơn vị thanh toán
    private $paymentCurrency;
    // Tổng tiền của đơn hàng
    private $totalAmount;
    // đường dẫn thanh toán thành công
    private $returnURL;
    // Đường dẫn bấm cancel
    private $cancelUrl;

    // Contructor
    public function __construct() {
      //  Đọc file trong config
      $paypalConfigs = config('paypal');
      // Khởi tạo instance
      $this->apiContext = new apiContext (
        new OAuthTokenCredential(
          $paypalConfigs['client_id'],
            $paypalConfigs['secret']
        )
        );

        // Đơn vị thanh toán mặc định
        $this->paymentCurrency = "USD";
        // Khởi tạo tổng tiền
        $this->totalAmount = 0;
    }

    //  getter/ setter for private property
    public function setCurrency($currency) {
      $this->paymentCurrency = $currency;
      return $this;
    }
    /**
     * Add item to list
     */
    public function setItem ($itemData) {
        // Kiểm tra xem item được thêm vào là một hay một
        // mảng các item. Nếu chỉ là 1 item, thì chúng ta sẽ
        // cho nó thành một mảng item rồi foreach. Việc này giúp
        // chúng ta có thể thêm một hay nhiều item cùng lúc
        if (count($itemData) === count($itemData, COUNT_RECURSIVE)) {
          $itemData = [$itemData];
        }
        // Duyệt qua danh sách các item
        foreach ($itemData as $data) {
          $item = new Item();
          // Set tên của các item
          $item->setName($data['name'])
              ->setCurrency($this->paymentCurrency) // Đơn vị tiền của item
              ->setSku($data['sku']) // ID của item
              ->setQuantity($data['quantity']) // Số lượng
              ->setPrice($data['price']); // Giá
              			// Thêm item vào danh sách
            $this->itemList[] = $item;
            // Tính tổng đơn hàng
            $this->totalAmount += $data['price'] * $data['quantity'];
        }
        return $this;
    }

    // Get list item
    public function getItemList()
    {
        return $this->itemList;
    }

    // đường dẫn trả về thành công
    public function setReturnUrl($url)
    {
        $this->returnUrl = $url;

        return $this;
    }
    public function getReturnUrl()
    {
        return $this->returnUrl;
    }

    // Đường dẫn trả về thất bại
    public function setCancelUrl($url)
    {
        $this->cancelUrl = $url;

        return $this;
    }
    public function getCancelUrl()
    {
        return $this->cancelUrl;
    }

    public function createPayment ($transactionDescription) {
      $checkoutUrl = false;

      // Chọn kiểu thanh toán.
      $payer = new Payer();
      $payer->setPaymentMethod('paypal');

      // Danh sách các item
      $itemList = new ItemList();
      $itemList->setItems($this->itemList);

      // Tổng tiền và kiểu tiền sẽ sử dụng để thanh toán.
      // đồng nhất kiểu tiền của item và kiểu tiền của đơn hàng
      $amount = new Amount();
      $amount->setCurrency($this->paymentCurrency)
              ->setTotal($this->totalAmount);
      // Transaction
      $transaction = new Transaction();
      $transaction->setAmount($amount)
                  ->setItemList($itemList)
                  ->setDescription($transactionDescription);

      // Đường dẫn để xử lý một thanh toán thành công.
      $redirectUrls = new RedirectUrls();

      // Kiểm tra xem có tồn tại đường dẫn khi người dùng hủy thanh toán
      // hay không. Nếu không, mặc định chúng ta sẽ dùng luôn $redirectUrl
      if (is_null($this->cancelUrl)) {
          $this->setCancelUrl($this->returnUrl);
      }
      $redirectUrls->setReturnUrl($this->returnUrl)
      ->setCancelUrl($this->cancelUrl);

      $payment = new Payment();
      $payment->setIntent('Sale')
              ->setPayer($payer)
              ->setRedirectUrls($redirectUrls)
              ->setTransactions([$transaction]);
    
    // Thực hiện thanh toán
    try {
      $payment->create($this->apiContext);
    } catch (\PayPal\Exception\PPConnectionException $paypalException) {
        throw new \Exception($paypalException->getMessage());
    }
   // Nếu việc thanh tạo một payment thành công. Chúng ta sẽ nhận
        // được một danh sách các đường dẫn liên quan đến việc
        // thanh toán trên PayPal
        foreach ($payment->getLinks() as $link) {
        	// Duyệt từng link và lấy link nào có rel
            // là approval_url rồi gán nó vào $checkoutUrl
            // để chuyển hướng người dùng đến đó.
            if ($link->getRel() == 'approval_url') {
                $checkoutUrl = $link->getHref();
				// Lưu payment ID vào session để kiểm tra
                // thanh toán ở function khác
                session(['paypal_payment_id' => $payment->getId()]);

                break;
            }
        }

		    // Trả về url thanh toán để thực hiện chuyển hướng
        return $checkoutUrl;
    }

    // Get payment status
    public function getPaymentStatus()
    {
        $request = Request::all();
        // Kiểm tra xem URL trả về từ PayPal có chứa
        // các query cần thiết của một thanh toán thành công
        // hay không.
        if (empty($request['data']['payerID']) || empty($request['data']['paymentID'])) {
            return false;
        }

        // Lấy Payment ID từ session
        // dd($request['data']['paymentID']);
        $paymentId = $request['data']['paymentID'];
        // Khởi tạo payment từ Payment ID đã có
        $payment = Payment::get($paymentId, $this->apiContext);

        // Thực thi payment và lấy payment detail
        $paymentExecution = new PaymentExecution();
        $paymentExecution->setPayerId($request['data']['payerID']);
        $paymentStatus = $payment->execute($paymentExecution, $this->apiContext);
        return $paymentStatus;
    }

    // Get payment list
    public function getPaymentList($limit = 10, $offset = 0)
    {
        $params = [
            'count' => $limit,
            'start_index' => $offset
        ];

        try {
            $payments = Payment::all($params, $this->apiContext);
        } catch (\PayPal\Exception\PPConnectionException $paypalException) {
            throw new \Exception($paypalException->getMessage());
        }

        return $payments;
    }

    // Lấy chi tiết thanh toán
    public function getPaymentDetails($paymentId)
    {
        try {
            $paymentDetails = Payment::get($paymentId, $this->apiContext);
        } catch (\PayPal\Exception\PPConnectionException $paypalException) {
            throw new \Exception($paypalException->getMessage());
        }

        return $paymentDetails;
    }
  }