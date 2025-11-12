import { IsEmail, IsInt, IsOptional, IsString, Length } from 'class-validator';
import { UserType } from '../users.entity';
import { ApiProperty } from '@nestjs/swagger';

export class UserCreateDto {
    @IsString()
    @Length(2, 100)
    @ApiProperty()
    user_name: string;

    @IsEmail()
    @ApiProperty({example:'example@gmail.com'})
    email: string;

    @IsString()
    @Length(6, 255, { message: 'Password is too short. Minimum length is 6 characters' })
    @ApiProperty()
    password: string;

    @IsString()
    @Length(9, 13,{message:'Phone number must be between 9 and 13 characters'})
    @ApiProperty()
    phone: string;

    @IsOptional()
    @IsInt()
    @ApiProperty({ required: false, enum: UserType })
    type?: UserType;
}
