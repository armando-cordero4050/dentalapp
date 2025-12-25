import { useAuthContext } from "./AuthContext";

export function useSession() {
    const { session, user, isLoading } = useAuthContext();

    return {
        session,
        user,
        isLoading,
        isAuthenticated: !!session,
    };
}
