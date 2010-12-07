import com.ranjeewa.store.Role
import com.ranjeewa.store.User
import com.ranjeewa.store.UserRole

class BootStrap {

    def springSecurityService

    def init = { servletContext ->
      def userRole  = Role.findByAuthority('ROLE_USER') ?: new Role(authority: 'ROLE_USER').save(failOnError: true)
      def adminRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role(authority: 'ROLE_ADMIN').save(failOnError: true)

      def adminUser = User.findByUsername('admin') ?: new User(username: 'admin',password: springSecurityService.encodePassword('admin'),
              enabled: true).save(failOnError: true)
        if (!adminUser.authorities.contains(adminRole)) {
            UserRole.create adminUser, adminRole
        }
      def joeUser = User.findByUsername('joe') ?: new User(username: 'joe',password: springSecurityService.encodePassword('joe'),
              enabled: true).save(failOnError: true)
        if (!joeUser.authorities.contains(userRole)) {
            UserRole.create joeUser, userRole
        }

    }
    def destroy = {
    }
}
