import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsNotEmpty, IsString, Length, Matches, MinLength, ValidateIf } from "class-validator";

export class AuthDto {
    @IsNotEmpty()
    @IsEmail()
    @ApiProperty({description:'Any valid email address'})
    email:string;

    @IsString()
    @IsNotEmpty()
    @Length(3,30,{message:"name should be 3-30 characters"})
    @ApiProperty({description:'any string 3-30 charachters long'})
    name:string;

    @IsString()
    @IsNotEmpty()
    @Length(6,128,{message:"Password must be 6-128 characters"})
    @ApiProperty({description:'should be 6-128 characters'})
    password:string;



}