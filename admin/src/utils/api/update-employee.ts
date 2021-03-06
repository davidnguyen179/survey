import { APIResponse } from '../../models/response';
import { Employee } from '../../models/employee';
import { END_POINT } from '../constants/link';

export async function updateEmployee(employee: Employee): Promise<APIResponse<Employee>> {
  try {
    const postData = {
      id: employee.id,
      fullName: employee.fullName,
      position: employee.position,
      gender: employee.gender
    };

    const res = await fetch(`${END_POINT}/api/v1/employee/`, {
      method: 'put',
      body: JSON.stringify(postData),
      headers: {
        'Content-Type': 'application/json'
      }
    });
    const result = await res.json();
    const { data } = result;

    if (res.status >= 400) {
      throw result;
    }

    return {
      data,
      status: 'success'
    };
  } catch (e) {
    return e;
  }
}
