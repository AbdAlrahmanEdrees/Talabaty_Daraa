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
export class User {
  @PrimaryGeneratedColumn({ name: 'id' })
  id: number;

  @Column({ name: 'user_name', length: 100 })
  user_name: string;

  @Column({ name: 'email', length: 100, unique: true })
  email: string;

  @Column({ name: 'password', length: 255 })
  password: string;

  @Column({ name: 'phone', length: 100 })
  phone: string;

  @Column({ name: 'verification_code', type: 'int' })
  verification_code: number;

  @Column({name:'verification_code_expires_at'})
  verification_code_expires_at:Date;

  @Column({ name: 'approve', type: 'tinyint', default: UserApprove.NOT_VERIFIED })
  approve: UserApprove;

  @Column({ name: 'type', type: 'tinyint', default: UserType.CUSTOMER })
  //0:customer, 1:admin, 2:superadmin
  type: UserType;

  @Column({ name: 'created_at', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' })
  created_at: Date;
}
