-- Desktop and Deskbar

-- Variables
slc = 0
dbbgcol = 8
dbtxtcol = 1
bgcolor = 1
bgpath = "bg"

-- Functions

function drawDeskbar(open)
  term.setCursorPos(1,1)
  term.setBackgroundColor(dbbgcol)
  term.setTextColor(dbtxtcol)
  term.clearLine()
  term.setCursorPos(2,1)
  print("# ")
	
	if open == nil then
		term.setCursorPos(6,1)
		print("")
	
	else
		term.setCursorPos(6,1)
		print("["..open.."]")
  
	end
end

function drawDesktop()
  term.setBackgroundColor(bgcolor)
  term.clear()
  bg = paintutils.loadImage(bgpath)
  paintutils.drawImage(bg,3,2)

end

function drawDeskbarMenu()
  term.setCursorPos(1,2)
  print("            ")
  term.setCursorPos(1,3)
  print(" Shutdown   ")
  term.setCursorPos(1,4)
  print(" Reboot     ")
  term.setCursorPos(1,5)
  print(" Exit       ")
  term.setCursorPos(1,6)
  print("------------")
  term.setCursorPos(1,7)
  print(" LuaIDE     ")
	term.setCursorPos(1,8)
	print(" NPaintPro  ")
	term.setCursorPos(1,9)
	print(" Lemon File ")
	term.setCursorPos(1,10)
	print(" /////////  ")
	term.setCursorPos(1,11)
	print(" Glass Mail ")
	term.setCursorPos(1,12)
	print("            ")

end

function returnerr(errnum)

	if errnum == "UE" then
		term.clear()
		term.setBackgroundColor(256)
		term.setTextColor(128)
		term.clear()
		term.setCursorPos(2,2)
				
		print("Unexpected error! Please contact the developer for more info.")

	elseif errnum == nil or 0 or "U" then
		term.clear()
		term.setBackgroundColor(256)
		term.setTextColor(128)
		term.clear()
		term.setCursorPos(2,2)
		
		print("Unknown error! Please contact the developer for more info.")
	
	else
		term.clear()
		term.setBackgroundColor(256)
		term.setTextColor(128)
		term.clear()
		term.setCursorPos(2,2)
		
		print("An error has occurred! If this error occurred while running a third party application, show the error number (ERRNUM) to the developer of the program. Otherwise, send the error number to the Solice Dev-Team.")
		print("")
		print("ERRNUM = " ..errnum)
	end
end
	
function drawWindowBack(color,img)
	term.clear()
	panelbg = paintutils.loadImage(img)
	paintutils.drawImage(panelbg,2,2)
	term.setBackgroundColor(color)
	term.clear()
	
end

function customize()
	
	drawDesktop()
	drawDeskbar("Customize")

	drawWindowBack(128,"128.nfp")
	term.setBackgroundColor(128)
	term.setTextColor(1)
	term.setCursorPos(3,3)
	write("Desktop >   |   ")
	term.setCursorPos(3,5)
	write("User >      |   ")
	term.setCursorPos(18,5)
	write("Wallpaper : " ..bgpath)
	
end

function run(prog)
	if prog == nil then
		term.setBackgroundColor(256)
		term.setTextColor(128)
		drawDeskbar()
		term.setCursorPos(1,2)
		os.shell("shell")
		
	elseif prog == "shell" then
		term.clear()
		dofile ("/programs/shell")
	end
end

function LuaIDE()
	dofile ("/programs/LuaIDE")

end

function NPaintPro()
	dofile ("/programs/NPaintPro")

end

function LemonFileManager()
	dofile("/programs/LFM")

end

function glassmail()
	term.clear()
	term.setBackgroundColor(128)
	term.setTextColor(1)
	term.setCursorPos(1,1)
	term.clear()
	drawDeskbar()
	dofile("/programs/Email")

	end
	
-- Main Stuff

drawDesktop()
drawDeskbar()

while true do
  local event, button, X, Y = os.pullEventRaw()
    if slc == 0 then
      if event == "mouse_click" then
        if X >= 1 and X<=3 and Y == 1 and button == 1 then
          drawDeskbarMenu()
          slc = 1
        
        else
          drawDesktop()
          drawDeskbar()
      
        end
      end
    elseif slc == 1 then
      if X >= 1 and X <= 12 and button == 1 and Y == 3 then slc = 0
        os.shutdown()
      
      elseif X >= 1 and X <= 12 and button == 1 and Y == 4 then slc = 0
        os.reboot()
	  
	    elseif X >= 1 and X <= 12 and button == 1 and Y == 5 then slc = 0
				term.setBackgroundColor(32768)
				term.setTextColor(16)
				term.setCursorPos(1,2)
				run("shell")
			
			elseif X >= 1 and X <= 12 and button == 1 and Y == 7 then slc = 0
				LuaIDE()
			
			elseif X >= 1 and X <= 12 and button == 1 and Y == 8 then slc = 0
				NPaintPro()
			
			elseif X >= 1 and X <= 12 and button == 1 and Y == 9 then slc = 0
				LemonFileManager()
			
			elseif X >= 1 and X <= 12 and button == 1 and Y == 10 then slc = 0
				customize()
			
			elseif X >= 1 and X <= 12 and button == 1 and Y == 11 then slc = 0
				glassmail()
				
      else
      slc = 0
      drawDesktop()
      drawDeskbar()
		end
  end
end
