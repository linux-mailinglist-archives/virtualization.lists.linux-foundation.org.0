Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2FF174D62
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 13:55:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C17BD84FFF;
	Sun,  1 Mar 2020 12:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CZwvOs-Rh3R; Sun,  1 Mar 2020 12:55:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A499784FDD;
	Sun,  1 Mar 2020 12:55:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84910C013E;
	Sun,  1 Mar 2020 12:55:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96EE5C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8144D20358
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:55:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6IrQbjIhT54T
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:55:12 +0000 (UTC)
X-Greylist: delayed 00:11:51 by SQLgrey-1.7.6
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
 [209.85.161.65])
 by silver.osuosl.org (Postfix) with ESMTPS id ED75C20354
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 12:55:11 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id n127so8262192ywd.9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 04:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MIDZBL/JubUTLDASvC33U4QhLhN6MoqjnwZUylwb8cw=;
 b=teK5GctHOQt1X33VEx/tISYvILK02uDfBuM+tRdPVoZ0nFHrzbfpSWAhwv5ruIDMYr
 Q7qIcIvJgjXZGYTbyws4OmTf4fydt2oyePnTHl5P3rL9sKIQiUn5dch4K9lX+2QrMwDU
 /q/rZGNW2kRcwpejBpM9vz7lCKTXnUE4yV72Mh6JfHd9/oafsIhZ7tWgWA68N9bbX8SM
 yaChuzxXAt7ZDVfSqARYTs//u8hHyEfMKjaHDL4jM/Urn/Jbb96S32RV8TxDlH7HjqYU
 b3LZhCTLBVOFem92Qr1NkXztpaTKhyqauR6obNaqMaNtsNVmp8nAW2tJxRoSWNrsRHw1
 3j3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MIDZBL/JubUTLDASvC33U4QhLhN6MoqjnwZUylwb8cw=;
 b=C8GrzUcFxMBQJOMSyy86nHshSxr8YufsV4NQePGqBtyKA70PPeJVHJZNJPctP9tBxY
 NQ3CXQuQy/EowW1GaErKq+JrPtNudBlYaDefSx68bPm6XHzToL7Mlp4wUOEW92u1Smvb
 hoxBwj0l/j1wYYt0ml/qUCs2szwAvVYqJHvXs5m/bEW+wjSJsXIgfviRPIm8CoUNfBL9
 ditxKt3koVkozZDo6SUrRXhO8c03cxYEUs3OqRwfhSRPFvUcKIwGStKV0M2CzElg8T4w
 CKNf6Dk8kLgqpYpmGt/4rrTD0ld1ahv+12MRB3ZG55SbLoeEUuL+lLLtn73KKkjNvM6Y
 LQMQ==
X-Gm-Message-State: APjAAAUwlnxB7+l2ItriESDR7ROGxf2TS1iCzVrUpcUDe5HNWF/pnSWC
 FgImU+q8oJZ4PEA7Mx+Nh7XITRyDrqWcvthKIGkJQa/C
X-Google-Smtp-Source: APXvYqzI1NW4Tg29e6sknihoF0t+aa9nEhOTzOlawQre1//WHvyJJE/jbcuHKqHl1EsMixJJUTg2mNf05P6HueSGe0Q=
X-Received: by 2002:a0d:fe83:: with SMTP id o125mr7198532ywf.56.1583066872110; 
 Sun, 01 Mar 2020 04:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20200301110733.20197-1-yuri.benditovich@daynix.com>
 <20200301063121-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200301063121-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun, 1 Mar 2020 14:47:41 +0200
Message-ID: <CAOEp5Ofzz2CrkbBoPsOAGDVdVJZ07nzH0Usv5h6a96p8+YknwA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] virtio-net: introduce features defined in the spec
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yan Vugenfirer <yan@daynix.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Sun, Mar 1, 2020 at 1:32 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sun, Mar 01, 2020 at 01:07:30PM +0200, Yuri Benditovich wrote:
> > This series introduce virtio-net features VIRTIO_NET_F_RSC_EXT,
> > VIRTIO_NET_F_RSS and VIRTIO_NET_F_HASH_REPORT.
> >
> > Changes from v1:
> > __virtio -> __le
> > maximal -> maximum
> > minor style fixes
>
>
> Looks good to me - sent a bit of consmetics.
>
> But as any virtio UAPI change, please CC virtio-dev as virtio TC maintains the
> interface. Thanks!

Probably 'virtio-dev' should be added to maintainers file.

>
> > Yuri Benditovich (3):
> >   virtio-net: Introduce extended RSC feature
> >   virtio-net: Introduce RSS receive steering feature
> >   virtio-net: Introduce hash report feature
> >
> >  include/uapi/linux/virtio_net.h | 90 +++++++++++++++++++++++++++++++--
> >  1 file changed, 86 insertions(+), 4 deletions(-)
> >
> > --
> > 2.17.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
