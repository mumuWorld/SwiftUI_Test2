//
//  ContentView.swift
//  test_2
//
//  Created by Mumu on 2021/11/10.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    
    @State var offsetSize = CGSize.zero

    @State var showCard = false
    
    @State var bottomState = CGSize.zero
    
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .opacity(showCard ? 0.4 : 1)
                .offset(x: 0, y: showCard ? -200 : 0)
                .animation(Animation
                            .default
                            .delay(0.1)
                            .speed(2)
                )
            
            BackgroundCardView()
                .frame(width: showCard ? 300 : 340, height: 220, alignment: .center)
                .background(show ? Color("background3") : Color("background9"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .offset(x: offsetSize.width, y: offsetSize.height)
                .offset(x: 0, y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(.degrees(showCard ? -10 : 0))
                .rotation3DEffect(
                    .degrees(showCard ? 0 : 10),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            BackgroundCardView()
                .frame(width: 340, height: 220, alignment: .center)
                .background(show ? Color("background5") : Color("background3"))
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .offset(x: offsetSize.width, y: offsetSize.height)
                .offset(x: 0, y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotationEffect(.degrees(showCard ? -5 : 0))
                .rotation3DEffect(
                    .degrees(showCard ? 0 : 5),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375.0 : 340.0, height: 220.0)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
//                .cornerRadius(10.0)
                .shadow(radius: 20)
                .offset(x: offsetSize.width, y: offsetSize.height)
                .offset(x: 0, y: showCard ? -100 : 0)
                .blendMode(.hardLight)
                .onTapGesture {
//                    show.toggle()
                    showCard.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.offsetSize = value.translation
                            self.show = true
                        })
                        .onEnded({ value in
                            self.offsetSize = CGSize.zero
                            self.show = false
                        })
                )
                .animation(.spring(response: 0.2, dampingFraction: 0.6, blendDuration: 0))
            
            Text("value= \(bottomState.height)").offset(x: 0, y: -300)
            
            BottomCardView(showProgress: $showCard)
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(x: 0, y: self.bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.2))
                .gesture(
                    DragGesture().onChanged({ value in
                        self.bottomState = value.translation
                        if self.showFull {
                            self.bottomState.height += -300
                        }
                        if self.bottomState.height < -300 {
                            self.bottomState.height = -300
                        }
                    })
                    .onEnded({ value in
                        if self.bottomState.height > 50 {
                            self.showCard = false
                        }
                        if (self.bottomState.height < -100 && !self.showFull) ||
                        (self.bottomState.height < -250 && self.showFull) {
                            self.bottomState.height = -300
                            self.showFull = true
                        } else {
                            self.bottomState = .zero
                            self.showFull = false
                        }
                    })
                )

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundCardView: View {
        
    var body: some View {
        VStack {
            Spacer()
        }
        
        
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello, world!")
                        .font(.title)
                    Text(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo").resizable().aspectRatio(contentMode: .fit)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            Spacer()
            Image("Illustration1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
                .padding(.top, 20)
        }
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificate")
                    .font(.largeTitle)
                Spacer()
            }
            .padding()
            Image("Illustration4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(0.7)
                .offset(x: 0, y: -20)
            Spacer()
        }
    }
}

struct BottomCardView: View {
    
    @Binding var showProgress: Bool

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 40, height: 5, alignment: .center)
                .padding(.top, 8)
                .cornerRadius(3)
                .opacity(0.5)
            Text("唐三炮是个大傻猪。唐三炮是个大傻猪。唐三炮是个大傻猪。唐三炮是个大傻猪。唐三炮是个大傻猪。唐三炮是个大傻猪。")
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .padding()
            
            HStack {
                RingView(color1: Color("background9"), color2: Color("background5"), width: 88, height: 88, percent: 70, show: $showProgress)
                    .animation(Animation.easeInOut.delay(0.3))
                
                Spacer()
                    .frame(width: 20)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("SwiftUI").fontWeight(.bold)
                    Text("SwiftUI complete")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 3)
            }
            .padding(20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
