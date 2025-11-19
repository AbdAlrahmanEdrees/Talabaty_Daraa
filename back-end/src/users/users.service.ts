import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './users.entity';
import { Repository } from 'typeorm';
import { UserCreateDto } from './dto/create.dto';
import * as nodemailer from 'nodemailer';
import { EmailService } from 'src/email/email.service';

@Injectable()
export class UsersService {
    constructor(
        // @InjectRepository(User)
        // private readonly userRepository: Repository<User>,

        private readonly emailService:EmailService,
    ){}

    async createUser(dto:UserCreateDto){
        //generate verification code
        const verificationCode=Math.floor(10000*Math.random());
        const expires_at=new Date(Date.now()+10*60*1000);

        // const user=this.userRepository.create({
        //     ...dto,
        //     verification_code:verificationCode,
        //     verification_code_expires_at:expires_at
        // });
        // this.emailService.sendVerificationCode(dto.email,verificationCode);
        // await this.userRepository.save(user);
    }

    async verifyEmail(code:number,id:number){
        // const user=await this.userRepository.findOne({where:{id}});
        // if(!user){
        //     throw new Error("User not found");
        // }

        // const now=new Date();
        // if(user.verification_code!==code){
        //     throw new Error("Invalid verification code");
        // }
        // if(user.verification_code_expires_at<now){
        //     throw new Error("Verification code expired");
        // }
        // user.approve=0; //approved
        // await this.userRepository.save(user);
    }

    async getAllUsers(){
        // return this.userRepository.find();
    }
}
