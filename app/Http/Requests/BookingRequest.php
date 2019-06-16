<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BookingRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'infoContact.FullName' => 'required|min:3',
            'infoContact.Email' => 'required|email',
            'infoContact.PhoneNumber' => 'required|regex:/[0-9]{10}/',
            'infoContact.Address' => 'required|min:5',
            'listCustomer.0.*.NameCustomner' => 'required',
            'listCustomer.0.*.Gender' => 'required',
            'listCustomer.0.*.BirthDay' => 'required|olderThan:15',
            'listCustomer.1.*.NameCustomner' => 'required',
            'listCustomer.1.*.Gender' => 'required',
            'listCustomer.1.*.BirthDay' => 'required|olderThan:6'
        ];
    }

    public function messages() 
    {
        return [
            'infoContact.FullName.required' => 'Phải nhập họ tên',
            'infoContact.Email.required' => 'Email là bắt buộc',
            'infoContact.Email.email' => 'Phải nhập đúng định dạng Email',
            'infoContact.PhoneNumber.required' => 'Số điện thoại là bắt buộc',
            'infoContact.PhoneNumber.regex' => 'Số điện thoại nhập không đúng',
            'infoContact.Address.required' => 'Địa chỉ là bắt buộc',
            'infoContact.Address.min' => 'Địa chỉ phải ít nhất 5 ký tự',
            'listCustomer.0.*.NameCustomner.required' => 'Tên khách hàng là bắt buộc',
            'listCustomer.1.*.NameCustomner.required' => 'Tên khách hàng là bắt buộc',
            'listCustomer.0.*.Gender.required' => 'Giới tính là bắt buộc',
            'listCustomer.1.*.Gender.required' => 'Giới tính là bắt buộc',
            'listCustomer.0.*.BirthDay.required' => 'Ngày sinh là bắt buộc',
            'listCustomer.0.*.BirthDay.olderThan' => 'Ngày sinh người lớn phải lớn hơn 15 tuổi',
            'listCustomer.1.*.BirthDay.required' => 'Ngày sinh là bắt buộc',
            // 'listCustomer.1.*.BirthDay.smallerThan' => 'Ngày sinh phải nhỏ hơn 15 tuổi',
            'listCustomer.1.*.BirthDay.custom.olderThan' => 'Ngày sinh phải lớn hơn 6 tuổi'
        ];
    }
    public function attributes()
        {
            return [
                'infoContact.FullName' => 'FullName',
                'listCustomer.0.*.NameCustomner' => 'FullName',
            ];
        }
}
