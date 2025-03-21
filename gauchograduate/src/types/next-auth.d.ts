import "next-auth"

export interface UserCourse {
  quarter: string;
  id: string;
  grade?: string;
}

export interface MajorOverride {
  type: string;
  requirement: string;
  courseId?: number;
  creditSource?: string;
  units?: number;
}

export interface UserCourses {
  firstQuarter: string;
  courses: UserCourse[];
  overrides?: MajorOverride[];
  selectedYear?: string;
}

declare module "next-auth" {
  interface Session extends DefaultSession {
    user?: DefaultSession["user"] & {
      id: string;
      email: string;
      name?: string | null;
      image?: string | null;
      majorId: number | null;
      courses: UserCourses;
    }
  }
}
