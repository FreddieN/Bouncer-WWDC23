# Bouncer-WWDC23
This project was not selected for the challenge however it did receive a great mark in the coursework! 

My Swift Student Challenge app project is inspired by an experiment I completed at university demonstrating solid mechanics. Part of the technical report is around ‘verifying our calculations’ and I thought a unique way to check the calculations would be modelling them in AR using Swift Playgrounds. The first page of the activity shows the finished result of this when the experiment was performed. Thanks to ARKit and SceneKit, the models are to scale, and the AR model was precise and accurately predicted the correct distance. 

The result of this app is an engaging learning activity guiding you through the calculations used to predict the distance. The exciting aspect about this is all the same equations shown within the pages are used for the 3D model allowing for parameters to be changed and the model to update accordingly allowing students to apply what they’ve learnt. This means the user can visualise what effect the numbers will have. AVKit is used for the video provided at the start. Charts (released at WWDC22) is also used to produce the displacement graph for the ball path in a familiar way. The 3D models are made in SceneKit and require no external assets, just provided basic geometry types in SceneKit. ARKit makes it easy to add this SceneKit scene to AR to scale. SwiftUI is used for the interface with a sidebar, so the user is focused on the technical activities. Students will learn about Energy Methods, Kinematic Equations, Projectile Motion and Coefficient of Restitution. There are also questions to complete and other interactive elements across pages as well as a fun minigame ‘TiltBounce’ that utilises CoreMotion to help control the angle of the tube. 

You can have a play with the desmos used to help form this model here: https://www.desmos.com/calculator/uleymsgzfd

More about the Swift Student Challenge: https://developer.apple.com/wwdc23/swift-student-challenge/

## Demo Video

[![Demo Video](https://img.youtube.com/vi/XSjS0nZrEhQ/0.jpg)](https://youtu.be/XSjS0nZrEhQ)

