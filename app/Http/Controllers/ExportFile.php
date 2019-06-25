<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use PDF;
class ExportFile extends Controller
{
    public function generate_invoice_pdf() {
        // return 'avc';
        // $data = [
        //     'foo' => 'bar'
        // ];
        dd('acc');
        // $pdf = PDF::loadView('pdf.invoice');
        // dd('acc');
        // dd($pdf);
        return $pdf->download('document.pdf');
    }
}
