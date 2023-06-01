
import SwiftUI

@main
struct MovieLookupApp: App {
    @State var isLogged = false
    @State var email = ""
    @State var password = ""
    @State var showPassword=false
    @State var isHomeScreenActive = false
    //Se muestra la escena principal de la aplicación, en este caso es la barra de menu que está en todas las partes de la aplicación
    var body: some Scene {
        WindowGroup {
            TabView {
                //Mostrar la barra de menu principal
               //Sí el usuario esta logeado se muestra la barra de la aplicación principal
                if(isLogged) {
                    DiscoverView().tabItem {
                        Image(systemName: "popcorn").foregroundColor(.white)
                    }
                    UserView()
                        .tabItem {
                            Image(systemName: "person.fill").foregroundColor(.white)
                        }
                } else {
                    NavigationView { //Se muestra la pantalla de login
                        ZStack{
                            Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea() //Se imprime el fondo
                            VStack{
                                ScrollView {
                                    VStack {
                                        //Formulario donde se almacenen la contraseña y email del usuario
                                        HStack{
                                            Text("MovieLookup").font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Image(systemName: "video").foregroundColor(.white)
                                        }
                                        Spacer()
                                        Text("Email").font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        ZStack(alignment: .leading){
                                            if email.isEmpty {
                                            //Sí el usuario no ha puesto nada, se muestra el siguiente texto:
                                                Text(verbatim:"example@example.com").font(.caption).foregroundColor(.gray)
                                            }
                                            TextField("", text:$email).foregroundColor(.white)
                                        }
                                        Divider().frame(height:1).background(.white).padding(.bottom)
                                        Text("Contraseña").font(.title3)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        ZStack(alignment: .leading){
                                            if password.isEmpty {
                                                Text(verbatim:"Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                                            }
                                            HStack {
                                                //Sí se aprieta el botón del ojo, se muestra la contraseña, de lo contrario se oculta la contraseña
                                                if showPassword {
                                                    TextField("Password", text: $password).foregroundColor(.white)
                                                } else {
                                                    //Esto se hace on un SecureField
                                                    SecureField("Password", text:$password).foregroundColor(.white)
                                                }
                                                Button(action: {showPassword.toggle()}) {
                                                    Image(systemName: showPassword ? "eye.slash" : "eye").foregroundColor(.white)
                                                }.padding(.trailing, 8)
                                            }
                                        }
                                        Divider().frame(height:1).background(.white).padding(.bottom)
                                    }
                                }.padding(.horizontal, 50)
                                //Esto botón llama a la función correspondiente para comprobar los datos
                                Button(action: login,
                                       label: {
                                    Text("INICIAR SESIÓN").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: 200, alignment: .center).padding(EdgeInsets(top:11, leading:18, bottom:11, trailing: 18)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(.white, lineWidth: 1.0).shadow(color: .white, radius: 6))
                                })
                            }
                        }
                    }.navigationBarHidden(true)
                }
                
            }
        }
    }
    //Se comprueba que los datos introducidos sean los correctos
    func login(){
        if(email == "1" && password == "1"){
            isLogged = true
        }
        print("Estoy iniciando sesión")
        
    }
}
