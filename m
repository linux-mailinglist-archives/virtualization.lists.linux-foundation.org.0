Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 922C7CDD3D
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 10:27:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E5959B3E;
	Mon,  7 Oct 2019 08:27:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8B9ACACC;
	Mon,  7 Oct 2019 08:27:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 23A965F4;
	Mon,  7 Oct 2019 08:27:02 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 89so10198472oth.13;
	Mon, 07 Oct 2019 01:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VKymJxaLp2SF18G9ExdMOsAdXsmgBDVfrU/If3JZGxo=;
	b=BktjRr1f69lGtbmFYmyvwdSNpen4WheGVasO5sA6JmgwtDW21qo0AI/zoOpBCP/lpF
	4Xe34X1JR18TYc+aGdiBiPv3qVavu4H3Wmzrx5Yo56cAd0HTCyvj3wXL8y2cI60TQaNP
	xRbm5Ztb6qjuQJqBSFFoEqvh9WZz6/Gp5YSx18hGdteiHZyX0g0YSLmSoynuK/Y73oHz
	lFLDWVyyosvAnXAuAaqAdNHykGp9OU+yesAjnvj0TBq3vWmpsl5KxzdTgXnzbgwoivOn
	vd4ghj8DsQGN4Eal+mP70Hw0OkYt3QQ5vCQV4hEH9pEd19uzT22/Fgtek//huVk1d/XM
	6mnQ==
X-Gm-Message-State: APjAAAVRGFkJpYSBVcWBpLOG2xa3KZ3WPXx3Y6MZJJc70olduZp1uRaK
	VAOaxyPy1pC0A4KhRJQ6+/WenEMekp+V+FHzvvI=
X-Google-Smtp-Source: APXvYqxEOkV8nJCSllSqxdkQVypo90wcNgBvYDBNSKRgpoLJCvXTnmOdSLlUAojqzzfR9rCgupdlwodIFF5kpYpgt28=
X-Received: by 2002:a9d:17e6:: with SMTP id j93mr20339687otj.297.1570436821298;
	Mon, 07 Oct 2019 01:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20191004145544.5066-1-krzk@kernel.org>
	<20191004145544.5066-3-krzk@kernel.org>
In-Reply-To: <20191004145544.5066-3-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2019 10:26:49 +0200
Message-ID: <CAMuHMdW0DSujexoGq4CJAYP40DvMcigk08aEnyQ72haY6jds5Q@mail.gmail.com>
Subject: Re: [RESEND TRIVIAL 3/3] treewide: arch: Fix Kconfig indentation
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B,
	FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	linux-efi <linux-efi@vger.kernel.org>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	linux-iio@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>,
	"open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
	<linux-remoteproc@vger.kernel.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	platform-driver-x86@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, keyrings@vger.kernel.org,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	Linux I2C <linux-i2c@vger.kernel.org>, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	ac100@lists.launchpad.net, linux-rtc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, scsi <linux-scsi@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, esc.storagedev@microsemi.com,
	linux-security-module@vger.kernel.org,
	linux-clk <linux-clk@vger.kernel.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
	linux-input@vger.kernel.org, xen-devel@lists.xenproject.org,
	virtualization@lists.linux-foundation.org,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	"moderated list:H8/300 ARCHITECTURE"
	<uclinux-h8-devel@lists.sourceforge.jp>,
	driverdevel <devel@driverdev.osuosl.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-um@lists.infradead.org, linux-block@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Openrisc <openrisc@lists.librecores.org>,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net,
	"open list:TI ETHERNET SWITCH DRIVER \(CPSW\)"
	<linux-omap@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-raid@vger.kernel.org, Jiri Kosina <trivial@kernel.org>,
	Linux MM <linux-mm@kvack.org>, netdev <netdev@vger.kernel.org>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-spi <linux-spi@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
	linux-integrity <linux-integrity@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Oct 4, 2019 at 4:57 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>     $ sed -e 's/^        /\t/' -i */Kconfig
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

>  arch/m68k/Kconfig.bus                  |  2 +-
>  arch/m68k/Kconfig.debug                | 16 ++++++++--------
>  arch/m68k/Kconfig.machine              |  8 ++++----

For m68k:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
