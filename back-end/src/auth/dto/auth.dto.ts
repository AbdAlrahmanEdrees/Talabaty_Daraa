import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsString, Matches, MinLength, ValidateIf } from "class-validator";

export class AuthDto {
    @ValidateIf((o) => !o.email)
    @IsString()
    @ApiProperty()
    user_name: string;

    @ValidateIf((o) => !o.user_name)
    @Matches(/^[A-Za-z0-9._%+-]+@gmail\.com$/, {
        message: 'Email must be a valid @gmail.com address',
    })
    @ApiProperty({description:'It should be @gmail.com only'})
    email: string;

    @IsString()
    @MinLength(6)
    @ApiProperty({description:'It should be longer than 6 characters'})
    password: string;
}