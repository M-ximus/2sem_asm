/*
 * This example demonstrates using USART
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_usart.h"

#include "xprintf.h"
#include "oled_driver.h"

char mail[64] = "";
char word_is_full = 0;

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
 * Clock on GPIOC and set two led pins
 */
static void gpio_config(void)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
    return;
}

/*
 * Initialize USART module and associated pins
 */
static void usart_config(void)
{
    /*
     * Setting USART pins
     */
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
    //USART1_TX
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_9, LL_GPIO_MODE_ALTERNATE);
    LL_GPIO_SetAFPin_8_15(GPIOA, LL_GPIO_PIN_9, LL_GPIO_AF_1);
    LL_GPIO_SetPinSpeed(GPIOA, LL_GPIO_PIN_9, LL_GPIO_SPEED_FREQ_HIGH);
    //USART1_RX
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_10, LL_GPIO_MODE_ALTERNATE);
    LL_GPIO_SetAFPin_8_15(GPIOA, LL_GPIO_PIN_10, LL_GPIO_AF_1);
    LL_GPIO_SetPinSpeed(GPIOA, LL_GPIO_PIN_10, LL_GPIO_SPEED_FREQ_HIGH);
    /*
     * USART Set clock source
     */
    LL_APB1_GRP2_EnableClock(LL_APB1_GRP2_PERIPH_USART1);
    LL_RCC_SetUSARTClockSource(LL_RCC_USART1_CLKSOURCE_PCLK1);
    /*
     * USART Setting
     */
    LL_USART_SetTransferDirection(USART1, LL_USART_DIRECTION_TX_RX);
    LL_USART_SetParity(USART1, LL_USART_PARITY_NONE);
    LL_USART_SetDataWidth(USART1, LL_USART_DATAWIDTH_8B);
    LL_USART_SetStopBitsLength(USART1, LL_USART_STOPBITS_1);
    LL_USART_SetTransferBitOrder(USART1, LL_USART_BITORDER_LSBFIRST);
    LL_USART_SetBaudRate(USART1, SystemCoreClock, LL_USART_OVERSAMPLING_16, 115200);
    LL_USART_EnableIT_IDLE(USART1);
    LL_USART_EnableIT_RXNE(USART1);
    /*
     * USART turn on
     */
    LL_USART_Enable(USART1);
    while (!(LL_USART_IsActiveFlag_TEACK(USART1) && LL_USART_IsActiveFlag_REACK(USART1)));
    /*
     * Turn on NVIC interrupt line
     */
    NVIC_SetPriority(USART1_IRQn, 0);
    NVIC_EnableIRQ(USART1_IRQn);
    return;
}

static void send_message(char* buffer)
{
    uint32_t i = 0;
    while (buffer[i] != '\0')
    {
      while(!LL_USART_IsActiveFlag_TXE(USART1));
      LL_USART_TransmitData8(USART1, buffer[i]);
      i++;
      //while (!LL_USART_IsActiveFlag_TC(USART1));
    }
    while (!LL_USART_IsActiveFlag_TC(USART1));

    LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_8);
    return;
}

void USART1_IRQHandler(void)
{
    static uint32_t i = 0;

    if(LL_USART_IsActiveFlag_RXNE(USART1))
    {
      mail[i] = LL_USART_ReceiveData8(USART1);
      i++;
      LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_9);
    }
    if (LL_USART_IsActiveFlag_IDLE(USART1))
    {
        word_is_full = 1;
        mail[i] = '\0';
        i = 0;
        LL_USART_ClearFlag_IDLE(USART1);
    }

}

static void decoder(void)
{
  int i = 0;
  while(mail[i] != '\0')
  {
    if (mail[i] > 'G')
      mail[i] -= 7;
    else
    {
      if (mail[i] == 'G')
        mail[i] = 'Z';
      if (mail[i] == 'F')
        mail[i] = 'Y';
      if (mail[i] == 'E')
        mail[i] = 'X';
      if (mail[i] == 'D')
        mail[i] = 'W';
      if (mail[i] == 'C')
        mail[i] = 'V';
      if (mail[i] == 'B')
        mail[i] = 'U';
      if (mail[i] == 'A')
        mail[i] = 'T';
    }
    i++;
  }
  return;
}

static void printf_config(void)
{
    xdev_out(oled_putc);
    return;
}

int main(void)
{
    rcc_config();
    gpio_config();
    oled_config();
    printf_config();
    usart_config();

    //xprintf("Airat pidoras\n");
    //oled_update();

    //send_message("123");
    //xprintf("%s", mail);
    //oled_update();


    while(1)
    {
      if(word_is_full == 1)
      {
        decoder();
        xprintf("%s\n", mail);
        oled_update();
        word_is_full = 0;
      }
    }

    return 0;
}
