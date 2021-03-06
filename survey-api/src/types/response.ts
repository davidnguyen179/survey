import { Status } from './status';

export interface APIResponse<T> {
  status: Status;
  data?: T;
  error?: {
    message: string;
  };
}
