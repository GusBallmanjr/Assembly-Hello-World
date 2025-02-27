.386		;Uses 386 instruction set
.model flat, stdcall ;Memory model is flat. Standard Win32 calling convention

;Function Prototypes:

ExitProcess PROTO, uExitCode:DWORD

;**************************************************************
;Function Name: ExitProcess
;Description: Terminates the process and ends the program.
;Parameters: uExitCode is the exit code for the process.
;Return Value: None
;**************************************************************

GetStdHandle PROTO, nStdHandle:DWORD

;**************************************************************
;Function Name: GetStdHandle
;Description: Retrieves the handle to the standard device.
;Parameters: nStdHandle represents the standard device and can be the input device, output device, or the error device.
;Return Value: If the function succeeds, the return value is a handle to specified device.
;**************************************************************

WriteConsoleA PROTO, hConsoleOutput:DWORD, lpBuffer:PTR BYTE, nNumberOfCharsToWrite:DWORD, lpNumberOfCharsWritten:PTR DWORD, lpReserved:DWORD

;**************************************************************
;Function Name: WriteConsoleA
;Description: Function writes characters to the console screen buffer.
;Parameters: hConsoleOutput is a handle to the console screen buffer; lpBuffer is a pointer to the console buffer; nNumberOfCharsToWrite represents the number of characters that are to be written; lpReserved is used to indicate whether the process is exiting or not.
;Return Values: If the function succeeds, the return value is not zero; if it fails, the fnction returns zero.
;**************************************************************

.data ;Data section to define variables and strings.

	STD_OUTPUT_HANDLE EQU -11 ;The standard output device. Represented as -11.
	message BYTE "Hello World!"
	Byteswritten DWORD 0 
	output DWORD 0

.code

main PROC ;similar to int main(void) in C

	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
	mov output, eax ;Move output to 32-bit accumulator register

	INVOKE WriteConsoleA, output, ADDR message, (LENGTHOF message), ADDR Byteswritten, 0 ;calling WriteConsoleA function. ADDR correlates with the address of the variables.
	
	INVOKE ExitProcess, 0
main ENDP
END main