<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class SuccessBooking extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($path)
    {
        $this->path = $path;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        // $url = url('/pdf/'.$notifiable->activation_token);
        return (new MailMessage)
                    ->from('beachcrestsupport@gmail.com', 'BeachCrest Support')
                    ->subject('Đăt tour thành công tại BeachCrest')
                    ->line('Chúc mừng bạn đã đặt tour thành công tại website BeachCrest.')
                    ->line('Vui lòng kiểm tra thông tin Booking ở liên kết phía dưới')
                    ->action('Nhấn vào đây để xem chi tiết Booking',  url($this->path))
                    ->line('Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
