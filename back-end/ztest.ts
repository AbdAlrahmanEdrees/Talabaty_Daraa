import nodemailer from 'nodemailer';

const code = Math.floor(1000 + Math.random() * 9000);

const transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587,
    secure: false,
    auth: {
        user: 'talabat.daraa.app@gmail.com',
        pass: 'TalabatyDaraa@AA@talabatydaraa'
    }
});

transporter.sendMail({
    from: '"Talabat Daraa" <no-reply@app.com>',
    to: 'abdalrahmanedrees810@gmail.com',
    subject:'Hi',
    text:`Your verification code is: ${code}`,
})