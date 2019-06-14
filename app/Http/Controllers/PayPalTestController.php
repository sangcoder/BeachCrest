<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Services\PayPalService as PayPalSvc;
class PayPalTestController extends Controller
{
    private $paypalSvc;

    public function  __construct(PayPalSvc $paypalSvc)
    {
        // parent::__construct();

        $this->paypalSvc = $paypalSvc;
    }

    public function index()
    {
        $data = [
            [
                'name' => 'Vinataba',
                'quantity' => 1,
                'price' => 1.5,
                'sku' => '1'
            ],
            [
                'name' => 'Marlboro',
                'quantity' => 1,
                'price' => 1.6,
                'sku' => '2'
            ],
            [
                'name' => 'Esse',
                'quantity' => 1,
                'price' => 1.8,
                'sku' => '3'
            ]
        ];
        $transactionDescription = "Tobaco";

        $paypalCheckoutUrl = $this->paypalSvc
                                  // ->setCurrency('eur')
                                  ->setReturnUrl(url('/paypal/status'))
                                  // ->setCancelUrl(url('paypal/status'))
                                  ->setItem($data)
                                  // ->setItem($data[0])
                                  // ->setItem($data[1])
                                  ->createPayment($transactionDescription);

        if ($paypalCheckoutUrl) {
            // dd($paypalCheckoutUrl);
            return redirect($paypalCheckoutUrl);
        } else {
            dd(['Error']);
        }
    }

    public function status()
    {
        $paymentStatus = $this->paypalSvc->getPaymentStatus();
        // dd($paymentStatus);
        return $paymentStatus;
    }

    public function paymentList()
    {
        $limit = 10;
        $offset = 0;

        $paymentList = $this->paypalSvc->getPaymentList($limit, $offset);
        return $paymentList;
        // dd($paymentList);
    }

    public function paymentDetail($paymentId)
    {
        $paymentDetails = $this->paypalSvc->getPaymentDetails($paymentId);

        dd($paymentDetails);
    }
}
