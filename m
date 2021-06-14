Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C363A5C73
	for <lists.virtualization@lfdr.de>; Mon, 14 Jun 2021 07:26:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77ED76076F;
	Mon, 14 Jun 2021 05:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTwvUUx400M1; Mon, 14 Jun 2021 05:26:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 48CD96079C;
	Mon, 14 Jun 2021 05:26:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2EB4C0024;
	Mon, 14 Jun 2021 05:26:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5214DC000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 05:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F2794033A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 05:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ptwCaaxzhQx8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 05:26:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBD4140338
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 05:26:22 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id w31so5202904pga.6
 for <virtualization@lists.linux-foundation.org>;
 Sun, 13 Jun 2021 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SKkIWihex8iN4vHyV2ULlQRHidyqRPcEAHjFrEdw0eo=;
 b=Ztkc32hhSlxDlYO/aubdvIkMY/qTaOmjdAcpUSwoddC36oiCXbW0t6Fgj7dqeMLjGr
 GKKydNoa0tuWwuRm9W2Oku1KuwQbuQOU2vGNe8iqT5qZpembeOWkm6pzrzcJ4UtTfT3O
 2e868LLS7FN9kx0eyKZAZvbNfNgLUlJuXj7X9NiAHHdoSF54ImmSfOU4XZRvkkb4q+zS
 4n3axSTfriXtldwQE7uH4sqiNUTf1F6IEBtIlG+THkwuA/uo2Dwz3YbQDLu64X6E4IsQ
 KnRwXOZqqYRo41Ey01DOqng25fgXBzlcHhBQhLIZGYVo/TgWDOPU1MK/3+ddM/Lr4vPs
 Pwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SKkIWihex8iN4vHyV2ULlQRHidyqRPcEAHjFrEdw0eo=;
 b=MNAhuMRcQK6fufNH0eBz7W060xLbmqXXRX7d1RiA2GJYQhd32qG3vjfuzQyZLuMxU3
 JokUe2eM7bpEfg/0ybvqA6Q5wUZFvQ9+ByV0Jec9/xgk0R8lo4uyVRbqsp/i2QXE1YVc
 6NxNqSfNCZE+4RTHCZDeaIes/bXWFxRAZ/5BF1PamQGnt+TxyemF5avONnw88CuKYz6t
 AZA5+J6lwaXTkXOI6ZR+sKoHerjBh5dHazxqQbJ0k42jNr+kDhuXv4AOTgjNS5JzXgCq
 Wnz5gJU3W8cbin1ucBR0fVuptYAVgV64/OP78R2PsAdAkUeW18/brp6eEHKEbeGi18+9
 aqWg==
X-Gm-Message-State: AOAM530ftvp5D4otCgiysJOV7GGNoVd7Z9cPX1dvI6OhlS9L9z6RL6gy
 BuhNqik0A1uEwzog2FUALoIWDw==
X-Google-Smtp-Source: ABdhPJxQbwYoqWhTfdLy3aAMNginzsjm12had6Yj2Ufq28W5WByJrv24ex9t825/WyIyYjOTicJLzg==
X-Received: by 2002:a62:87c9:0:b029:2ea:572c:e4b1 with SMTP id
 i192-20020a6287c90000b02902ea572ce4b1mr20241936pfe.34.1623648381981; 
 Sun, 13 Jun 2021 22:26:21 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id gf10sm10515354pjb.35.2021.06.13.22.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 22:26:20 -0700 (PDT)
Date: Mon, 14 Jun 2021 10:56:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@linaro.org>
Subject: Re: [Stratos-dev] [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210614052617.jfdgunichi73eup5@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <01000179f5da7763-2ea817c6-e176-423a-952e-de02443f71e2-000000@email.amazonses.com>
 <YMJOk6RWuztRNBXO@myrica>
 <01000179f9276678-ae2bb25f-4c0c-4176-b906-650c585b9753-000000@email.amazonses.com>
 <CAK8P3a2-bXfDcPymMct2aUXs2m+YgbKdmAatMMs9tnc+HjS_xQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2-bXfDcPymMct2aUXs2m+YgbKdmAatMMs9tnc+HjS_xQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>,
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

On 11-06-21, 10:34, Arnd Bergmann wrote:
> Extraneous __packed annotations do cause real problems:
> 
> - On architectures without hardware unaligned accesses, the compiler is
>   forced to emit byte load/store instructions, which is slower and breaks
>   atomic updates to shared variables
> 
> - If a function takes a pointer of a packed struct member, and passes that
>   pointer to a function that expects a regular aligned pointer, you
> get undefined
>   behavior. Newer compilers produce a warning if you do that (we currently
>   shut up that warning because there are many false positives in the kernel),
>   but you can also run into CPU exceptions or broken code even on CPUs
>   that do support unaligned accesses when the variable ends up being
>   actually unaligned (as you just told the compiler that it is allowed to do).

I understand that these problems will happen if the structure isn't
aligned, but in this case the structure is aligned properly, just that
we are explicitly telling the compiler to not add any padding (it
won't have added any in here). Is it still harmful ?

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
