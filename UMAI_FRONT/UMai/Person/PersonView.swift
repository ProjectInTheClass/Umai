//
//  PersonView.swift
//  UMai
//
//  Created by PeterPark on 10/8/24.
//

import SwiftUI
import PhotosUI

struct PersonView: View {
    @State private var profileImage: UIImage? = nil // Store the selected image
    @State private var isImagePickerPresented = false // Track if the image picker is shown
    @State private var isEditProfilePresented = false // Track if the Edit Profile view is shown

    @State private var name = "Winter"
    @State private var birthday = "2001-01-01"
    @State private var school = "Hanyang University"
    @State private var mbti = "ENFJ"
    @State private var matBTI = "FAHP"

    // Computed property to calculate age
    var age: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let birthDate = dateFormatter.date(from: birthday) else { return 0 }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: birthDate, to: Date())
        return components.year ?? 0
    }

    var body: some View {
        VStack(spacing: 20) {
                    // Profile Section
                    HStack(spacing: 16) {
                        // Profile Picture
                        ZStack {
                            if let profileImage = profileImage {
                                Image(uiImage: profileImage)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                
                            } else {
                                Image("기본프로필사진_최종")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))

                            }
                        }
                        .onTapGesture {
                            isImagePickerPresented = true // Show image picker when tapped
                        }

                        // Name
                        VStack(alignment: .leading, spacing: 8) {
                            Text(name)
                            Text("Your 맛BTI is \(matBTI)")
                                .font(.custom("GmarketSansTTFLight", size: 15))
                                .foregroundColor(Color(UIColor.systemGray2))
                        }

                        Spacer() // Push the content to the left
                        
                    }
                    .padding()
                    .background(Color("White"))
                    .cornerRadius(23)
                    .padding(.horizontal)
                    .foregroundColor(Color(.black))
                    .font(.custom("GmarketSansTTFMedium", size: 24))
                    .frame(maxWidth: .infinity)
            
            // Personal Info Section
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("생년월일:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(birthday)
                }
                Divider()

                HStack {
                    Text("나이:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text("\(age)")
                }
                Divider()

                HStack {
                    Text("학교:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(school)
                }
                Divider()

                HStack {
                    Text("MBTI:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(mbti)
                }
                Divider()

                HStack {
                    Text("맛BTI:")
                        .fontWeight(.semibold)
                    Spacer()
                    Text(matBTI)
                }
            }
            .padding()
            .background(Color("White")
                .ignoresSafeArea(.all))
            .cornerRadius(23)
            .padding(.horizontal)
            .foregroundColor(Color(.black))
            .font(.custom("GmarketSansTTFLight", size: 18))

            Spacer()
            
            Button(action: {
                isEditProfilePresented = true
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(Color("lightRed"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("White"))
                        .cornerRadius(23)
                        .padding(.horizontal)
                    }
            
            Button(action: {
                }) {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(Color("White"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("lightRed"))
                        .cornerRadius(23)
                        .padding(.horizontal)
                    }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("backgroundGray")
            .ignoresSafeArea(.all))
        .navigationTitle("My Profile")
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $profileImage)
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

#Preview {
    PersonView()
}
