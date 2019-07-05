<?php

namespace App\Exports;

use PDO;
use App\Model\Payment;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Events\AfterSheet;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithTitle;
use \Maatwebsite\Excel\Sheet;
use \Maatwebsite\Excel\Writer;

Sheet::macro('styleCells', function (Sheet $sheet, string $cellRange, array $style) {
    $sheet->getDelegate()->getStyle($cellRange)->applyFromArray($style);
});
Writer::macro('setCreator', function (Writer $writer, string $creator) {
    $writer->getDelegate()->getProperties()->setCreator($creator);
});
class PaymentExport implements FromQuery, WithStartRow,WithHeadings,ShouldAutoSize, WithEvents, WithTitle
{
    use Exportable;
    public function  __construct($fromDate, $toDate) {
        $this->fromDate = $fromDate;
        $this->toDate = $toDate;
    }
    /**
    * @return \Illuminate\Support\Collection
    */
    public function query() {
        $pays = DB::table('payment')
        ->whereDate('payment.updated_at', '>=' , $this->fromDate)
        ->whereDate('payment.updated_at', '<=', $this->toDate)
        ->join('bookings', 'booking_id', '=', 'BookingID')
        ->join('tours', 'tour_id', '=', 'TourID')
        ->where('bookings.State', '=', 2)
        ->select('id', 'TourName', 'payment.updated_at as updated_at', 
        DB::raw('CASE WHEN PaymentType = 1 THEN "Thanh toán tiền mặt" ELSE "Thanh toán Paypal" END'), 
        'PaymentAmount')
        ->orderBy('id', 'desc');
        return $pays;
    }
    public function headings(): array {
        return [
            '#',
            'Tên Tour',
            'Ngày thanh toán',
            'Phương thức thanh toán',
            'Tổng tiền'
            
        ];
    }

    public function startRow(): int {
        return 3;
   }
   public function title(): string
   {
       return 'Doanh thu';
   }

    // Định dạng font size color
    public function registerEvents (): array {
        return [
            BeforeExport::class => function(BeforeExport $event) {
                $event->writer->getProperties()->setCreator('BeachCrest');
            },
            AfterSheet::class => function (AfterSheet $event) {
                $numRows =  $this->query()->get()->count();
                $rowpast = $numRows + 1;
                $tongtien = $numRows + 3;
                $thongtin = $numRows + 2;

                $cellRange = 'A1:E1';
                $cellTongTien = 'D'.$tongtien.':'.'E'.$tongtien;
                $event->sheet->styleCells($cellRange, 
                [
                    'alignment' => [
                           'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                    ],                        
                   'font' => [
                            'size' => 13,
                            'bold' => true,
                            'color' => ['argb' => 'FFFFFFFF'],
                     ]
                  ]
                );
                $event->sheet->styleCells($cellTongTien, 
                [
                    'alignment' => [
                           'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                    ],                        
                   'font' => [
                            'size' => 13,
                            'bold' => true,
                            'color' => ['argb' => 'FFFFFFFF'],
                     ]
                  ]
                );
                $event->sheet->getDelegate()->getStyle($cellTongTien)->getFill()
                            ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                            ->getStartColor()->setARGB('e8d827');
                $event->sheet->getDelegate()->getStyle($cellRange)->getFill()
                            ->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID)
                            ->getStartColor()->setARGB('3498db');
                // Set style

                // $event->sheet->setCellValue('D'.$thongtin, 'Doanh thu từ ngày'.$this->fromDate .'-'. $this->toDate);
                // dd($event->sheet);
                $event->sheet->setCellValue('D'.$tongtien, 'Tổng tiền');
                $event->sheet->setCellValue('E'.$tongtien,'=SUM(E2:E'.$rowpast.')');
            }
        ];
    }


}
