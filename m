Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A262DE27
	for <lists.virtualization@lfdr.de>; Thu, 17 Nov 2022 15:33:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 776C68209C;
	Thu, 17 Nov 2022 14:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 776C68209C
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mMbOTdEj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeNrmdyE-ExO; Thu, 17 Nov 2022 14:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A749F820BD;
	Thu, 17 Nov 2022 14:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A749F820BD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1909C0077;
	Thu, 17 Nov 2022 14:33:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA911C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 14:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70B14400D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 14:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B14400D6
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mMbOTdEj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id drFKhU-ldTgw
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 14:33:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF8F9400CB
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF8F9400CB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 14:33:07 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d192so1971960pfd.0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 17 Nov 2022 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=PbFDs+3SDAki55RJjrrFRD3jZK40Qi40k+nyqVzyofw=;
 b=mMbOTdEjO/WsYpudFX4YM2CluSHhPm2wREMWr0zsJPGtIdOgI0+AtmqA7QePmXiSzf
 05n4QXjvyv2y8ZSHzsx2SFH83nbl6zXi0ZrNXHOv+20rvMHBXr8maJYD38QTgh9eYVxV
 sBusroZDjB1Adn7CFxrmighHn5CYv51/OL278swURZqeiy04D/4t48cUiyFErh3pd3He
 eiX+Mi6pVmg22uI3JKTgtBWdkmRIyhe/gsGVpGwP9K4xjrJgBO6hzryY3b2TNpMzWRo+
 xlSgMCgNT3v/iN5wt1JpmS/CruOzr/qkGgoPvAMxoW/YFh8yomslvg+qZl3HXtSlTCUp
 is+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PbFDs+3SDAki55RJjrrFRD3jZK40Qi40k+nyqVzyofw=;
 b=2AatONqlPmYF3jZ6SSyR5cHW9iJkPDd6CEgC7lFKA5ACkNlpbi38cIm3t7i7rLXW9m
 MtNTTUDB+Zb+yEvAqJEE9NdvVGw5pqWzpK2nhSLopXrI89qFPh1lUkhcHUV7lc4mE8xw
 IOsEhSC8AyTYNIzTmekqCUvrO8Kho/SAkui/CPyfNe3x0OWLNAq7+J28p0kHgQ2s2IoB
 J9YE8VmpTfIlNXqme5MDJSKh7jkA7ZoZgRr4KC40F0QKl0lnuW2ZVmsvhf15K4FvJJPl
 SN9Kb0yZHE8z4/DmZirMdINNdGBlKehXKcc8NFLXAR1CXBwACPWprsXqhWu26RBniX41
 7r1g==
X-Gm-Message-State: ANoB5plmczYqwmVi1i894JLOkoX05HMOZ2NvWt4aFcXU+4Lc1tVJgrNY
 zvDWqgJ7JFotbCgDnBKFOgI=
X-Google-Smtp-Source: AA0mqf5dJ7wlexrp0AKne+xBVwPRPn2VKPcEdcgpAZKn7ulkPPW5dlCGCHXy/YxM9FejM3LwQqvA/Q==
X-Received: by 2002:a62:1cd4:0:b0:56b:deea:72e9 with SMTP id
 c203-20020a621cd4000000b0056bdeea72e9mr3188734pfc.47.1668695587265; 
 Thu, 17 Nov 2022 06:33:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o65-20020a625a44000000b00562664d5027sm1217491pfb.61.2022.11.17.06.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 06:33:06 -0800 (PST)
Date: Thu, 17 Nov 2022 06:33:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <20221117143305.GC664755@roeck-us.net>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
 <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117123850.368213-2-krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Nov 17, 2022 at 01:38:42PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/dma-common.yaml         | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml     | 4 ++--
>  Documentation/devicetree/bindings/dma/dma-router.yaml         | 4 ++--
>  Documentation/devicetree/bindings/iio/adc/adc.yaml            | 2 +-
>  .../devicetree/bindings/media/video-interface-devices.yaml    | 2 +-
>  Documentation/devicetree/bindings/media/video-interfaces.yaml | 2 +-
>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml          | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml    | 2 +-
>  .../bindings/net/bluetooth/bluetooth-controller.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/can/can-controller.yaml | 2 +-
>  .../devicetree/bindings/net/ethernet-controller.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml       | 2 +-
>  Documentation/devicetree/bindings/net/mdio.yaml               | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml        | 2 +-
>  .../devicetree/bindings/power/reset/restart-handler.yaml      | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc.yaml                | 2 +-
>  .../devicetree/bindings/soundwire/soundwire-controller.yaml   | 2 +-
>  Documentation/devicetree/bindings/spi/spi-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml      | 2 +-

For watchdog:

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  21 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 1ab416c83c8d..d2de3d128b73 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Global Clock & Reset Controller Common Bindings
> +title: Qualcomm Global Clock & Reset Controller common parts
>  
>  maintainers:
>    - Stephen Boyd <sboyd@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
> index ad06d36af208..9b7b94fdbb0b 100644
> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/dma/dma-common.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Engine Generic Binding
> +title: DMA Engine common properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-controller.yaml b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> index 6d3727267fa8..225a141c7b5c 100644
> --- a/Documentation/devicetree/bindings/dma/dma-controller.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> @@ -4,13 +4,13 @@
>  $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Controller Generic Binding
> +title: DMA Controller common properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  allOf:
> -  - $ref: "dma-common.yaml#"
> +  - $ref: dma-common.yaml#
>  
>  # Everything else is described in the common file
>  properties:
> diff --git a/Documentation/devicetree/bindings/dma/dma-router.yaml b/Documentation/devicetree/bindings/dma/dma-router.yaml
> index 4b817f5dc30e..0ebd7bc6232b 100644
> --- a/Documentation/devicetree/bindings/dma/dma-router.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-router.yaml
> @@ -4,13 +4,13 @@
>  $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Router Generic Binding
> +title: DMA Router common properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  allOf:
> -  - $ref: "dma-common.yaml#"
> +  - $ref: dma-common.yaml#
>  
>  description:
>    DMA routers are transparent IP blocks used to route DMA request
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> index db348fcbb52c..bd0f5fae256e 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/adc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic IIO bindings for ADC channels
> +title: IIO common properties for ADC channels
>  
>  maintainers:
>    - Jonathan Cameron <jic23@kernel.org>
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index 4527f56a5a6e..bd719cb1813e 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/video-interface-devices.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common bindings for video receiver and transmitter devices
> +title: Common properties for video receiver and transmitter devices
>  
>  maintainers:
>    - Jacopo Mondi <jacopo@jmondi.org>
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 68c3b9871cf3..e8cf73794772 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/video-interfaces.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common bindings for video receiver and transmitter interface endpoints
> +title: Common properties for video receiver and transmitter interface endpoints
>  
>  maintainers:
>    - Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 802e3ca8be4d..a17f49738abd 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mmc/mmc-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MMC Controller Generic Binding
> +title: MMC Controller common properties
>  
>  maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> index 97ac3a3fbb52..20b195ef9b70 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NAND Chip and NAND Controller Generic Binding
> +title: NAND Chip and NAND Controller common properties
>  
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 359a015d4e5a..a004efc42842 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NAND Chip and NAND Controller Generic Binding
> +title: NAND Chip and NAND Controller common properties
>  
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml b/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> index 9309dc40f54f..8715adff5eaf 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/bluetooth/bluetooth-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Bluetooth Controller Generic Binding
> +title: Bluetooth Controller common properties
>  
>  maintainers:
>    - Marcel Holtmann <marcel@holtmann.org>
> diff --git a/Documentation/devicetree/bindings/net/can/can-controller.yaml b/Documentation/devicetree/bindings/net/can/can-controller.yaml
> index 1f0e98051074..3747b46cf9b6 100644
> --- a/Documentation/devicetree/bindings/net/can/can-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/can/can-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/can/can-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: CAN Controller Generic Binding
> +title: CAN Controller common properties
>  
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 3aef506fa158..26502c0f2aff 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet Controller Generic Binding
> +title: Ethernet Controller common properties
>  
>  maintainers:
>    - David S. Miller <davem@davemloft.net>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index ad808e9ce5b9..0aa1b60e78cc 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet PHY Generic Binding
> +title: Ethernet PHY common properties
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> index b5706d4e7e38..b184689dd6b2 100644
> --- a/Documentation/devicetree/bindings/net/mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/mdio.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MDIO Bus Generic Binding
> +title: MDIO Bus common properties
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> index cf9c2f7bddc2..20ac432dc683 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic OPP (Operating Performance Points) Common Binding
> +title: Generic OPP (Operating Performance Points) common parts
>  
>  maintainers:
>    - Viresh Kumar <viresh.kumar@linaro.org>
> diff --git a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> index 1f9a2aac53c0..8b52fd156d4c 100644
> --- a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/reset/restart-handler.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Restart and shutdown handler generic binding
> +title: Restart and shutdown handler common properties
>  
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index 0ec3551f12dd..00848a5a409e 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/rtc/rtc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: RTC Generic Binding
> +title: Real Time Clock common properties
>  
>  maintainers:
>    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> index 4aad121eff3f..2176033850dc 100644
> --- a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SoundWire Controller Generic Binding
> +title: SoundWire Controller common properties
>  
>  maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 01042a7f382e..6bbe073f894b 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/spi/spi-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SPI Controller Generic Binding
> +title: SPI Controller common properties
>  
>  maintainers:
>    - Mark Brown <broonie@kernel.org>
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> index e3dfb02f0ca5..6875cf1c3159 100644
> --- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/watchdog/watchdog.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Watchdog Generic Bindings
> +title: Watchdog common properties
>  
>  maintainers:
>    - Guenter Roeck <linux@roeck-us.net>
> -- 
> 2.34.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
