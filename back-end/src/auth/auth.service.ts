import { Injectable } from '@nestjs/common';
import { AuthDto } from './dto/auth.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import bcrypt from 'bcrypt';
import { Tokens } from './types';
import { JwtService } from '@nestjs/jwt';
import * as env from 'dotenv';
env.config();
@Injectable()
export class AuthService {
    constructor(private prisma: PrismaService,
        private jwtService:JwtService
    ) { }
    async signupLocal(dto: AuthDto):Promise<Tokens> {
        const hashedPassowrd=await this.hashData(dto.password);
        const newUser=await this.prisma.user.create({
            data: {
                name:dto.name,
                email:dto.email,
                hashedPassowrd:hashedPassowrd,
            }
        })
        const tokens= await this.getTokens(newUser.id,newUser.email);
        await this.updateRtHash(newUser.id,tokens.refresh_token);
        return tokens;
    }

    signinLocal() { }

    logout() { }

    refreshTokens() { }

    /*
    helper function:
    */
   

    hashData(data:string){
        return bcrypt.hash(data,10);
    }
    async getTokens(userId:string,email:string){
        // you can use whatever data you want.
        // But it should be public data, not something like password.
        const payload={
            sub:userId,
            email:email
        };

        const accessToken=await this.jwtService.signAsync(payload,{
            secret:process.env.AT_SECRET,
            expiresIn:15*60,
        });

        const refreshToken= await this.jwtService.signAsync(payload,{
            secret:process.env.RT_SECRET,
            expiresIn:60*60*24*7
        });
        return {
            access_token:accessToken,
            refresh_token:refreshToken

        }
    }
    async updateRtHash(userId:string,refreshToken:string){
        const rtHashed=await this.hashData(refreshToken);
        await this.prisma.user.update({where:{id:userId},data:{
            hashedRt:rtHashed,
        }});

    }

}
