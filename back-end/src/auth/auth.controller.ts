import type { Response } from 'express';
import { Body, Controller, Post, Res } from '@nestjs/common';
import { ApiBody, ApiResponse } from '@nestjs/swagger';
import { AuthDto } from './dto/auth.dto';
import { AuthService } from './auth.service';
import { Tokens } from './types';

@Controller('auth')
export class AuthController {
    constructor(private readonly authService:AuthService){}

  @Post('local/signup')
  @ApiBody({ type: AuthDto })
  @ApiResponse({ status: 200, description: 'Signup succeeded' })
  @ApiResponse({ status: 400, description: 'Bad Request, doesn\'t match the Dto blue-print' })
  @ApiResponse({ status: 403, description: 'Signup failed' })
  signupLocal(@Body() dto:AuthDto):Promise<Tokens>{
    return this.authService.signupLocal(dto);
  }

  @Post("local/signin")
  @ApiBody({type:AuthDto})
  @ApiResponse({status:200})
  signinLocal(){
    this.authService.signinLocal();}

  @Post('logout')
  logout(){
    this.authService.logout();}

  @Post('/refresh')
  refreshTokens(){
    this.authService.refreshTokens();}
}
