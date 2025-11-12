import { Body, Controller, Get, Post } from '@nestjs/common';
import { ApiBody, ApiResponse, ApiTags } from '@nestjs/swagger';
import { UserCreateDto } from './dto/create.dto';
import { UsersService } from './users.service';

@ApiTags('Users')
@Controller('users')
export class UsersController {
    constructor(private readonly usersService:UsersService){}

    @Post()
    @ApiBody({type:UserCreateDto})
    @ApiResponse({status:201, description:'User created successfully'   })
    create(@Body() dto:UserCreateDto){
        this.usersService.createUser(dto)
    }

    @Get()
    @ApiResponse({status:200, description:'List of users'})
    getAllUsers(){
        return this.usersService.getAllUsers();
    }
}
