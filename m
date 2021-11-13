Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0119544F581
	for <lists.virtualization@lfdr.de>; Sat, 13 Nov 2021 22:35:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E42B606BE;
	Sat, 13 Nov 2021 21:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wdz2AzC9kSNP; Sat, 13 Nov 2021 21:35:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4A2C760610;
	Sat, 13 Nov 2021 21:35:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 898F5C0032;
	Sat, 13 Nov 2021 21:35:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6ED67C0012
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Nov 2021 21:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49656402AA
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Nov 2021 21:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IVFkljWD2Qr
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Nov 2021 21:35:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60662402A8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Nov 2021 21:35:30 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id g17so33974842ybe.13
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Nov 2021 13:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSXJ3uMUoVuuhGKC/oVSm8bEZNFwZL8IbH9GMbqinz8=;
 b=dkaTRJTRIi4ZifpY9ICa/j7nErEweW4HufoKRtFVlWbkDqfE4ttOCtu7D5UAdvMdgM
 PWs9pViYlrbvAtah2pdcHABvOMfIs0sZlVgdDFdbzbzPz2qxb5Zc5BAnRhtc2vU8s2u4
 f96KLpJKEmp/G/mmEkgTXD+UJ8eZ7EO9ENCU8FuPCqr0uhYFEf59rUGKutg4J8bXgU0V
 fkW4Tdf4cC2QgTk941IQoGtpRpl2n+7AXMqSRU1jm6y8Or5cHZ+XM4AK6Y9OW6xlu57r
 4yTL12Ous6bHQraMdkCLQTtwlIRAY7mxzuOlGD00jNimEmG7l3bwEIUnk1bDoAA8R86T
 xFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSXJ3uMUoVuuhGKC/oVSm8bEZNFwZL8IbH9GMbqinz8=;
 b=YOXZIaQMkS7RoqWEeXRg+76HNRM+qXsC07cljKcSph6On58ObUdZjXQyNvwW+MsOUt
 ZVRZYC0zrX4ZDgs7mXm9ZXVchGUM9uRk/K7IUfiIl90COLCmi9bbRt7NLzRpUoNEp9cH
 4oyoOxG9j4IpeAZ3rRuU56gMX+JmT8gNBYfxkz4/SETe86A/h40GJT2OdEevabIQSpUp
 WrYn48NoOJfRn8ID9P1Yf0+oY3P7OZf0Ndedo8JyA7C+UUF60ijV8ch+fNRuuEKfR8ef
 NHuTFuBwsyxDL0Hy1Noy+MOuc+W0qcW2xQ+bjTopSwHnjfPIkU2zvb0t251uiauspXeb
 EM5g==
X-Gm-Message-State: AOAM530uiUHw9CQtjdhj7qDPTYLTFlOut8nhMtDWpEXgAkoj0Be8reLC
 qGpl45+/2BZxidmOaT+NZB/7OTmanzODEY2jh2s=
X-Google-Smtp-Source: ABdhPJxiyniWoK2HoBAw4yOk/7IK6gECxvBOuNXSV39rmBpeaxcPXsgNhCEjQ1hAuKN5hNQecWTsHtNVolyHlBLYX3w=
X-Received: by 2002:a25:488:: with SMTP id 130mr27073299ybe.346.1636839329289; 
 Sat, 13 Nov 2021 13:35:29 -0800 (PST)
MIME-Version: 1.0
References: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
 <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
 <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
In-Reply-To: <CAADWXX80QGk7MwZ7A-n+1+GHv=yrA0qrw-70Z=pFSEsc3UXfgQ@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sat, 13 Nov 2021 21:34:53 +0000
Message-ID: <CADVatmN7rQYhWJQao3qXz7TZxz5piN+kN4g4tV_wYC4=uxtgtA@mail.gmail.com>
Subject: Re: regression with mainline kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Verne <nverne@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
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

Hi Linus,

On Sat, Nov 13, 2021 at 5:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Hmm. This email was marked as spam for me. I see no obvious reason
> for it being marked as spam, but it happens.. ]
>
> On Thu, Nov 11, 2021 at 12:52 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > # first bad commit: [cd7f5ca33585918febe5e2f6dc090a21cfa775b0]
> > drm/virtio: implement context init: add virtio_gpu_fence_event
>
> Hmm. Judging from your automated screenshots, the login never appears.
>

<snip>

>
> HOWEVER - it has had a fix for a NULL pointer dereference in the
> meantime - can you check whether the current top of tree happens to
> work for you? Maybe your problem isn't due to "that commit does
> unnatural things", but simply due to the bug fixed in d89c0c8322ec
> ("drm/virtio: Fix NULL dereference error in virtio_gpu_poll").
>
> And if it's still broken with that commit, I'll happily revert it and
> people need to go back to the drawing board.

I sent another mail yesterday which is now at
https://lore.kernel.org/lkml/CADVatmOOzCxAgLhCu1tTz=44sgRDXds5-oMZ3V0w4f5kLCLKrw@mail.gmail.com/
I will just pase that here for you.

Last night's test on 66f4beaa6c1d worked fine. So I guess this has now
been fixed.

I have not done a bisect to see what has fixed it, but looking at the
log I think it will be that NULL pointer fix.


-- 
Regards
Sudip
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
