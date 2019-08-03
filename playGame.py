import numpy as np
import cv2
from directKeys import click, queryMousePosition
import time
from PIL import ImageGrab

gameCoords = [0, 25, 500, 525]
exitGame = 0

def shootSomeBalls(screen):
    global exitGame
    newScreen = cv2.cvtColor(screen, cv2.COLOR_BGR2GRAY)

    try:
        balls = cv2.HoughCircles(newScreen, cv2.HOUGH_GRADIENT, 0.9, 5, param1 = 50, param2 = 30, minRadius = 11, maxRadius = 13)
        allBalls = np.uint16(np.around(balls))
        for i in allBalls[0, :]:
            click(int(i[0]), int(i[1]) + 25)
            break
    except:
        exitGame = 1
        
print("Alright, let's move out!")

while True:
    mousePos = queryMousePosition()
    if mousePos.x < 500:
        break

print("Go, Go, Go!")

time.sleep(2)

while True:
    mousePos = queryMousePosition()
    if((gameCoords[0] < mousePos.x < gameCoords[2]) and (gameCoords[1] < mousePos.y < gameCoords[3])):
        screen = np.array(ImageGrab.grab(bbox = gameCoords))
        shootSomeBalls(screen)
    if exitGame:
        print("Counter-terrorists win!")
        break
