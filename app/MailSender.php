<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

//use Illuminate\Database\Eloquent\SoftDeletes;
use Pushok\AuthProvider;
use Pushok\Client;
use Pushok\Notification;
use Pushok\Payload;
use Pushok\Payload\Alert;
use App\User;
use DB;
use Cmgmyr\Messenger\Models\Message;
use Cmgmyr\Messenger\Models\Participant;
use Cmgmyr\Messenger\Models\Thread;
use Symfony\Component\VarDumper\Cloner\Data;

use PHPMailer\PHPMailer\PHPMailer;

class MailSender extends Model
{
    public function __construct()
    {
        
    }
    //use SoftDeletes;
    protected function sendemail($email, $subject, $msgbody, $altbody){

        $mail = new PHPMailer;
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );

        $mail->isSMTP();

        // Replace sender@example.com with your "From" address. 
        // This address must be verified with Amazon SES.
        $mail->setFrom('onsunroad@gmail.com', 'Sunroad Admin');

        // Replace recipient@example.com with a "To" address. If your account 
        // is still in the sandbox, this address must be verified.
        // Also note that you can include several addAddress() lines to send
        // email to multiple recipients.
        $mail->addAddress($email, 'Recipient Name');

        // Replace smtp_username with your Amazon SES SMTP user name.
        $mail->Username = 'AKIA36KECHFKGDRRTWFV';

        // Replace smtp_password with your Amazon SES SMTP password.
        $mail->Password = 'BE+ARLU7KnvYPDkf7gt3PvsHGB4uszRzRwUKLq87y8uQ';
            
        // Specify a configuration set. If you do not want to use a configuration
        // set, comment or remove the next line.
        $mail->addCustomHeader('X-SES-CONFIGURATION-SET', 'sunroadconfig');

        // If you're using Amazon SES in a region other than , 
        // replace email-smtp.us-west-2.amazonaws.com with the Amazon SES SMTP  
        // endpoint in the appropriate region.
        $mail->Host = 'email-smtp.us-west-2.amazonaws.com';

        // The subject line of the email
        $mail->Subject = $subject;

        // The HTML-formatted body of the email
        $mail->Body = $msgbody;

        // Tells PHPMailer to use SMTP authentication
        $mail->SMTPAuth = true;

        // Enable TLS encryption over port 587
        $mail->SMTPSecure = 'tls';
        $mail->Port = 587;

        // Tells PHPMailer to send HTML-formatted email
        $mail->isHTML(true);

        // The alternative email body; this is only displayed when a recipient
        // opens the email in a non-HTML email client. The \r\n represents a 
        // line break.
        $mail->AltBody = $altbody;

        if(!$mail->send()) {
            return false;
        } else {
            return true;
        }
    }

    protected function sendPasswordchange($email)
    {
        $cond['email'] = $email;
        $user = User::where($cond)->first();
        $confirm_code = rand(1000, 9999);
        $user->passcode = $confirm_code ;
        $user->update();
        $subject = "Change Password";
        $body ='<h1>Change Password</h1>
            <p>Your password change code is
            <a>'.$confirm_code.'</a> 
            Please send this code';
        $altbody = "Sunroad support";
        $result = $this->sendemail($user->email, $subject, $body, $altbody);
        return $result;

    }

    protected function confirmPasswordChange()
    {

    }

    protected function recodeUserRegistration($to, $email, $name, $field)
    {
        $subject = "User registration";
        $body ='<table><tbody>
                    <tr><td>Email : </td><td>'.$email.'</td></tr>
                    <tr><td>Name : </td><td>'.$name.'</td></tr>
                    <tr><td>Field : </td><td>'.$field.'</td></tr>
                </tboday></table>';

                $altbody = "Sunroad support";
        $result = $this->sendemail($to, $subject, $body, $altbody);
    }

}
