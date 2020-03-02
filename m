Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95A1766CC
	for <lists.virtualization@lfdr.de>; Mon,  2 Mar 2020 23:21:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4BEE8204C6;
	Mon,  2 Mar 2020 22:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Njpa-vQOFq5l; Mon,  2 Mar 2020 22:21:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E258204C0;
	Mon,  2 Mar 2020 22:21:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41351C013E;
	Mon,  2 Mar 2020 22:21:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DCF4C013E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 467BC87020
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TnjMZEl2YQtN
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:21:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C3DB86FF9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 22:21:40 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id c129so306763vkh.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Mar 2020 14:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/ZXePw08jIq7OBB1YUZ7Aye4n93ozY+7PwFaAkmQrs=;
 b=e0zMyqz+F+6zRjoWtD/mmEgf34GKDHSCQlnC/uFR2APNtgaNTLYdn/QIN8teuoIAIM
 rff9jQj/X45gNaRymYGKIMomIBf61QRu0cSWCxImAgLP2bGNh7kxVBOw9RxTu3c/ObV9
 w6VlRCQMySed3qvqkTtidujVwrsaEQIQO2ye2MqYmi/E97frP8ZV4KBO/a6zgm7b5gDy
 fi7YE9kwimD1YdzUI/ow0fLyrYA4zPh63n6XoJUb7TrsyOTHqtwjnkvWjMfi560AYAe1
 nhM+BOAVhrxNIhnQoGdJw164oDxtFr1/SVpWWMI74s4/mGAfgAiiY3xH+RUsO/p6kIBU
 d1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/ZXePw08jIq7OBB1YUZ7Aye4n93ozY+7PwFaAkmQrs=;
 b=Yf0EB/vsKlp8GDPPfKyfRN75a0QpUquPFQxk6tkGBcEWmw7b7LFrl7oCUypW8H0LTw
 MXjS3wjhQIw7jtNKj/3JCgZ0Yo1uINGg+1Fnbdun/G/4AUAuogZvpp+GJaSQ7ewAUyRQ
 UJNdTbGgxGclzuH2QPgVBbodJGfuy8ahYi2nFYcdHRgq9KOM0VhhsXNfXzoAYBn75hgw
 +cSPoQ5GyqRujQik98X0PxPNIcX/6UIph9fOZI/FSZ9gHZGTFAjJDnBd/veWN+oZPAdG
 C+OOdNc9VruiSIzNt5b6M+3LGnwO+m6rQOgxkwe7pxgIIdsNYysyz84cqjsPweEGXbhT
 +cJg==
X-Gm-Message-State: ANhLgQ1gBT4vwaA3QchZ9Dhf0zMcqP1r2OXthNQC8/gugIKkHsPXKwIB
 q75LnJX3Ebz0QufgTXv1ZaLRCYLuKX+F4HZtHjk=
X-Google-Smtp-Source: ADFU+vtgTWEvlHrNTmJtHyKDJof9QYg21GqyVkzf3O6lrAwFQuvxk7BBzUe3gFp1CedXXmdr/MQo9bYXpNXIavJAaGY=
X-Received: by 2002:a1f:284:: with SMTP id 126mr151121vkc.16.1583187699557;
 Mon, 02 Mar 2020 14:21:39 -0800 (PST)
MIME-Version: 1.0
References: <20200227210454.18217-1-alistair.francis@wdc.com>
 <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
In-Reply-To: <20200228095748.uu4sqkz6y477eabc@sirius.home.kraxel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 2 Mar 2020 14:14:02 -0800
Message-ID: <CAKmqyKOTjyRL9vxZrZW8Q+yBM0n-Nw-o-Cn3dUDDfAAa7Nswrg@mail.gmail.com>
Subject: Re: [PATCH] drm/bochs: Remove vga write
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: airlied@linux.ie, Khem Raj <raj.khem@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Alistair Francis <alistair.francis@wdc.com>, daniel@ffwll.ch
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

On Fri, Feb 28, 2020 at 1:57 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Thu, Feb 27, 2020 at 01:04:54PM -0800, Alistair Francis wrote:
> > The QEMU model for the Bochs display has no VGA memory section at offset
> > 0x400 [1]. By writing to this register Linux can create a write to
> > unassigned memory which depending on machine and architecture can result
> > in a store fault.
> >
> > I don't see any reference to this address at OSDev [2] or in the Bochs
> > source code.
> >
> > Removing this write still allows graphics to work inside QEMU with
> > the bochs-display.
>
> It's not that simple.  The driver also handles the qemu stdvga (-device
> VGA, -device secondary-vga) which *does* need the vga port write.
> There is no way for the guest to figure whenever the device is
> secondary-vga or bochs-display.
>
> So how about fixing things on the host side?  Does qemu patch below
> help?

That patch looks like it will fix the problem, but it doesn't seem
like the correct fix. I would rather avoid adding a large chunk of
dummy I/O to handle the two devices.

>
> Maybe another possible approach is to enable/disable vga access per
> arch.  On x86 this doesn't cause any problems.  I guess you are on
> risc-v?

I would prefer this option. I do see this on RISC-V, but I suspect the
issue will appear on other architectures (although how they handle I/O
failures in QEMU is a different story).

Can I just do the VGA write if x86?

Alistair

>
> cheers,
>   Gerd
>
> diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
> index 62085f9fc063..e93e838243b8 100644
> --- a/hw/display/bochs-display.c
> +++ b/hw/display/bochs-display.c
> @@ -151,6 +151,26 @@ static const MemoryRegionOps bochs_display_qext_ops = {
>      .endianness = DEVICE_LITTLE_ENDIAN,
>  };
>
> +static uint64_t dummy_read(void *ptr, hwaddr addr, unsigned size)
> +{
> +    return -1;
> +}
> +
> +static void dummy_write(void *ptr, hwaddr addr,
> +                        uint64_t val, unsigned size)
> +{
> +}
> +
> +static const MemoryRegionOps dummy_ops = {
> +    .read = dummy_read,
> +    .write = dummy_write,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +    .impl.min_access_size = 1,
> +    .impl.max_access_size = 1,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
>  static int bochs_display_get_mode(BochsDisplayState *s,
>                                     BochsDisplayMode *mode)
>  {
> @@ -284,8 +304,8 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
>      memory_region_init_io(&s->qext, obj, &bochs_display_qext_ops, s,
>                            "qemu extended regs", PCI_VGA_QEXT_SIZE);
>
> -    memory_region_init(&s->mmio, obj, "bochs-display-mmio",
> -                       PCI_VGA_MMIO_SIZE);
> +    memory_region_init_io(&s->mmio, obj, &dummy_ops, NULL,
> +                          "bochs-display-mmio", PCI_VGA_MMIO_SIZE);
>      memory_region_add_subregion(&s->mmio, PCI_VGA_BOCHS_OFFSET, &s->vbe);
>      memory_region_add_subregion(&s->mmio, PCI_VGA_QEXT_OFFSET, &s->qext);
>
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
