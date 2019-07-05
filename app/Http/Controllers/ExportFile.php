<?php

namespace App\Http\Controllers;

use PDF;
use App\Http\AppResponse;
use Illuminate\Http\Request;
use App\Exports\PaymentExport;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class ExportFile extends Controller
{
    
    public function generate_invoice_pdf() {
        // return 'avc';
        $data = [
            'foo' => 'bar'
        ];
        // dd('hello viet');
        $dataInvoice = [
            'hello' => 'word'
        ];
        $pdf = PDF::loadView('pdf.invoice', compact('dataInvoice'), [], [
            'margin_left' => 0
        ]);
        return $pdf->stream('document.pdf');
        // PDF::loadView('pdf.invoice', $data)->save();
        // dd('acc');
        // dd($pdf);
        // return $pdf->download('document.pdf');
    }

    public function exportPayment (Request $request) {
        ob_end_clean(); // this
        ob_start(); // and this
        if ($request->exists('dateStart') && $request->exists('dateEnd')) {
            return Excel::download(new PaymentExport($request->dateStart, $request->dateEnd), 'payment.xlsx');
        } else {
            return response()->json([
                'success' => false
            ],AppResponse::HTTP_UNPROCESSABLE_ENTITY);
        }
    }
}
