Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 051EE31AE7F
	for <lists.virtualization@lfdr.de>; Sun, 14 Feb 2021 00:26:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1806786BC2;
	Sat, 13 Feb 2021 23:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Erro9T1PordX; Sat, 13 Feb 2021 23:26:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7990B86BB1;
	Sat, 13 Feb 2021 23:26:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 453F6C013A;
	Sat, 13 Feb 2021 23:26:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DFE35C013A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Feb 2021 23:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C441E6F4D9
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Feb 2021 23:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1bJwh19Ipqd
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Feb 2021 23:26:33 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 77F716F527; Sat, 13 Feb 2021 23:26:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92E2E6F4D9
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Feb 2021 23:26:30 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id a5so2827911otq.4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 13 Feb 2021 15:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F2xRSYBpLxtP0BqowKQNDLCqlHX8L2UMui+Zfo2fibY=;
 b=PcThDlyN2j+RYk9P/C7C9deySV51ixgAAJOTJcGDjPDDcYz2FX1Rq+/nlVzsvEZN/R
 GJjKYVpp0VhZWsAWHKHJBvmAIASBOSffp2Yc2HFUnLHCVSAUbY0rD2j3N4GqgJi0DoSC
 msuUW5KYPPZigm53MWeHLJjXWyNqjpxspzB2LGYQ2Bo5qKo8/ssjCTDbd4wjpak9cs9s
 u5XglXYp7z/WpmLEZ4ozl+xVu0B8lH8+pRTj9LC9RXpcfSG6H1vxEus7Blpdy6DSJ/MP
 Rc5BsPHYUoCCN3nQZr6p+FIEq+gok6ICLmTnHkNdqVFRK0HLIqSQTLcLt9XRUUS+Vq4l
 eLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F2xRSYBpLxtP0BqowKQNDLCqlHX8L2UMui+Zfo2fibY=;
 b=suYiNcMzi41L9ERmt6N2CdKMF85p89BwsD+Yveroos8X+LZlf17r/LJX/LIWJncHqg
 uw8u3D/0pcF7mQ6ZiYAul/Lv765Ty/fxiLT12elXFdCZvUKfGjvor59xWT9Md0hvQ5J2
 C+Uf4uUYjq7AsQCvfvqo9w6+56nK6rHdUR2NtYivooog7BT1FfuPPyK5FxoLdZTBMcJR
 a142GfCWuYyTicxEz3+o6f2h+OxQeJ1aQI4T3woExBrw9gZW1x1eFVGTXaARxktNxUMY
 0BvRymCxPKkjyucm2+zspkK9qW+0UatAgNzpF0ldJTlUYB+v2aJVa3QLaqJSaPDrNZJC
 dD9Q==
X-Gm-Message-State: AOAM5312JKrNcvBsrFeMeB/rCN7lIuEvM4jwG0XoLt8BodbnZdh7qvD1
 IB7wexq9fuGYtZ3+TugMbt4Hf5Hh/5H+05C3Q6ovHQ==
X-Google-Smtp-Source: ABdhPJwGmYV/qixUqcx62ofGOiXLTetc5FFr0dlowUiFql0PjRCE7Z5xpBNCRgJ4IYd6Yprj/z+Bl1DC3+3lMS5jFhg=
X-Received: by 2002:a9d:151:: with SMTP id 75mr5857941otu.279.1613258789349;
 Sat, 13 Feb 2021 15:26:29 -0800 (PST)
MIME-Version: 1.0
References: <CAP_N_Z97rUvCSNoKAkxhyw9FJWQ2tJ0Wv5srHzR387j_S_6pjA@mail.gmail.com>
 <20210212090230.bai6xkx6gne53p3i@steredhat>
In-Reply-To: <20210212090230.bai6xkx6gne53p3i@steredhat>
From: "Jiang Wang ." <jiang.wang@bytedance.com>
Date: Sat, 13 Feb 2021 15:26:18 -0800
Message-ID: <CAP_N_Z-4Af_5jE7x5kSi8u=KUVUsbfDTtuD_7numL+vnkisMgQ@mail.gmail.com>
Subject: Re: [External] Re: vsock virtio: questions about supporting DGRAM type
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: cong.wang@bytedance.com, Xiongchun Duan <duanxiongchun@bytedance.com>,
 mst@redhat.com, imbrenda@linux.vnet.ibm.com, xieyongji@bytedance.com,
 stefanha@redhat.com, asias@redhat.com,
 virtualization@lists.linux-foundation.org,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>
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

On Fri, Feb 12, 2021 at 1:02 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Hi Jiang,
>
> CCing Arseny who is working on SOCK_SEQPACKET support for virtio-vsock
> [1].
>
> On Thu, Feb 11, 2021 at 10:04:34PM -0800, Jiang Wang . wrote:
> >Hi guys,
> >
> >I am working on supporting DGRAM type for virtio/vhost vsock. I
> >already did some work and a draft code is here (which passed my tests,
> >but still need some cleanup and only works from host to guest as of
> >now, will add host to guest soon):
> >https://github.com/Jiang1155/linux/commit/4e89736e0bce15496460ff411cb4694b143d1c3d
> >qemu changes are here:
> >https://github.com/Jiang1155/qemu/commit/7ab778801e3e8969ab98e44539943810a2fb03eb
> >
> >Today, I just noticed that the Asias had an old version of virtio
> >which had both dgram and stream support, see this link:
> >https://kvm.vger.kernel.narkive.com/BMvH9eEr/rfc-v2-0-7-introduce-vm-sockets-virtio-transport#post1
> >
> >But somehow, the dgram part seems never merged to upstream linux (the
> >stream part is merged). If so, does anyone know what is the reason for
> >this? Did we drop dgram support for some specific reason or the code
> >needs some improvement?
>
> I wasn't involved yet in virtio-vsock development when Asias posted that
> patches, so I don't know the exact reason.
>
> Maybe could be related on how to handle the credit mechanism for a
> connection-less sockets and how to manage the packet queue, if for
> example no one is listening.
>

I see. thanks.

> >
> >My current code differs from Asias' code in some ways. It does not use
> >credit and does not support fragmentation.  It basically adds two virt
>
> If you don't use credit, do you have some threshold when you start to
> drop packets on the RX side?
>

As of now, I don't have any threshold to drop packets on RX side. In my
view, DGRAM is like UDP and is a best effort service. If the virtual queue
is full on TX (or the available buffer size is less than the packet size),
I drop the packets on the TX side.

> >queues and re-uses the existing functions for tx and rx ( there is
>
> This make sense, some time ago I was thinking about this and also came
> to the conclusion that 2 new virtqueues were needed to handle DGRAM
> traffic.
>
Good to know.

> >somewhat duplicate code for now, but I will try to make common
> >functions to reduce it). If we still want to support dgram in upstream
> >linux, which way do you guys recommend? If necessary, I can try to
> >base on Asias' old code and continue working on it. If there is
> >anything unclear, just let me know. Thanks.
>
> A problem I see is how to handle multiple transports to support nested
> VMs. Since the sockets are not connected, we can't assign them to a
> single transport.
>

I did not consider the nested VMs when I started working on this. I
just checked your
nested VM support patch, and I agree it is harder to support it for DGRAM. One
idea is that we can also prepare two transport layers for DGRAM (
similar to STREAM)
and assign transport for every DGRAM packet. The downside is that it will
introduce some overhead. I will think about it more.

> Arseny is working on SOCK_SEQPACKET [1], it's similar to DGRAM, but it
> is connection oriented, so we can reuse most of the STREAM stuff and
> also the credit mechanism.
>
> Maybe you can reuse some of the Arseny's stuff to handle the
> fragmentation.

Sure. I will check Arseny's patch.

> For the channel type (lossless) I think SEQPACKET makes more sense, but
> if you have any use-cases for DGRAM and want to support it, you are
> welcome to send patches and I will be happy to review them.
>
Got it. Thanks. We have some use cases for DGRAM. Basically, we send some
kind of non-critical logging data from guest to the host. It is one way
communication and does not require reliable delivery.  I will continue
working on the patch and send it out for review when it is ready.
Thanks again for all the inputs.

> Thanks,
> Stefano
>
> [1]
> https://lore.kernel.org/lkml/20210207151451.804498-1-arseny.krasnov@kaspersky.com/T/#m81d3ee4ccd54cd301b92c00b3b1bca6e7bc91fc9
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
