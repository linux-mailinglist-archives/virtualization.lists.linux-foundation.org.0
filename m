Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 674773A89EC
	for <lists.virtualization@lfdr.de>; Tue, 15 Jun 2021 22:03:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 137466059B;
	Tue, 15 Jun 2021 20:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULzK_EWngCYA; Tue, 15 Jun 2021 20:03:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DA4B860606;
	Tue, 15 Jun 2021 20:03:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6411EC0022;
	Tue, 15 Jun 2021 20:03:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A55E7C000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 20:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94BF183434
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 20:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z29IC1k5pqLW
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 20:03:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7185782864
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 20:03:35 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s22so406665ljg.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 13:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H1Hrr3f9fv/XXkIZU+MLNVsm0U18tLCQbKfp3yrHWT8=;
 b=YiMM+MC6BQRVEChXL7+wtKkdr+F4h4WDN6eVeYv2RufmZ+UMBbJzKxUsZlajx1uZxz
 N75NUvGyE2GCltiGwjgLOsN1J1rReAzyxNOC5kS4p7QwKajkJg0sQZksW8FyFLfhqAzv
 JCAWSROzB3Vzwfs4yFLokKeJV7QESCayhuTLMpS90sJKbPcITclklyVP6DwdjbC1c32D
 krls5wanQmpzZ87ZUL92g7VFZ1Td0USLzblVpGCmWbaRQdeo9YtyOXLwIzrkjnxi+Kg9
 4X003EuuClFQUEv8qZ965MraCpA41G2aX+ZqY19L60T5/ousdJhPqTK8E0ok2f4cQpMk
 yhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H1Hrr3f9fv/XXkIZU+MLNVsm0U18tLCQbKfp3yrHWT8=;
 b=n/+RqlOsT3mBbfCsxdiiTy2o5y7Vb3X/9eDQLN+xcFj99nCLyZmZjXciv93CmK3WjG
 0FIHdK4tNrF5KisY7HkXjQIkfRP6S/xci5QLOwYZVhttI22c0tdxrjpAjsv21O8ojCJ6
 86VF2EpQ+KvnOM/sW8IO4rE3C9FBO6clivZLCOY7annWu4uLPEGRow5+LwBqKJBYwvgN
 59I8zEFY7UjTBKi6RAW5ntSV/BzAYX96Ca+WBeU/kP1Akg0w90RIMehZo8lBApxK/Zdo
 kk3372AFlhSnnKOOJUAsni/0mZlXokp1JBWKFVvHR6gNQoh0kwphR5tpItDQPr3tje+b
 4G9Q==
X-Gm-Message-State: AOAM531GeyAnfDc/ohoqyThPmEJMTGpu/jAh/6JnjkUxy0x4h/K2ND8x
 9cujE/CMnqppxVqYceE7PotjCOhXacIJHSAv2AFV0w==
X-Google-Smtp-Source: ABdhPJz9cEbar1mnjekAl0Ye6iZkMzcSVk6zFhLVSrlKgTFdwFsO1h2OGqDzrM3sDl4B3S7MrPN8jgt+/57igMwVU/M=
X-Received: by 2002:a2e:7811:: with SMTP id t17mr1187761ljc.368.1623787413246; 
 Tue, 15 Jun 2021 13:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623326176.git.viresh.kumar@linaro.org>
 <10442926ae8a65f716bfc23f32339a6b35e51d5a.1623326176.git.viresh.kumar@linaro.org>
 <CACRpkdZV2v2S5z7CZf_8DV=At9-oPSj7RYFH78hWy3ZX37QnDQ@mail.gmail.com>
 <20210611035623.z4f2ynumzozigqnv@vireshk-i7>
 <CAMuHMdVrtSnFpPbB0P3Wxqm1D6vU1_cnh3ypsZJRNF6ueKdAsw@mail.gmail.com>
 <20210611080122.tlkidv6bowuka6fw@vireshk-i7>
 <CAMuHMdVL4VH09ixPcpqqokNJeYd68Th2Y6Lz4PZTF7h06OOBGw@mail.gmail.com>
 <20210615111551.7tcz7teqp4olhodf@vireshk-i7>
In-Reply-To: <20210615111551.7tcz7teqp4olhodf@vireshk-i7>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Jun 2021 22:03:21 +0200
Message-ID: <CACRpkdbyybnxP9p3Jh2TbJMhK+kfLyed-YyrZq9JbOqu1csmww@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] gpio: Add virtio-gpio driver
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Alistair Strachan <astrachan@google.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux-foundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, Bill Mills <bill.mills@linaro.org>,
 stratos-dev@op-lists.linaro.org
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

On Tue, Jun 15, 2021 at 1:15 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> I am now wondering how interrupts can be made to work here. Do you
> have anything in mind for that ?

The aggregator does not aggregate interrupts only lines for now.

> GPIO sysfs already supports interrupts, (...)

I hope that doesn't make you tempted to use sysfs to get interrupts,
those are awful, they use sysfs_notify_dirent() which means that
if two IRQs happen in  fast succession you will miss one of them
and think it was only one.

The GPIO character device supports low latency events forwarding
interrupts to userspace including QEMU & similar, timestamps the
events as close in time as possible to when they actually happen
(which is necessary for any kind of industrial control) and will never
miss an event if the hardware can register it. See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/gpio/gpio-event-mon.c

Yours,
Linus Walleij
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
