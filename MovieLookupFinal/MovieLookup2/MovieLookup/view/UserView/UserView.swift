import SwiftUI


struct UserView: View {
    @State var showGreeting = false // Variable de estado para controlar la visibilidad del saludo
    @State private var image: Image? = nil
    @State private var showImagePicker = false



    var body: some View {
        NavigationView {
            ZStack { // Apila las vistas una encima de la otra en orden de declaración
                Color(red: 39/255, green: 40/255, blue: 59/255).ignoresSafeArea() // Fondo de la vista con un color personalizado



                VStack { // Apila las vistas verticalmente
                    VStack { // Apila las vistas verticalmente
                        Button(action: {
                            showImagePicker = true
                        }) {
                            if let profileImage = image {
                                profileImage
                                    .resizable() // Permite que la imagen se ajuste al tamaño
                                    .aspectRatio(contentMode: .fit) // Ajusta la imagen al contenido
                                    .frame(width: 90, height: 90) // Establece un tamaño fijo para la imagen
                                    .clipShape(Circle()) // Recorta la imagen en forma de círculo
                            } else {
                                Image(systemName: "person.circle.fill") // Imagen de perfil predeterminada
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 90, height: 90)
                                    .foregroundColor(.gray) // Color gris para la imagen predeterminada
                                    .clipShape(Circle())
                            }
                        }



                        Text("Admin") // Texto indicando el rol del usuario
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding() // Añade espacio alrededor del texto
                    }
                    .padding() // Añade espacio alrededor del VStack principal



                    Text("AJUSTES") // Título "AJUSTES"
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 350, alignment: .leading) // Establece un ancho fijo para el texto
                        .bold()
                        .padding() // Añade espacio alrededor del texto



                    VStack { // Apila las vistas verticalmente
                        HStack { // Apila las vistas horizontalmente
                            Text("Cuenta") // Etiqueta "Cuenta"
                                .foregroundColor(.white)
                                .frame(width: 300, alignment: .leading) // Establece un ancho fijo para el texto
                            Image(systemName: "chevron.right") // Icono de flecha hacia la derecha
                                .foregroundColor(.white)
                        }
                        .frame(width: 380, height: 60) // Establece un tamaño fijo para el HStack
                        .background(Color(red: 34/255, green: 47/255, blue: 76/255)) // Fondo del HStack



                        HStack { // Apila las vistas horizontalmente
                            Text("     ") // Espacios en blanco
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Text("Notificaciones") // Etiqueta "Notificaciones"
                                .foregroundColor(.white)
                            Toggle("", isOn: $showGreeting) // Interruptor para mostrar u ocultar el saludo
                                .toggleStyle(SwitchToggleStyle(tint: .green)) // Estilo de interruptor personalizado
                                .padding(.trailing) // Añade espacio a la derecha del Toggle
                        }
                        .frame(width: 380, height: 60) // Establece un tamaño fijo para el HStack
                        .background(Color(red: 34/255, green: 47/255, blue: 76/255)) // Fondo del HStack



                        // Los bloques HStack siguientes siguen una estructura similar
                        HStack {
                            Text("Editar perfil")
                                .foregroundColor(.white)
                                .frame(width: 300, alignment: .leading)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .frame(width: 380, height: 60)
                        .background(Color(red: 34/255, green: 47/255, blue: 76/255))



                        HStack {
                            Text("Califique esta aplicación")
                                .foregroundColor(.white)
                                .frame(width: 300, alignment: .leading)
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                        }
                        .frame(width: 380, height: 60)
                        .background(Color(red: 34/255, green: 47/255, blue: 76/255))
                    }



                    Spacer() // Espacio flexible para empujar los elementos hacia la parte superior de la vista
                }
                .padding(.horizontal, 5) // Añade espacio horizontal alrededor del VStack principal



            }
            .navigationBarHidden(true) // Oculta la barra de navegación
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image)
            }
        }
    }
}
