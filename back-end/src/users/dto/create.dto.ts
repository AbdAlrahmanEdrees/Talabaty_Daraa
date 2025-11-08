import { IsEmail, IsInt, IsOptional, IsString, Length } from 'class-validator';
import { UserType } from '../users.entity';
import { ApiProperty } from '@nestjs/swagger';

export class UserCreateDto {
    @IsString()
    @Length(2, 100)
    @ApiProperty()
    users_name: string;

    @IsEmail()
    @ApiProperty({example:'example@gmail.com'})
    users_email: string;

    @IsString()
    @Length(6, 255, { message: 'Password is too short. Minimum length is 6 characters' })
    @ApiProperty()
    users_password: string;

    @IsString()
    @Length(9, 13,{message:'Phone number must be between 9 and 13 characters'})
    @ApiProperty()
    users_phone: string;

    @IsOptional()
    @IsInt()
    @ApiProperty({ required: false, enum: UserType })
    user_type?: UserType;
}
