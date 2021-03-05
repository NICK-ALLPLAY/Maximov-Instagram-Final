import SwiftUI

struct RootContentView: View {
    @State var toSignIn = false
    var body: some View {
    NavigationView {
        ZStack {
                Color.black
            if toSignIn {
                SignInView()
            } else {
                RootView(toSignIn: $toSignIn)
                //de
            }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootContentView()
    }
}

struct RootView: View {
    @Binding var toSignIn : Bool
    var body: some View {
        VStack {
            Image("textLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width/2)
            NavigationLink (destination: Text ("Регистрация"),
                            label: {
                                Text("Создать новый аккаунт")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width/1.1, height: 50, alignment: .center)
                                    .background(Color.blue)
                                    .cornerRadius(5)
                            }).navigationTitle("")
                .navigationBarBackButtonHidden(true)
                .padding(.top, 50)
            Button(action: {
                self.toSignIn.toggle()
                
            }, label: {
                Text("Войти")
                    .fontWeight(.semibold)
            }).padding(.top, 30)
        }
    }
}
