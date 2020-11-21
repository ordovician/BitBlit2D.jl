module BitBlit2D

using SimpleDirectMediaLayer
const SDL = SimpleDirectMediaLayer

# UInt32(SDL.WINDOW_ALLOW_HIGHDPI|SDL.WINDOW_OPENGL|SDL.WINDOW_RESIZABLE|SDL.WINDOW_SHOWN))


function main()
    ok = SDL.Init(SDL.INIT_VIDEO)
    println("Init: ", ok)
    
    win = SDL.CreateWindow(
            "Hello World", 
            Int32(100), Int32(100),
            Int32(300), Int32(400),
            UInt32(SDL.WINDOW_SHOWN))
    SDL.SetWindowMinimumSize(win, Int32(50), Int32(50))

    
    renderer = SDL.CreateRenderer(win, Int32(-1),
        UInt32(SDL.RENDERER_ACCELERATED | SDL.RENDERER_PRESENTVSYNC))
    
    SDL.IMG_Init(Int32(SDL.IMG_INIT_JPG | SDL.IMG_INIT_PNG))
    image = SDL.IMG_Load("assets/hero/idle outline.gif")
    SDL.IMG_SavePNG(image, "dummy.png")
    
    println("Image: ", image)
    
    tex = SDL.CreateTextureFromSurface(renderer, image)
    SDL.FreeSurface(image)
    println("tex: ", tex)
    
    w = Int[21]
    h = Int[35]
    
    for i = 1:200
        x,y = Int[1], Int[1]
        SDL.PumpEvents()
        # SDL.GetMouseState(pointer(x), pointer(y))

        # Set render color to red ( background will be rendered in this color )
        SDL.SetRenderDrawColor(renderer, 200, 200, 200, 255)
        SDL.RenderClear(renderer)

        # SDL.SetRenderDrawColor(renderer, 20, 50, 105, 255)
        # SDL.RenderDrawLine(renderer,0,0,800,600)
        #
        rect = SDL.Rect(1,1,200,200)
        SDL.RenderFillRect(renderer, pointer_from_objref(rect) )
        # SDL.RenderCopy(renderer, tex, C_NULL, pointer_from_objref(SDL.Rect(x[1],y[1], w[1], h[1])))
        SDL.RenderCopy(renderer, tex, C_NULL, C_NULL)

        SDL.RenderPresent(renderer)
        sleep(0.001)
    end
    SDL.DestroyRenderer(renderer)
    SDL.DestroyWindow(win)
    SDL.IMG_Quit()
    SDL.Quit()
end

main()

end
