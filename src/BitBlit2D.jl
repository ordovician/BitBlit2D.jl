module BitBlit2D

using SimpleDirectMediaLayer
const SDL = SimpleDirectMediaLayer

# UInt32(SDL.WINDOW_ALLOW_HIGHDPI|SDL.WINDOW_OPENGL|SDL.WINDOW_RESIZABLE|SDL.WINDOW_SHOWN))


function main()
    ok = SDL.Init(SDL.INIT_VIDEO)
    win = SDL.CreateWindow(
            "Hello World", 
            Int32(100), Int32(100),
            Int32(300), Int32(400),
            UInt32(SDL.WINDOW_SHOWN))
    SDL.SetWindowMinimumSize(win, Int32(50), Int32(50))
    
    
    renderer = SDL.CreateRenderer(win, Int32(-1),
        UInt32(SDL.RENDERER_ACCELERATED | SDL.RENDERER_PRESENTVSYNC))
    
    for i = 1:200
        x,y = Int[1], Int[1]
        SDL.PumpEvents()
        SDL.GetMouseState(pointer(x), pointer(y))

        # Set render color to red ( background will be rendered in this color )
        SDL.SetRenderDrawColor(renderer, 200, 200, 200, 255)
        SDL.RenderClear(renderer)

        SDL.SetRenderDrawColor(renderer, 20, 50, 105, 255)
        SDL.RenderDrawLine(renderer,0,0,800,600)

        rect = SDL.Rect(1,1,200,200)
        SDL.RenderFillRect(renderer, pointer_from_objref(rect) )

        SDL.RenderPresent(renderer)
        sleep(0.001)
    end
    
    SDL.Quit()
end

#main()

end
