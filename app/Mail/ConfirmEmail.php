<?php namespace App\Mail;

use App;
use Common\Settings\Settings;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use App\Mail\MailTemplates;
use Illuminate\Queue\SerializesModels;

class ConfirmEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * @var string
     */
    public $siteName;

    /**
     * @var string
     */
    public $emailAddress;

    /**
     * @var string
     */
    public $code;

    /**
     * Create a new message instance.
     * @param $emailAddress
     * @param $code
     */
    public function __construct($emailAddress, $code)
    {
        $this->emailAddress = $emailAddress;
        $this->siteName = "Test";
        $this->code = $code;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $template = App::make(MailTemplates::class)->getByAction('email_confirmation',
            ['site_name' => $this->siteName]
        );


        return $this->to($this->emailAddress)
            ->subject("subject")
            ->view($template['html_view'])
            ->text($template['html_view']);
    }
}
