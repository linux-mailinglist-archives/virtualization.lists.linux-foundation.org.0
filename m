Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB926524DC
	for <lists.virtualization@lfdr.de>; Tue, 20 Dec 2022 17:47:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8816860BD8;
	Tue, 20 Dec 2022 16:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8816860BD8
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=gC92C0sr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lw0Ayd1gRTMD; Tue, 20 Dec 2022 16:47:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 459F960BF0;
	Tue, 20 Dec 2022 16:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 459F960BF0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D3C2C002D;
	Tue, 20 Dec 2022 16:47:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB926C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 16:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B71654173F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 16:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B71654173F
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=solid-run-com.20210112.gappssmtp.com
 header.i=@solid-run-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gC92C0sr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kgc-__IE8k0q
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 16:46:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6127541724
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6127541724
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 16:46:58 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id 79so8685448pgf.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Dec 2022 08:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S9MYeEEvKypc4mpQnza4+BeXfUFl1039ZqekhzchkzA=;
 b=gC92C0srqh0bzt3sZl8p90ERaBFv3q+IPEHBDqiAr8Gl6w7ssHuuRnrkIo//rjBc0+
 NMz5S9Q6XtOZi3FBx0E4TRU7spQ80ylSiU/NxJnUr/h377BcLdzO84mLlTUDTWoU/hU5
 H5dlKsnn5YiA+baudcN6twCWz2MT+yKYBKya4HsSRisHj0AI9Km4laR1jl1d96uWv4hi
 +u/Rw/vtvudGmC3fXdcTMh2BVpVP6r6DGm4X+w9i+NmCdlo/MvWp/aC+XJw8m4uKIlR7
 p5DY7y+Qy2vvXMyM3VzWeYwuraPTqOaX25iKSnMpYOl4l1BQup2SR/jySluyKyi+45pk
 cLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S9MYeEEvKypc4mpQnza4+BeXfUFl1039ZqekhzchkzA=;
 b=7U3pi7OTZPMu3cbJ8e+L8OwvvOFwYr62mA3IAXn7sTLVLrsHPfzF1yQTIL4LFXpPRc
 a7l+L9oKugrrMNWfO4JdyGXSOIVVXIkERlStXfb9uCLv/iz73Z6TSDVRKjIIzWeyRi7X
 m7rcuYL0tgxVY0NyKcDs8pwONkLJWOIPW9jqPM937p8fYCApukI0X9deVxiddULBq4+c
 TKM4BQEOvqV3O3wu8cRSnEy4YG0rmpt3OhVUMmnStSWH1SpVa7bSmjUVcfAZJGNysgYp
 o/JtYvQulVt94p3ZW53X/+0+Cd8Syqk+egbE58Kkk+9mpcm3RXwk0gTSk9IHb+67zeXz
 KV6A==
X-Gm-Message-State: ANoB5pmnkmoI4OExE5/1tBHaMJV6QM3o05Fa5rnt0eK6NBT1/JsT812h
 pjQr0pY5MZw9we4ZLW/QP9FDoR0oYbB9FpSHfSGZdg==
X-Google-Smtp-Source: AA0mqf4Ey+s+5l8jI3qYvVeBn8nM7I7QUh+8bTEBMtc1ra/8US8uJ2wgBMg7DP97/O+NPnVsIALqABdGhJE1Hd+5H6I=
X-Received: by 2002:a63:2226:0:b0:478:54e2:ecb1 with SMTP id
 i38-20020a632226000000b0047854e2ecb1mr39520530pgi.550.1671554817603; Tue, 20
 Dec 2022 08:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20221219083511.73205-1-alvaro.karsz@solid-run.com>
 <20221219083511.73205-4-alvaro.karsz@solid-run.com>
 <Y6HjpvDfIusAz2uS@dev-arch.thelio-3990X>
In-Reply-To: <Y6HjpvDfIusAz2uS@dev-arch.thelio-3990X>
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Date: Tue, 20 Dec 2022 18:46:20 +0200
Message-ID: <CAJs=3_B7WoERAiXPyvz=6d7O5rcwXMfWZJFsi_ds-OAemvfcgQ@mail.gmail.com>
Subject: Re: [PATCH 3/3 v6] virtio: vdpa: new SolidNET DPU driver.
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, llvm@lists.linux.dev,
 virtualization@lists.linux-foundation.org, bhelgaas@google.com,
 Guenter Roeck <linux@roeck-us.net>
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

Hi Nathan,

> This does not appear to be a false positive but what was the intent
> here? Should the local name variables increase their length or should
> the buffer length be reduced?

You're right, the local name variables and snprintf argument don't match.
Thanks for noticing.
I think that we should increase the name variables  to be
SNET_NAME_SIZE bytes long.

How should I proceed from here?
Should I create a new version for this patch, or should I fix it in a
follow up patch?

Thanks,
Alvaro
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
