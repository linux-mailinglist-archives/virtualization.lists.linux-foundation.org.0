Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A49A544322A
	for <lists.virtualization@lfdr.de>; Tue,  2 Nov 2021 16:59:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2023380D44;
	Tue,  2 Nov 2021 15:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4e3bCdnvgc5V; Tue,  2 Nov 2021 15:59:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F1D0C80D41;
	Tue,  2 Nov 2021 15:59:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77803C0036;
	Tue,  2 Nov 2021 15:59:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7225EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Nov 2021 15:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518DC400EB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Nov 2021 15:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fmu3jMI4593
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Nov 2021 15:59:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C591400D0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Nov 2021 15:59:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o8so5814431edc.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Nov 2021 08:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=82gcyYi21JR2yl5HnQJPNTUGk95bSOyQQAZSvB97oV4=;
 b=mqPeGtTTFM8RhF4E4WUZJM/qs5mKYfvHn6ixlFp9fulZ9XJdec+gCYvWZzF44Q0P9Z
 yqv/cOuua58Y3vAJHKGnVfq6wUgatrSjw0j5ZaT/YJ0Jo04LQfnEYB08CgZYU9dTBNMl
 rXX6ESNW29DHkRJ/uIX7y55rt7qTayDo98CiG5cnv+ZYZhtku8aLNOLoX+00NXKreA8O
 R9iU161Z0maGb3CsNZ0aLkcRqYoKd3KNKW0gG5GE1BL8YYtVq+kRxsGm8871B9m/QHMi
 HvZJd2zunffq5oh/zZ5Zz2IS9LzaTBuJUbp2uu4m8uCIJ0bB2XmLwkUwPGk/ZQ+SR1Cj
 XsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=82gcyYi21JR2yl5HnQJPNTUGk95bSOyQQAZSvB97oV4=;
 b=YMS283n69yQ+PJqkR8aaoEW46Qh/Ul+BAipeKWKK9qz2jOpaaOeTZqfvOTp9NqQBAc
 lxMfN9clP4nRAu4cv4znvg0AKD1HbPKPTc9Sbe5XQyi0n0M3A9ImHapRDa7M4Pk/TEMv
 0z3NAYucJCiexhbMBp3uaQlzM8aLlPRnAyHXe+0mhLHODQlMqzn7Q0YdQ0LYX/xLQI5/
 ybzVDBi5MtBcSoK6xzaugLJUxPwh6vw8TTBlgAREWY21su2Hdc8ADYsfPfpCXZXl7PeG
 A2EwN2SSYn1i2r1hDA4JiRP+N0l+NrY2hRnXj9X56fT3BvFY+ohuC+YBej3C/PEESy3E
 j4QA==
X-Gm-Message-State: AOAM532AX00F7IjI2UMP/mkP8P2x+GKRzgscZRNdP14s9gMMNeCgGpP2
 19oDmTPqGvKe/OLf6ruh8Zpk4fokUYERSuI12fRJug08
X-Google-Smtp-Source: ABdhPJwcgTlfHqBGlrJhLQL+x+bR7sLLA1z9C+zICT29lLaDMWLwZjcVUPOSbPWd4+cMRBvtppuC9V5ITdGjcrdeb+k=
X-Received: by 2002:a17:906:180a:: with SMTP id
 v10mr45948349eje.112.1635868746685; 
 Tue, 02 Nov 2021 08:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211102113139.154140-1-maksym.wezdecki@collabora.com>
 <20211102130308.2s64ghmic5nhj6vu@sirius.home.kraxel.org>
In-Reply-To: <20211102130308.2s64ghmic5nhj6vu@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 2 Nov 2021 08:58:55 -0700
Message-ID: <CAPaKu7T9-KmmDwNRFzQWM3jH4h-xUwjtfWays20z24dVvROoHw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: delay pinning the pages till first use
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, mwezdeck <maksym.wezdecki@collabora.co.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
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

On Tue, Nov 2, 2021 at 6:07 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Nov 02, 2021 at 12:31:39PM +0100, Maksym Wezdecki wrote:
> > From: mwezdeck <maksym.wezdecki@collabora.co.uk>
> >
> > The idea behind the commit:
> >   1. not pin the pages during resource_create ioctl
> >   2. pin the pages on the first use during:
> >       - transfer_*_host ioctl
> >         - map ioctl
>
> i.e. basically lazy pinning.  Approach looks sane to me.
>
> >   3. introduce new ioctl for pinning pages on demand
>
> What is the use case for this ioctl?
> In any case this should be a separate patch.

Lazy pinning can be a nice optimization that userspace does not
necessarily need to know about.  This patch however skips pinning for
execbuffer ioctl and introduces a new pin ioctl instead.  That is a
red flag.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
