Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3522C3E5454
	for <lists.virtualization@lfdr.de>; Tue, 10 Aug 2021 09:35:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5EC860828;
	Tue, 10 Aug 2021 07:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6q8axwsJQSGr; Tue, 10 Aug 2021 07:35:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D096E60823;
	Tue, 10 Aug 2021 07:35:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21509C000E;
	Tue, 10 Aug 2021 07:35:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E163C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 07:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 173DA6081E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 07:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VWDEeUjKAPaC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 07:35:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13AB6607D1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 07:35:16 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id nt11so8643848pjb.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7EzgN9g1XtwnyFgpdk0FQ59crTERL3asDSmTaguV9xw=;
 b=AuOgsblc4N+hr+jtlgYsCxhbLE8O+YSNlnuJH9zDj9JMZc+kCmcwFRTv+5/YNfgvn4
 +5kWdadLfVcSyV9nk99Q/4jdRKRY1W82ZPXDnYkr1oPJaxgjZf1VkVPKX9nmDLal5UXl
 Er6+ASCwLQwR8GqfcCyBbs1KpKrPfmGtqdtO8DEUZF5LrqxJ0kAgyNSUIiD+tpL4XeZ1
 Hx0cFNAI0y5mhD5XjHiJLiVktD6IJ/wTjTOtxivYNqN4gk9xFGuvecZnUhiN4Ihq2k9u
 msU5qKLy0QZGJwI07XEMoLHXzRraVZZKXO3Md+Dj442FU+8NSo0/cUSyyYpnM6n2pXc3
 acAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7EzgN9g1XtwnyFgpdk0FQ59crTERL3asDSmTaguV9xw=;
 b=h0IeAlOovygRgpA4EXI2vsl3vikqhaiqjg3R5JnTApoNkvPna4aDjy0HKc398o3i4m
 mmX5hARafikRSkwBoRTYqkEcV9M+6KYJvWkGiR65k4SJA2pxXtt9XoVRFHwx/0IOFBEn
 NLl4gc1dYvsyAVCAqTGSHwhuMcwUSAU+nggylQMQF/HFFmwBt4Jvz3aia6p33/cK6kVe
 Zzj0GNzVDwmzbIypGgn9uMDP4edBHmsLic0R2MWPTjVuaH+4fpBpuA9+eAmUizUmHCQa
 N9mufZRTmoF5Z9EsohC8Lp1F5DsDc2JvFWsKAJScWf5ig8j/+vljQZpm4Xpz+0GJQxnI
 JCww==
X-Gm-Message-State: AOAM530JuS+Qwen1AXhYpgG2EfvGwtywBFh+rg9Z4vbzCwsnL/w/B9Qo
 jab211FrZqZrMKCmyPzdji2x6Q==
X-Google-Smtp-Source: ABdhPJyTE+WX5eApTwQ/BWrztdRfSU9QZ8XJbeCuJSJ38AXbx5SetupsHR5upHroaSJcA82ydwu+0g==
X-Received: by 2002:a62:6307:0:b029:3ca:f9cc:b1b8 with SMTP id
 x7-20020a6263070000b02903caf9ccb1b8mr11838858pfb.39.1628580916410; 
 Tue, 10 Aug 2021 00:35:16 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id lk17sm1854172pjb.37.2021.08.10.00.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 00:35:15 -0700 (PDT)
Date: Tue, 10 Aug 2021 13:05:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [Stratos-dev] [PATCH V4 2/2] gpio: virtio: Add IRQ support
Message-ID: <20210810073512.5n5vsjvvurgdemk6@vireshk-i7>
References: <0100017b1610f711-c53c79f2-9e28-4c45-bb42-8db09688b18e-000000@email.amazonses.com>
 <CAK8P3a0DWkfQcZpmyfKcdNt1MHf8ha6a9L2LmLt1Tv-j0HDr3w@mail.gmail.com>
 <20210805124922.j7lts7tfmm4t2kpf@vireshk-i7>
 <CAK8P3a0kbmPLGCBrjAv7-dW=JWq-pdSBeGUHCxUFmMKvKhCg7w@mail.gmail.com>
 <0100017b1a6c0a05-e41dc16c-b326-4017-a63d-a24a6c1fde70-000000@email.amazonses.com>
 <CAK8P3a2rrueXJHZxuiiShgVmLD916RaxW7xQHHjQXNFkM3Fpvg@mail.gmail.com>
 <20210809073020.y6ruibdm37xnx7hg@vireshk-i7>
 <CAK8P3a3TabswETDAUec-2rbiNBk_K48-UdpTA5Ckvu5ogOyHjQ@mail.gmail.com>
 <0100017b2a85eaf8-08b905fc-89f7-43a4-857e-070ca9691ce1-000000@email.amazonses.com>
 <CAK8P3a0L3Wg8a8ips97KQ4OskGCZp-5i=LUV0DqcVq__wrEZAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0L3Wg8a8ips97KQ4OskGCZp-5i=LUV0DqcVq__wrEZAw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Stratos Mailing List <stratos-dev@op-lists.linaro.org>
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

On 09-08-21, 13:19, Arnd Bergmann wrote:
> I don't see anything wrong with this version,

Great.

> but let's see what
> Marc thinks. I expect that he can still poke some holes in it, or
> at least find some simplifications.

Right, though I may resend the patches properly first to make it less
confusing.

> I was slightly surprised at the relation between the disabled and
> masked states, where 'disable' always implies 'mask' and
> 'enable' always implies 'unmask', but I don't actually know how
> those two are actually defined in the irqchip code in Linux, so
> I assume you did this correctly.

I did have a look at the irq-core, but didn't go in real depth. I
rather saw how stuff happens at the driver's end.

- On setup-irq, the core only calls enable() and not unmask().
- On interrupt, the core calls mask(), followed by unmask() (which can
  be delayed for threaded irqs).
- On disable_irq(), the core only calls disable().
- On enable_irq(), the core only calls enable().

And so I ended up at this version :)

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
