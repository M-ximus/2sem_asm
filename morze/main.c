#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_exti.h"
#include "stm32f0xx_ll_utils.h"
#include "stm32f0xx_ll_cortex.h"
#include "string.h"

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */
static void rcc_config()
{
    /* Set FLASH latency */
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

    /* Enable HSI and wait for activation*/
    LL_RCC_HSI_Enable();
    while (LL_RCC_HSI_IsReady() != 1);

    /* Main PLL configuration and activation */
    LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                LL_RCC_PLL_MUL_12);

    LL_RCC_PLL_Enable();
    while (LL_RCC_PLL_IsReady() != 1);

    /* Sysclk activation on the main PLL */
    LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    /* Set APB1 prescaler */
    LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

    /* Update CMSIS variable (which can be updated also
     * through SystemCoreClockUpdate function) */
    SystemCoreClock = 48000000;
}

/*
 * Configure GPIO
 */
static void gpio_config(void)
{
    /*
     * Configure LEDs
     */
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);

    return;
}

/*
 * Configure external interrupts
 */
static void exti_config(void)
{
    LL_APB1_GRP2_EnableClock(LL_APB1_GRP2_PERIPH_SYSCFG);

    LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE0);
    LL_EXTI_EnableIT_0_31(LL_EXTI_LINE_0);

    LL_EXTI_EnableFallingTrig_0_31(LL_EXTI_LINE_0);
    LL_EXTI_EnableRisingTrig_0_31(LL_EXTI_LINE_0);

    NVIC_EnableIRQ(EXTI0_1_IRQn);
    NVIC_SetPriority(EXTI0_1_IRQn, 0);
}

/*
 * Handler for button
 */

static int milliseconds = 0; // "system" time

static char buffer[500] = ""; // buffer for word
static int pc = 0; // current number of elements in buffer

const int anti_bounce = 70;
const int dot = 400;

static int ms_old = 0; // here saved the last time when we clicked button
static int is_word = 0; // flag for words

void EXTI0_1_IRQHandler(void)
{
    int ms = milliseconds;
    int cur = ms - ms_old;

    if (cur < anti_bounce) {
        LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);
        return;
    }

    is_word = 1; // flag for letters

    static int is_sign = 0;
    if (!is_sign) {
        if (cur > dot && pc) buffer[pc++] = 3;

        is_sign = 1;
        ms_old = ms;

        LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);

        LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);
        return;
    }

    is_sign = 0;

    if (cur <= dot) {
        buffer[pc++] = 1;

        LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
        LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);
    }

    else if (cur > dot) {
        buffer[pc++] = 2;

        LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
        LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_8);
    }

    ms_old = ms;
    LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);
}

/*
 * Configure system timer to time 1 ms
 */

 __attribute__((naked)) static void delay(void) {
    asm ("push {r7, lr}");
    asm ("ldr r6, [pc, #8]");
    asm ("sub r6, #1");
    asm ("cmp r6, #0");
    asm ("bne delay+0x4");
    asm ("pop {r7, pc}");
    asm (".word 0x11ffff"); //60000
}

static void systick_config(void)
{
    LL_InitTick(48000000, 1000);
    LL_SYSTICK_EnableIT();
    NVIC_SetPriority(SysTick_IRQn, 0);
    return;
}

 static char buf_send[20] = "";
 static int pc_send = 0;

 void push_ASCII(int pseudo_num) {
     switch (pseudo_num) {
         case 12:    buf_send[pc_send++] = 'A' + 7;
                     break;

         case 2111:  buf_send[pc_send++] = 'B' + 7;
                     break;

         case 2121:  buf_send[pc_send++] = 'C' + 7;
                     break;

         case 211:   buf_send[pc_send++] = 'D' + 7;
                     break;

         case 1:     buf_send[pc_send++] = 'E' + 7;
                     break;

         case 1121:  buf_send[pc_send++] = 'F' + 7;
                     break;

         case 221:   buf_send[pc_send++] = 'G' + 7;
                     break;

         case 1111:  buf_send[pc_send++] = 'H' + 7;
                     break;

         case 11:    buf_send[pc_send++] = 'I' + 7;
                     break;

         case 1222:  buf_send[pc_send++] = 'J' + 7;
                     break;

         case 212:   buf_send[pc_send++] = 'K' + 7;
                     break;

         case 1211:  buf_send[pc_send++] = 'L' + 7;
                     break;

         case 22:    buf_send[pc_send++] = 'M' + 7;
                     break;

         case 21:    buf_send[pc_send++] = 'N' + 7;
                     break;

         case 222:   buf_send[pc_send++] = 'O' + 7;
                     break;

         case 1221:  buf_send[pc_send++] = 'P' + 7;
                     break;

         case 2212:  buf_send[pc_send++] = 'Q' + 7;
                     break;

         case 121:   buf_send[pc_send++] = 'R' + 7;
                     break;

         case 111:   buf_send[pc_send++] = 'S' + 7;
                     break;

         case 2:     buf_send[pc_send++] = 'A'; // T
                     break;

         case 1122:  buf_send[pc_send++] = 'B'; // U
                     break;

         case 1112:  buf_send[pc_send++] = 'C'; // V
                     break;

         case 122:   buf_send[pc_send++] = 'D'; // W
                     break;

         case 2112:  buf_send[pc_send++] = 'E'; // X
                     break;

         case 2122:  buf_send[pc_send++] = 'F'; // Y
                     break;

         case 2211:  buf_send[pc_send++] = 'G'; // Z
                     break;

         case 12222: buf_send[pc_send++] = '1' + 7;
                     break;

         case 11222: buf_send[pc_send++] = '2' + 7;
                     break;

         case 11122: buf_send[pc_send++] = '0'; // 3
                     break;

         case 11112: buf_send[pc_send++] = '1'; // 4
                     break;

         case 11111: buf_send[pc_send++] = '2'; // 5
                     break;

         case 21111: buf_send[pc_send++] = '3'; // 6
                     break;

         case 22111: buf_send[pc_send++] = '4'; // 7
                     break;

         case 22211: buf_send[pc_send++] = '5'; // 8
                     break;

         case 22221: buf_send[pc_send++] = '6'; // 9
                     break;

         case 22222: buf_send[pc_send++] = '7'; // 10
                     break;
     }
}

void word_handler() {
    is_word = 0;

    LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);

    buffer[pc] = 0;

    int pseudo_num = 0;
    for (int i = 0; i <= pc; i++) {
        if (buffer[i] - 48 == 3 || !buffer[i]) {
            push_ASCII(pseudo_num);

            pseudo_num = 0;
            continue;
        }

        pseudo_num = pseudo_num*10 + (buffer[i] - 48);
    }

    buf_send[pc_send] = 0;
    // for (int i = 0; i < pc; i++) {
    //     if (buffer[i] == 1) {
    //         LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
    //
    //         delay();
    //
    //         LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
    //
    //         delay();
    //     }
    //
    //     if (buffer[i] == 2) {
    //         LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
    //
    //         delay();
    //         delay();
    //         delay();
    //
    //         LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
    //
    //         delay();
    //     }
    //
    //     if (buffer[i] == 3) {
    //         LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
    //
    //         delay();
    //         delay();
    //         delay();
    //
    //         LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
    //
    //         delay();
    //     }
    //
    //     buffer[i] = 0;
    // }

    pc = 0;
    milliseconds = 0;
    ms_old = 0;

    LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
    LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);

    delay();
    delay();

    LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_9);
    LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);

}

void SysTick_Handler(void)
{
    if (is_word)
        if (milliseconds - ms_old > dot*4) word_handler();

        /** TODO
         * This is awful. Please, change it
         * to a normal counter without
         * stopping SysTick_Handler() func.
         */

    milliseconds++;
}

int main(void)
{
    rcc_config();
    gpio_config();
    exti_config();
    systick_config();

    LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_8);

    delay();
    delay();

    LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_8);

    while (1);
    return 0;
}
