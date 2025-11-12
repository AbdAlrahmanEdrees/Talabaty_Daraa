import { Body, Controller, Post } from '@nestjs/common';
import { AuthDto } from './dto/auth.dto';
import { AuthService } from './auth.service';
import { ApiBody, ApiResponse } from '@nestjs/swagger';


@Controller('auth')
export class AuthController {
    constructor(
        private readonly authService:AuthService,
    ) { }
    @Post('login')
    @ApiBody({ type: AuthDto })
    @ApiResponse({ status: 201, description: 'User authenticated successfully' })
    login(@Body() authPayLoad: AuthDto) {
        this.authService.validateUser(authPayLoad);
    }
}
