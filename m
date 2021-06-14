Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CA3A5EF8
	for <lists.virtualization@lfdr.de>; Mon, 14 Jun 2021 11:14:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3F3F83A7A;
	Mon, 14 Jun 2021 09:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BKmAW7Xb-IC; Mon, 14 Jun 2021 09:14:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B176483B17;
	Mon, 14 Jun 2021 09:14:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DAA6C000B;
	Mon, 14 Jun 2021 09:14:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 55D0BC000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 09:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2736040405
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 09:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0zrT8VDN71e
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 09:14:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8213403EA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 09:14:43 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id g6so10095647pfq.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KENaF6daomgz5scNtXqZjtsZnSgCNhEWOpxx4RhJ4Yw=;
 b=VJx+kBHFYVtSRtJbdOXkmjTmPuh/Y5FBlscGVnemlXQ3z5mQXpwXFHZoLmqxiGjhtw
 2svtmA0s+JTY622IJYpBay/e18FAtFK/RPkWfhhZuYCViUuRfEMXq1g4zNG5foQm83d6
 /7vAoP1BIr5vfyTnu69CjoTZcvGzNZdYn7HShgbPX3tKMk/cMTVatGYnzhWyH+/9M/jY
 igBoSRq2zPYW5clyihkJiXhHvWbACfbXXZiP8lZmeCsjJx4bzSosRmGKuiHBLWcHiIFW
 IUk0fA+Np1DkJepm6lBOeLr/0E7lWKK9O6mUo6p0CwBt8dxpY1ePRhBm3GZz9A3/kq2L
 mhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KENaF6daomgz5scNtXqZjtsZnSgCNhEWOpxx4RhJ4Yw=;
 b=WwZK3Vn5nY+V3AeV22idSx/qtdn+KZ8GAN1XNi+tNjZpbi4hrpfs6/NcDiZ6Xmsur/
 i1CADnPe92pg6hhaQnW/JEZLjz85bfbhQIikThnLEu8RNwrcItsRNre6BtaJCSeMXeYU
 VkTo7lmnXCMyw/P/CJDzfB+ukFL86z0vkOARLXi43T3JxCNo/fwDxtwtg1rxPD5+QDNw
 YFkkiALbg5n1i5Zdk61MvlB4IFQ6m9/wn3hODIvaKbEVlrLtvYqYp8kx79EOekPFiwRl
 rG6e9vwEkv4Y2Mvp06YLoY/EnQ5auBldGa1CLvCSmhMn5HNDiNMTGyPB1TSWqS6PNVER
 IMqQ==
X-Gm-Message-State: AOAM532v54LHKiD55mDXkAJ8ISUpxo/eMklFhmjAJtGduZPvcFnpz2BO
 vXSfbkjERwv81vDjxXqh2aP1Xw==
X-Google-Smtp-Source: ABdhPJzZLhEjeNg7mvi5U/yF0J7tUlxRUljd+rBr+kbJUkO3TmIBNVQe5LHoPiXGtU3JUsIhK4bRTQ==
X-Received: by 2002:a63:4653:: with SMTP id v19mr15988605pgk.240.1623662083282; 
 Mon, 14 Jun 2021 02:14:43 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id w21sm12531959pfq.143.2021.06.14.02.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 02:14:42 -0700 (PDT)
Date: Mon, 14 Jun 2021 14:44:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
Message-ID: <20210614091441.b6gaei3dgx73skvt@vireshk-i7>
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
 <0478822f-9d10-deb8-86ae-3b4ac3bb0c6c@metux.net>
 <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vf0+bCnnD3wtkrPvFbr2k3A0r3eWNp87PyksiC7euaqdw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Alistair Strachan <astrachan@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 virtualization@lists.linux-foundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, stratos-dev@op-lists.linaro.org,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 Bill Mills <bill.mills@linaro.org>
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

On 14-06-21, 11:12, Andy Shevchenko wrote:
> On Mon, Jun 14, 2021 at 11:08 AM Enrico Weigelt, metux IT consult
> <lkml@metux.net> wrote:
> >
> > On 11.06.21 10:01, Viresh Kumar wrote:
> >
> > > No, QEMU passes the raw messages to the backend daemon running in host
> > > userspace (which shares a socket with qemu). The backend understands
> > > the virtio/vhost protocols and so won't be required to change at all
> > > if we move from Qemu to something else. And that's what we (Linaro)
> > > are looking to do here with Project Stratos.
> >
> > Note that this is completely different from my approach that I've posted
> > in autumn last year. Viresh's protocol hasn't much in common with mine.
> 
> That's why we have a thing called standard. And AFAIU virtio API/ABIs
> should be officially registered and standardized.

Yes and here is the latest version (which is based on the work done by
Enrico earlier). It isn't accepted yet and is under review.

https://lists.oasis-open.org/archives/virtio-comment/202106/msg00022.html

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
