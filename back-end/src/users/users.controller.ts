import { Body, Controller, Post } from '@nestjs/common';
import { ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { UserCreateDto } from './dto/create.dto';

@ApiTags('Users')
@Controller('users')
export class UsersController {

    @Post()
    @ApiBody({type:UserCreateDto})
    @ApiResponse({status:201, description:'User created successfully'   })
    create(@Body() dto:UserCreateDto){}
}
