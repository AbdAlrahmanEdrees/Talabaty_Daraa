import { Column, Entity, PrimaryGeneratedColumn } from "typeorm";

export enum UserType {
  CUSTOMER = 0,
  ADMIN = 1,
  SUPERADMIN = 2,
}

export enum UserApprove {
  APPROVED = 0,
  BANNED = 1,
  NOT_VERIFIED = 2,
}

@Entity('users')
export class Users {
  @PrimaryGeneratedColumn({ name: 'users_id' })
  users_id: number;

  @Column({ name: 'users_name', length: 100 })
  users_name: string;

  @Column({ name: 'users_email', length: 100, unique: true })
  users_email: string;

  @Column({ name: 'users_password', length: 255 })
  users_password: string;

  @Column({ name: 'users_phone', length: 100 })
  users_phone: string;

  @Column({ name: 'users_verfiycode', type: 'int' })
  users_verfiycode: number;

  @Column({ name: 'users_approve', type: 'tinyint', default: UserApprove.NOT_VERIFIED })
  users_approve: UserApprove;

  @Column({ name: 'user_type', type: 'tinyint', default: UserType.CUSTOMER })
  //0:customer, 1:admin, 2:superadmin
  user_type: UserType;

  @Column({ name: 'users_create', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  users_create: Date;
}
