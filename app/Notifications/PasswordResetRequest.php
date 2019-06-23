<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class PasswordResetRequest extends Notification
{
    use Queueable;
    protected $token;
    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($token)
    {
        $this->token = $token;
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
        $configUrl = \Config::get('app.password_reset_url');
        if (substr($configUrl, -1) !== '/') {
            $configUrl = $configUrl . '/';
        }
        // dd($notifiable);
        $url = $configUrl . $this->token;
        return (new MailMessage)
                    ->from('beachcrestsupport@gmail.com', 'BeachCrest Support')
                    ->subject('Đổi mật khẩu tài khoản tại BeachCrest')
                    ->line('Bạn nhận thư mày bởi vì bạn đã yêu đầu đổi mật khẩu tài khoản tại BeachCrest')
                    ->action('Link đổi mật khẩu', url($url))
                    ->line('Nếu bạn không gửi bất kỳ yêu cầu nào thì vui lòng không tiếp tục');
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
